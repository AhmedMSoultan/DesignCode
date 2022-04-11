//
//  CoursesViewController.swift
//  DesignCode-UIKit
//
//  Created by Ahmed Soultan on 01/04/2022.
//

import UIKit
import Combine

class CoursesViewController: UIViewController {

    var course: Course?
    
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var iconImageView: CustomImageView!
    @IBOutlet weak var menuBtn: UIButton!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var sectionsTableView: UITableView!
    @IBOutlet weak var sectionsTableViewHeight: NSLayoutConstraint!
    private var tokens: Set<AnyCancellable> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionsTableView.delegate = self
        sectionsTableView.dataSource = self
        
        sectionsTableView.publisher(for: \.contentSize).sink { newContentSize in
            self.sectionsTableViewHeight.constant = newContentSize.height
        }
        .store(in: &tokens)
        
        //Set data for the preview card
        self.iconImageView.image = course?.courseIcon
        self.bannerImage.image = course?.courseBanner
        self.backgroundImage.image = course?.courseBackground
        self.titleLabel.text = course?.courseTitle
        self.subtitleLabel.text = course?.courseSubtitle
        self.descriptionLabel.text = course?.courseDescription
        self.authorLabel.text = "Taught By \(course?.courseAuthor?.formatted(.list(type: .and , width: .standard)) ?? "Ahmed Soultan" )"
        
        //Create Menu
        
        let menu = UIMenu(
                          options: .displayInline,
                          children: [
                          
                            UIAction(title: "Share",
                                     image: UIImage(systemName: "square.and.arrow.up"),
                                     handler: { action in
                                         //  Share course
                                     }),
                            UIAction(title: "Take Test",
                                     image: UIImage(systemName: "highlighter"),
                                     handler: { action in
                                         // Take Course Test
                                     }),
                            UIAction(title: "Download",
                                     image: UIImage(systemName: "square.and.arrow.down"),
                                     handler: { action in
                                         // Download Course
                                     }),
                            UIAction(title: "Forums",
                                     image: UIImage(systemName: "chevron.left.forwardslash.chevron.right"),
                                     handler: { action in
                                         //Forums
                                     })
                          ])
        menuBtn.showsMenuAsPrimaryAction = true
        menuBtn.menu = menu
        
        
        //Accessibility
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = UIFont.preferredFont(for: .headline, weight: .bold)
        titleLabel.maximumContentSizeCategory = .extraExtraLarge
        
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.font = UIFont.preferredFont(for: .caption1, weight: .semibold)
        subtitleLabel.maximumContentSizeCategory = .extraLarge
        
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.font = UIFont.preferredFont(for: .caption2, weight: .regular)
        descriptionLabel.maximumContentSizeCategory = .extraLarge
        
        authorLabel.adjustsFontForContentSizeCategory = true
        authorLabel.font = UIFont.preferredFont(for: .caption2, weight: .regular)
        authorLabel.maximumContentSizeCategory = .extraLarge
        
    }
    
    @IBAction func closeBtnAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    

}

extension CoursesViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.course?.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell") as! SectionTableViewCell
        if let selectedCourse = course {
            let selectedSection = selectedCourse.sections![indexPath.row]
            cell.titleLabel.text = selectedSection.sectionTitle
            cell.subtitleLabel.text = selectedSection.sectionSubtitle
            cell.descriptionLabel.text = selectedSection.sectionDescription
            cell.courseLogo.image = selectedSection.sectionIcon
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
