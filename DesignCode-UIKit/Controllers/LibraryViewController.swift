//
//  LibraryViewController.swift
//  DesignCode-UIKit
//
//  Created by Ahmed Soultan on 26/04/2022.
//

import UIKit
import Combine
import SwiftUI

class LibraryViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var sectionsCollectionView: UICollectionView!
    @IBOutlet weak var topicsTableView: UITableView!
    @IBOutlet weak var topicsTableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var certificatesLabel: UILabel!
    
    private var tokens: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionsCollectionView.delegate = self
        sectionsCollectionView.dataSource = self
        sectionsCollectionView.layer.masksToBounds = false
        
        topicsTableView.dataSource = self
        topicsTableView.delegate = self
        topicsTableView.layer.masksToBounds = false
        topicsTableView.publisher(for: \.contentSize).sink { newContentSize in
            self.topicsTableViewHeight.constant = newContentSize.height
        }
        .store(in: &tokens)
        
        
        // Accessibility
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = UIFont.preferredFont(for: .title1, weight: .bold)
        titleLabel.maximumContentSizeCategory = .accessibilityLarge
        
        certificatesLabel.adjustsFontForContentSizeCategory = true
        certificatesLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
        certificatesLabel.maximumContentSizeCategory = .accessibilityMedium
    } 
    
    @IBSegueAction func createCertificatesView(_ coder: NSCoder) -> UIViewController? {
        let v = UIHostingController(coder: coder, rootView: CertificateView())!
        v.view.backgroundColor = .clear
        return v
    }
    
}


extension LibraryViewController: UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionCell", for: indexPath) as! SectionsCollectionViewCell
        
        let section = sections[indexPath.item]
        
        cell.titleLabel.text = section.sectionTitle
        cell.subtitleLabel.text = section.sectionSubtitle
        cell.logo.image = section.sectionIcon
        cell.banner.image = section.sectionBanner
        
        return cell
    }
}

extension LibraryViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell") as! TopicsTableViewCell
        
        let setting = librarySettings[indexPath.row]
        
        cell.topicLabel.text = setting.topicName
        cell.topicIcon.image = UIImage(systemName: setting.topicSymbol)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
