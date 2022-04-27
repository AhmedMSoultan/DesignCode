//
//  NotificationTableViewCell.swift
//  DesignCode-UIKit
//
//  Created by Ahmed Soultan on 27/04/2022.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var notificationImage: CustomImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Accessibility
        
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = UIFont.preferredFont(for: .headline, weight: .bold)
        titleLabel.maximumContentSizeCategory = .extraExtraLarge
        
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.font = UIFont.preferredFont(for: .caption1, weight: .semibold)
        subtitleLabel.maximumContentSizeCategory = .extraLarge
        
        messageLabel.adjustsFontForContentSizeCategory = true
        messageLabel.font = UIFont.preferredFont(for: .caption1, weight: .regular)
        messageLabel.maximumContentSizeCategory = .extraLarge
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
