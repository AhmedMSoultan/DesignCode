//
//  SectionTableViewCell.swift
//  DesignCode-UIKit
//
//  Created by Ahmed Soultan on 02/04/2022.
//

import UIKit

class SectionTableViewCell: UITableViewCell {

    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var courseLogo: CustomImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Accessibility
        
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = UIFont.preferredFont(for: .headline, weight: .bold)
        titleLabel.maximumContentSizeCategory = .extraExtraLarge
        
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.font = UIFont.preferredFont(for: .caption1, weight: .semibold)
        subtitleLabel.maximumContentSizeCategory = .extraLarge
        
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.font = UIFont.preferredFont(for: .caption1, weight: .regular)
        descriptionLabel.maximumContentSizeCategory = .extraLarge
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
