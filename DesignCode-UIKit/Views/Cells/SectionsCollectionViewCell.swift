//
//  SectionCollectionViewCell.swift
//  DesignCode-UIKit
//
//  Created by Ahmed Soultan on 09/04/2022.
//

import UIKit

class SectionsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var logo: CustomImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    
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
        
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = UIFont.preferredFont(for: .body, weight: .bold)
        titleLabel.maximumContentSizeCategory = .extraExtraLarge
        
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.font = UIFont.preferredFont(for: .caption1, weight: .regular)
        subtitleLabel.maximumContentSizeCategory = .extraLarge
    }
    
    override public func prepareForReuse() {
        super.prepareForReuse()
    }
}
