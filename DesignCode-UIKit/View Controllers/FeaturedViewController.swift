//
//  ViewController.swift
//  DesignCode-UIKit
//
//  Created by Ahmed Soultan on 30/03/2022.
//

import UIKit
import Combine

class FeaturedViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var coursesCollectionView: UICollectionView!
    
    @IBOutlet weak var featuredTitle: UILabel!
    @IBOutlet weak var featuredSubtitle: UILabel!
    @IBOutlet weak var featuredDescription: UILabel!
    
    @IBOutlet weak var recentHandbooksLabel: UILabel!
    @IBOutlet weak var recentCoursesLabel: UILabel!
    
    @IBOutlet weak var coursesTableView: UITableView!
    @IBOutlet weak var coursesTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var tokens: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coursesCollectionView.delegate = self
        coursesCollectionView.dataSource = self
        coursesCollectionView.layer.masksToBounds = false
        
        coursesTableView.dataSource = self
        coursesTableView.delegate = self
        coursesTableView.layer.masksToBounds = false
        
        coursesTableView.publisher(for: \.contentSize).sink { newContentSize in
            self.coursesTableViewHeight.constant = newContentSize.height
        }
        .store(in: &tokens)
        
        scrollView.delegate = self
        
        //Accessibility
        featuredTitle.adjustsFontForContentSizeCategory = true
        featuredTitle.font = UIFont.preferredFont(for: .title1, weight: .bold)
        featuredTitle.maximumContentSizeCategory = .accessibilityExtraLarge
        
        featuredSubtitle.adjustsFontForContentSizeCategory = true
        featuredSubtitle.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
        featuredSubtitle.maximumContentSizeCategory = .accessibilityMedium
        
        featuredDescription.adjustsFontForContentSizeCategory = true
        featuredDescription.font = UIFont.preferredFont(for: .footnote, weight: .regular)
        featuredDescription.maximumContentSizeCategory = .accessibilityMedium
        
        recentHandbooksLabel.adjustsFontForContentSizeCategory = true
        recentHandbooksLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
        recentHandbooksLabel.maximumContentSizeCategory = .accessibilityMedium
        
        recentCoursesLabel.adjustsFontForContentSizeCategory = true
        recentCoursesLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
        recentCoursesLabel.maximumContentSizeCategory = .accessibilityMedium
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? CoursesViewController , let course = sender as? Course{
            detailsVC.course = course
        }
    }
}

extension FeaturedViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return handbooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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

extension FeaturedViewController : UITableViewDelegate , UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesTableCell") as! CoursesTableViewCell
        let course = courses[indexPath.section]
        cell.courseTitle.text = course.courseTitle
        cell.courseSubtitle.text = course.courseSubtitle
        cell.courseDescription.text = course.courseDescription
        cell.courseBackground.image = course.courseBackground
        cell.courseBanner.image = course.courseBanner
        cell.courseLogo.image = course.courseIcon
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else{
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCourse = courses[indexPath.section]
        performSegue(withIdentifier: "presentCourse", sender: selectedCourse)
    }
    
}

extension FeaturedViewController: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentHeight = scrollView.contentSize.height
        let lastScrollPos = scrollView.contentOffset.y
        
        let scrollPrecentage = lastScrollPos / contentHeight
        if scrollPrecentage <= 0.14 {
            self.title = "Featured"
        }else if scrollPrecentage <= 0.28 {
            self.title = "Handbooks"
        }else{
            self.title = "Courses"
        }
    }
}


