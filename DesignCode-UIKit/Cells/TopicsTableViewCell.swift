//
//  TopicsTableViewCell.swift
//  DesignCode-UIKit
//
//  Created by Ahmed Soultan on 09/04/2022.
//

import UIKit

class TopicsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var topicIcon: UIImageView!
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        super.layoutIfNeeded()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 30
        layer.cornerCurve = .continuous
        layer.shadowColor = UIColor(named: "Shadow")?.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.masksToBounds = false
        
        // Accessibility
        
        topicLabel.adjustsFontForContentSizeCategory = true
        topicLabel.font = UIFont.preferredFont(for: ., weight: .bold)
        topicLabel.maximumContentSizeCategory = .accessibilityExtraLarge
         
    }
    
    override public func prepareForReuse() {
        super.prepareForReuse()
    }
}
