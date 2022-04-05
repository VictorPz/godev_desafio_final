//
//  Colors.swift
//  godev_projeto_final
//
//  Created by SP11793 on 05/04/22.
//

import UIKit

extension UIColor {
    
    /// Represents the default color of all warning labels in application
    static let defaultWarningLabelColor = UIColor(dynamicProvider: { traitCollection in
        switch traitCollection.userInterfaceStyle {
        case .dark:
            return #colorLiteral(red: 0.7635920644, green: 0.9283742309, blue: 0.798014462, alpha: 1)
        case .light:
            return #colorLiteral(red: 0.4568499923, green: 0.600153327, blue: 0.763335526, alpha: 1)
        case .unspecified:
            return UIColor.clear
        @unknown default:
            return UIColor.clear
        }
    })
    
    /// Represents the default color of all tableview separators  in application
    static let defaultTableViewSeparatorColor = UIColor(dynamicProvider: { traitCollection in
        switch traitCollection.userInterfaceStyle {
        case .dark:
            return #colorLiteral(red: 0.7635920644, green: 0.9283742309, blue: 0.798014462, alpha: 1)
        case .light:
            return #colorLiteral(red: 0.4568499923, green: 0.600153327, blue: 0.763335526, alpha: 1)
        case .unspecified:
            return UIColor.clear
        @unknown default:
            return UIColor.clear
        }
    })
    
    /// Represents the default color of all backgrounds in application
    static let defaultBackgroundColor = UIColor.systemBackground
    
    /// Represents the default color of all tint colors in application
    static let defaultTintColor = UIColor(dynamicProvider: { traitCollection in
        switch traitCollection.userInterfaceStyle {
        case .dark:
            return #colorLiteral(red: 0.7635920644, green: 0.9283742309, blue: 0.798014462, alpha: 1)
        case .light:
            return #colorLiteral(red: 0.4568499923, green: 0.600153327, blue: 0.763335526, alpha: 1)
        case .unspecified:
            return UIColor.clear
        @unknown default:
            return UIColor.clear
        }
    })
    
    /// Represents the default color of all tab bar unselected item in application
    static let defaultTabBarUnselectedItemTintColor = UIColor(dynamicProvider: { traitCollection in
        switch traitCollection.userInterfaceStyle {
        case .dark:
            return #colorLiteral(red: 0.7635920644, green: 0.9283742309, blue: 0.798014462, alpha: 1)
        case .light:
            return #colorLiteral(red: 0.4568499923, green: 0.600153327, blue: 0.763335526, alpha: 1)
        case .unspecified:
            return UIColor.clear
        @unknown default:
            return UIColor.clear
        }
    })
    
    /// Represents the default color of all tab bar selected item in application
    static let defaultTabBarSelectedItemTintColor = UIColor(dynamicProvider: { traitCollection in
        switch traitCollection.userInterfaceStyle {
        case .dark:
            return #colorLiteral(red: 0.2066053748, green: 0.8166291118, blue: 0.3457493186, alpha: 1)
        case .light:
            return #colorLiteral(red: 0.1109849289, green: 0.2822838426, blue: 0.4648215771, alpha: 1)
        case .unspecified:
            return UIColor.clear
        @unknown default:
            return UIColor.clear
        }
    })
    
    /// Represents the default color of all navigation controller title in application
    static let defaultNavControllerTitleColor = UIColor(dynamicProvider: { traitCollection in
        switch traitCollection.userInterfaceStyle {
        case .dark:
            return #colorLiteral(red: 0.7635920644, green: 0.9283742309, blue: 0.798014462, alpha: 1)
        case .light:
            return #colorLiteral(red: 0.4568499923, green: 0.600153327, blue: 0.763335526, alpha: 1)
        case .unspecified:
            return UIColor.clear
        @unknown default:
            return UIColor.clear
        }
    })
    
    /// Represents the default color of all title labels in application
    static let defaultTitleLabelColor = UIColor.label
    
    /// Represents the default color of all sub title labels in application
    static let defaultSubTitleLabelColor = UIColor.label
    
    /// Represents the default color of all body labels in application
    static let defaultBodyLabelColor = UIColor(dynamicProvider: { traitCollection in
        switch traitCollection.userInterfaceStyle {
        case .dark:
            return .lightGray
        case .light:
            return .darkGray
        case .unspecified:
            return UIColor.clear
        @unknown default:
            return UIColor.clear
        }
    })
    
    /// Represents the default color of all icons in application
    static let defaultIconTintColor = UIColor.label
    
    /// Represents the default color of all button foregrounds in application
    static let defaultButtonForegroundColor = UIColor.label
    
    /// Represents the default color of all button backgrounds in application
    static let defaultButtonBackgroundColor = UIColor.systemBackground
    
    
}
