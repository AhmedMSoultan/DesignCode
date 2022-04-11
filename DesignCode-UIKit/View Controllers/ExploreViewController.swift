//
//  ExploreViewController.swift
//  DesignCode-UIKit
//
//  Created by Ahmed Soultan on 09/04/2022.
//

import UIKit
import Combine

class ExploreViewController: UIViewController {
    
    @IBOutlet weak var recentLabel: UILabel!
    
    @IBOutlet weak var sectionsCollectionView: UICollectionView!
    @IBOutlet weak var topicsTableView: UITableView!
    @IBOutlet weak var topicsTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var topicsLabel: UILabel!
    @IBOutlet weak var popularLabel: UILabel!
    
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
        
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.layer.masksToBounds = false
        
        // Accessibility
        recentLabel.adjustsFontForContentSizeCategory = true
        recentLabel.font = UIFont.preferredFont(for: .title1, weight: .bold)
        recentLabel.maximumContentSizeCategory = .accessibilityLarge
        
        topicsLabel.adjustsFontForContentSizeCategory = true
        topicsLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
        topicsLabel.maximumContentSizeCategory = .accessibilityMedium
        
        popularLabel.adjustsFontForContentSizeCategory = true
        popularLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
        popularLabel.maximumContentSizeCategory = .accessibilityMedium
    }

}

extension ExploreViewController: UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sectionsCollectionView {
            return sections.count
        }else{
            return handbooks.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sectionsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionCell", for: indexPath) as! SectionsCollectionViewCell
            
            let section = sections[indexPath.item]
            
            cell.titleLabel.text = section.sectionTitle
            cell.subtitleLabel.text = section.sectionSubtitle
            cell.logo.image = section.sectionIcon
            cell.banner.image = section.sectionBanner
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! CourseCollectionViewCell
            
            let handbook = handbooks[indexPath.item]
            
            cell.titleLabel.text = handbook.courseTitle
            cell.subtitleLabel.text = handbook.courseSubtitle
            cell.descriptionLabel.text = handbook.courseDescription
            cell.gradient.colors = handbook.courseGradient
            cell.logo.image = handbook.courseIcon
            cell.banner.image = handbook.courseBanner
            
            return cell
        }
    }
}

extension ExploreViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell") as! TopicsTableViewCell
        
        let topic = topics[indexPath.row]
        
        cell.topicLabel.text = topic.topicName
        cell.topicIcon.image = UIImage(systemName: topic.topicSymbol)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
