//
//  Course.swift
//  DesignCode-UIKit
//
//  Created by Ahmed Soultan on 01/04/2022.
//

import UIKit

class Course {
    var courseTitle : String
    var courseSubtitle : String
    var courseDescription : String
    var courseIcon : UIImage
    var courseBanner : UIImage
    var courseAuthor : [String]?
    var courseGradient : [CGColor]?
    var courseBackground : UIImage?
    var sections: [Section]?

    
    init(title: String!, subtitle: String!, description: String!, icon: UIImage!, banner: UIImage!, authors: [String]? = nil, gradient: [CGColor]? = nil, background: UIImage? = nil  , sections: [Section] ) {
        self.courseTitle = title
        self.courseSubtitle = subtitle
        self.courseDescription = description
        self.courseIcon = icon
        self.courseBanner = banner
        self.courseAuthor = authors
        self.courseGradient = gradient
        self.courseBackground = background
        self.sections = sections
    }
}

let handbooks = [
    Course(title: NSLocalizedString("SwiftUI Course", comment: "SwiftUI Course"), subtitle: NSLocalizedString("80 Sections - 9 Hours", comment: "80 Sections - 9 Hours"), description: NSLocalizedString("Build an iOS app for iOS 15 with custom layouts, animations and more", comment: "Build an iOS app for iOS 15 with custom layouts, animations and more") , icon: UIImage(named: "Logo SwiftUI"), banner: UIImage(named: "Illustration 2"), authors: ["Ahmed Soultan"], gradient: [UIColor(red: 0.387, green: 0.041, blue: 0.55, alpha: 1.0).cgColor,UIColor(red: 0.251, green: 0.555, blue: 0.835, alpha: 1.0).cgColor], sections: sections),
    Course(title: NSLocalizedString("React Course", comment: "React Course"), subtitle: NSLocalizedString("30 Sections - 3 Hours", comment: "30 Sections - 3 Hours"), description: NSLocalizedString("a comprehensive series of tutorials on React Hooks and more", comment: "a comprehensive series of tutorials on React Hooks and more"), icon: UIImage(named: "Logo React"), banner: UIImage(named: "Illustration 4"), authors: [NSLocalizedString("Ahmed Soultan , Momen Soultan", comment: "Ahmed Soultan , Momen Soultan")], gradient: [UIColor(red: 0.51, green: 0.255, blue: 0.737, alpha: 1.0).cgColor,UIColor(red: 0.883, green: 0.283, blue: 0.523, alpha: 1.0).cgColor,UIColor(red: 0.984, green: 0.647, blue: 0.545, alpha: 1.0).cgColor], sections: sections)
]

let courses = [
    Course(title: NSLocalizedString("Flutter Course", comment: "Flutter Course"), subtitle: NSLocalizedString("80 Sections - 9 Hours", comment: "80 Sections - 9 Hours"), description: NSLocalizedString("Build an Flutter app with custom layouts, animations and more", comment: "Build an Flutter app with custom layouts, animations and more"), icon: UIImage(named: "Logo Flutter"), banner: UIImage(named: "Illustration 3"), authors: [NSLocalizedString("Ahmed Soultan", comment: "Ahmed Soultan")], background: UIImage(named: "Background 5"), sections: sections),
    Course(title: NSLocalizedString("SwiftUI Course", comment: "SwiftUI Course"), subtitle: NSLocalizedString("80 Sections - 9 Hours", comment: "80 Sections - 9 Hours"), description: NSLocalizedString("Build an iOS app for iOS 15 with custom layouts, animations and more", comment: "Build an iOS app for iOS 15 with custom layouts, animations and more"), icon: UIImage(named: "Logo SwiftUI"), banner: UIImage(named: "Illustration 1"), authors: [NSLocalizedString("Ahmed Soultan", comment: "Ahmed Soultan")], background: UIImage(named: "Background 4"), sections: sections),
    Course(title: NSLocalizedString("React Course", comment: "React Course"), subtitle: NSLocalizedString("30 Sections - 3 Hours", comment: "30 Sections - 3 Hours"), description: NSLocalizedString("a comprehensive series of tutorials on React Hooks and more", comment: "a comprehensive series of tutorials on React Hooks and more"), icon: UIImage(named: "Logo React"), banner: UIImage(named: "Illustration 2"), authors: [NSLocalizedString("Ahmed Soultan , Momen Soultan", comment: "Ahmed Soultan , Momen Soultan")], background: UIImage(named: "Background 3"), sections: sections),
    Course(title: NSLocalizedString("React Course", comment: "React Course"), subtitle: NSLocalizedString("30 Sections - 3 Hours", comment: "30 Sections - 3 Hours"), description: NSLocalizedString("a comprehensive series of tutorials on React Hooks and more", comment: "a comprehensive series of tutorials on React Hooks and more"), icon: UIImage(named: "Logo React"), banner: UIImage(named: "Illustration 4"), authors: [NSLocalizedString("Ahmed Soultan , Momen Soultan", comment: "Ahmed Soultan , Momen Soultan")], background: UIImage(named: "Background 5"), sections: sections)
]
