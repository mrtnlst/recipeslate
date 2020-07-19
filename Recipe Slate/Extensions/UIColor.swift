//
//  UIColor.swift
//  Recipe Slate
//
//  Created by Martin List on 13.06.20.
//  Copyright © 2020 Martin List. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static let primary = #colorLiteral(red: 0.01564535871, green: 0.5639410615, blue: 0.8256648183, alpha: 1)
    
    static var navigationBarColor: UIColor {
        return UIColor { (traitCollection: UITraitCollection) -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                return #colorLiteral(red: 0.06945572793, green: 0.08589795977, blue: 0.09760636836, alpha: 1)
            } else {
                return primary
            }
        }
    }
    
    static var defaultBackground: UIColor {
        return UIColor { (traitCollection: UITraitCollection) -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                return .black
            } else {
                return #colorLiteral(red: 0.1560722589, green: 0.1952099502, blue: 0.2177425027, alpha: 1)
            }
        }
    }
    
    static var tabBarColor: UIColor {
        return UIColor { (traitCollection: UITraitCollection) -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                return #colorLiteral(red: 0.06945572793, green: 0.08589795977, blue: 0.09760636836, alpha: 1)
            } else {
                return #colorLiteral(red: 0.2917906959, green: 0.3654295056, blue: 0.408573721, alpha: 1)
            }
        }
    }
    
    static var tableHeaderViewColor: UIColor {
        return UIColor { (traitCollection: UITraitCollection) -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                return #colorLiteral(red: 0.06945572793, green: 0.08589795977, blue: 0.09760636836, alpha: 1)
            } else {
                return #colorLiteral(red: 0.137254902, green: 0.168627451, blue: 0.1921568627, alpha: 1)
            }
        }
    }
    
    static var tableViewCellSelectedColor: UIColor {
        return UIColor { (traitCollection: UITraitCollection) -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                return #colorLiteral(red: 0.1249041632, green: 0.1560384035, blue: 0.1747172475, alpha: 1)
            } else {
                return #colorLiteral(red: 0.2117647059, green: 0.2666666667, blue: 0.2980392157, alpha: 1)
            }
        }
    }
    
    static var seperatorColor: UIColor {
        return UIColor { (traitCollection: UITraitCollection) -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                return #colorLiteral(red: 0.06945572793, green: 0.08589795977, blue: 0.09760636836, alpha: 1)
            } else {
                return #colorLiteral(red: 0.2117647059, green: 0.2666666667, blue: 0.2980392157, alpha: 1)
            }
        }
    }
    
    static var searchBarBackgroundColor: UIColor {
        return UIColor { (traitCollection: UITraitCollection) -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                return #colorLiteral(red: 0.06945572793, green: 0.08589795977, blue: 0.09760636836, alpha: 1)
            } else {
                return #colorLiteral(red: 0.01713882573, green: 0.3089093566, blue: 0.4661796689, alpha: 1)
            }
        }
    }
    
    static var pickerSelectionIndicatorColor: UIColor {
        return UIColor { (traitCollection: UITraitCollection) -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                return #colorLiteral(red: 0.1091342941, green: 0.1350534856, blue: 0.1534548402, alpha: 0.5)
            } else {
                return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.05017605629)
            }
        }
    }
    
    static var tableHeaderBackgroundColor: UIColor {
        return UIColor { (traitCollection: UITraitCollection) -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                return .black
            } else {
                return #colorLiteral(red: 0.137254902, green: 0.168627451, blue: 0.1921568627, alpha: 1)
            }
        }
    }
    
    static var segmentedControlViewColor: UIColor {
        return UIColor { (traitCollection: UITraitCollection) -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                return #colorLiteral(red: 0.115988113, green: 0.1435465515, blue: 0.1631040275, alpha: 0.7958021567)
            } else {
                return #colorLiteral(red: 0.2117647059, green: 0.2666666667, blue: 0.2980392157, alpha: 1)
            }
        }
    }
    
    static let secondaryTextColor = #colorLiteral(red: 0.7233663201, green: 0.7233663201, blue: 0.7233663201, alpha: 1)
    
    static let rupeeGreen = #colorLiteral(red: 0.6274509804, green: 0.768627451, blue: 0.3568627451, alpha: 1)
    static let rupeeBlue = #colorLiteral(red: 0.3058823529, green: 0.6078431373, blue: 0.9176470588, alpha: 1)
    static let rupeeRed = #colorLiteral(red: 0.9176470588, green: 0.3058823529, blue: 0.2745098039, alpha: 1)
    static let rupeePurple = #colorLiteral(red: 0.8392156863, green: 0.2862745098, blue: 0.8666666667, alpha: 1)
    static let rupeeGold = #colorLiteral(red: 0.9333333333, green: 0.8352941176, blue: 0.3333333333, alpha: 1)
    static let rupeeSilver = #colorLiteral(red: 0.8431372549, green: 0.8431372549, blue: 0.8431372549, alpha: 1)
    
    static let cream = #colorLiteral(red: 0.8914693594, green: 0.8615709543, blue: 0.7523322105, alpha: 1)
    static let listFavorite = #colorLiteral(red: 1, green: 0.8285928965, blue: 0.358022213, alpha: 1)
    
    static let raw = #colorLiteral(red: 0.8875828385, green: 0.1409120858, blue: 0.1922748089, alpha: 1)
    static let cooked = #colorLiteral(red: 0.9923481345, green: 0.7908546329, blue: 0.7353751063, alpha: 1)
    static let frozen = #colorLiteral(red: 0.6704457402, green: 0.9631159902, blue: 1, alpha: 1)
    static let roasted = #colorLiteral(red: 0.491933167, green: 0.2530207634, blue: 0.2546983659, alpha: 1)
}
