//
//  Metrics.swift
//  godev_projeto_final
//
//  Created by SP11793 on 05/04/22.
//

import UIKit

struct Metrics {
    
    struct Margin {
        
        /// Represents the default top constraints  in application
        static let defaultTop: CGFloat = 16
        
        /// Represents the default leading constraints  in application
        static let defaultLeading: CGFloat = 16
        
        /// Represents the default trailing constraints  in application
        static let defaultTrailing: CGFloat = -16
        
        /// Represents the default bottom constraints  in application
        static let defaultBottom: CGFloat = -16
    }
    
    struct Height {
        
        /// Represents the default height of all tableview rows in application
        static let defaultHeightForRowAt: CGFloat = 93
        
        /// Represents the default height of all cell images in application
        static let defaultHeightCellImage: CGFloat = 85
        
        /// Represents the default height of all images in application
        static let defaultHeightImage: CGFloat = 150
        
        /// Represents the default height of all icons in application
        static let defaultHeightIcon: CGFloat = 30
        
        /// Represents the default height of all buttons in application
        static let defaultHeightButton: CGFloat = 45
    }
    
    struct Width {
        /// Represents the default width of all cell images  in application
        static let defaultWidthCellImage: CGFloat = 85
        
        /// Represents the default width of all images in application
        static let defaultWidthImage: CGFloat = 150
        
        /// Represents the default width of all icons in application
        static let defaultWidthIcon: CGFloat = 30
    }
    
    struct Radius {
        
        /// Represents the default corner radius of all images in application
        static let defaultImageCornerRadius: CGFloat = 42.5
    }
}
