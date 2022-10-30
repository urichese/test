//
//  Constants.swift
//  testProject
//
//  Created by urichese on 26.10.2022.
//

import Foundation
import UIKit

struct Constants {

    static let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
    
    static let userViewInsets = UIEdgeInsets(top: barHeight + 20, left: 20, bottom: 20, right: 20)
    static let userViewHeight: CGFloat = 210
    
    static let childViewInsets = UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
    
    static let userDescriptionLabelHeight: CGFloat = 20
    static let userDescriptionLabelWidth: CGFloat = 200
    
    // nameView Constants
    static let nameViewInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    static let nameViewHeight: CGFloat = 75
    
    static let nameLabelInsets = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0)
    
    static let nameTextFieldInsets = UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10)
    static let nameTextFieldHeight: CGFloat = 25
    
    
//frame: CGRect(x: 10, y: Constants.barHeight + 50, width: Constants.displayWidth - 20, height: 75))
//    static let postLabelInsets = UIEdgeInsets(top: 8 + Constants.topViewHeight + 8, left: 8, bottom: 8, right: 8)
//    static let postLabelFont = UIFont.systemFont(ofSize: 15)
//    static let topViewHeight: CGFloat = 36
//
//    static let bottomViewHeight: CGFloat = 44
//
//    static let bottomViewViewHeight: CGFloat = 44
//    static let bottomViewViewWidth: CGFloat = 80
//    static let bottomViewViewsIconSize: CGFloat = 24
//
//    static let minifiedPostLimitLines: CGFloat = 6
//    static let minifiedPostLines: CGFloat = 4
//
//    static let moreTextButtonInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
//    static let moreTextButtonSize = CGSize(width: 170, height: 30)
    
}
