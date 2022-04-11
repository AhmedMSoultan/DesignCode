//
//  CoursesTableViewCell.swift
//  DesignCode-UIKit
//
//  Created by Ahmed Soultan on 01/04/2022.
//

import UIKit

class CoursesTableViewCell: UITableViewCell {

    @IBOutlet weak var courseBackground: UIImageView!
    @IBOutlet weak var courseBanner: UIImageView!
    @IBOutlet weak var courseLogo: UIImageView!
    
    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var courseSubtitle: UILabel!
    @IBOutlet weak var courseDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 10
        layer.masksToBounds = false
        layer.cornerRadius = 30
        layer.cornerCurve = .continuous
        
        // Accessibility
        courseTitle.adjustsFontForContentSizeCategory = true
        courseTitle.font = UIFont.preferredFont(for: .title1, weight: .bold)
        courseTitle.maximumContentSizeCategory = .extraExtraLarge
        
        courseSubtitle.adjustsFontForContentSizeCategory = true
        courseSubtitle.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
        courseSubtitle.maximumContentSizeCategory = .extraLarge
        
        courseDescription.adjustsFontForContentSizeCategory = true
        courseDescription.font = UIFont.preferredFont(for: .footnote, weight: .regular)
        courseDescription.maximumContentSizeCategory = .extraLarge
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }

}
