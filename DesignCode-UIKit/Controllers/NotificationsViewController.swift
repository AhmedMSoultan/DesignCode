//
//  NotificationsViewController.swift
//  DesignCode-UIKit
//
//  Created by Ahmed Soultan on 27/04/2022.
//

import UIKit
import Combine
import FirebaseFirestore

class NotificationsViewController: UIViewController {

    @IBOutlet weak var notificationsTableView: UITableView!
    @IBOutlet weak var cardView: CustomView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    
    var dataSource: UITableViewDiffableDataSource<TBSection , NotificationModel>! = nil
    var currentSnapshot: NSDiffableDataSourceSnapshot<TBSection , NotificationModel>! = nil
    private var tokens: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        notificationsTableView.publisher(for: \.contentSize).sink { newContentSize in
            self.tableViewHeight.constant = newContentSize.height
        }
        .store(in: &tokens)
        
        notificationsTableView.delegate = self
        
        //Configure Data source
        
        self.dataSource = UITableViewDiffableDataSource<TBSection , NotificationModel>(tableView: notificationsTableView)
        {
            (tableView: UITableView , indexPath: IndexPath , item: NotificationModel) -> NotificationTableViewCell in
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as? NotificationTableViewCell else {
                fatalError("Can't create new cell")
            }
            cell.titleLabel.text = item.title
            cell.subtitleLabel.text = item.subtitle
            cell.messageLabel.text = item.message
            cell.notificationImage.image = UIImage(named: item.image)
            return cell
        }
        self.dataSource.defaultRowAnimation = .fade
        
        Task{
            do {
                try await loadData()
            } catch let error {
                print(error)
            }
        }
    }
    
    func loadData() async throws{
        currentSnapshot = NSDiffableDataSourceSnapshot<TBSection , NotificationModel>()
        currentSnapshot.appendSections([.main])
        
        let docs = try await  Firestore.firestore().collection("notifications")
            .order(by: "sentAt", descending: false)
            .getDocuments()
        var notifications = [NotificationModel]()
        
        for snapshot in docs.documents {
            if let data = try snapshot.data(as: NotificationModel?.self) {
                notifications.append(data)
            }
        }
        
        self.currentSnapshot.appendItems(notifications, toSection: .main)
        await self.dataSource.apply(currentSnapshot, animatingDifferences: true)
    }
}



extension NotificationsViewController:UITableViewDelegate {

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return sampleNotifications.count
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
