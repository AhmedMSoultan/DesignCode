//
//  CourseCollectionViewCell.swift
//  DesignCode-UIKit
//
//  Created by Ahmed Soultan on 31/03/2022.
//

import UIKit

class CourseCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var overlay: UIView!
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var logo: CustomImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let gradient = CAGradientLayer()
    
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
        
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = overlay.frame
        gradient.cornerCurve = .continuous
        gradient.cornerRadius = 30
        
        overlay.layer.insertSublayer(gradient, at: 0)
        overlay.layer.cornerCurve = .continuous
        overlay.layer.cornerRadius = 30
        
        // Accessibility
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = UIFont.preferredFont(for: .title1, weight: .bold)
        titleLabel.maximumContentSizeCategory = .accessibilityExtraLarge
        
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
        subtitleLabel.maximumContentSizeCategory = .accessibilityMedium
        
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.font = UIFont.preferredFont(for: .footnote, weight: .regular)
        descriptionLabel.maximumContentSizeCategory = .accessibilityMedium
        
    }
    
    override public func prepareForReuse() {
        super.prepareForReuse()
    }
}
