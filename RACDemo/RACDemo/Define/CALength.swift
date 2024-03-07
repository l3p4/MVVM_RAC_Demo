//
//  CALength.swift
//  BRB_mPaaS
//
//  Created by Emmanuel Salonga on 3/3/23.
//  Copyright © 2023 Alibaba. All rights reserved.
//

import Foundation
import UIKit

// Global Method for Scaling CGFloats
func KSLength(_ len: CGFloat) -> CGFloat {
    return floor((len) * CALength.scale)
}

struct CALength {
    
    // Screen Sizes
    static let ip6Width: CGFloat = 375
    static let kScreenWidth: CGFloat = UIScreen.main.bounds.size.width
    static let kScreenHeight: CGFloat = UIScreen.main.bounds.size.height
    
    // Top Safe Area
    static let kTabBarHeight: CGFloat = 50
    static let kNavBarHeight: CGFloat = 44
    static let kStatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
    static let kNavStatusBarHeight: CGFloat = kStatusBarHeight + kNavBarHeight
    
    // Bottom Safe Area
    static let kSafeTop: CGFloat = isIPhoneX ? 24 : 0
    static let kSafeBottom: CGFloat = isIPhoneX ? 34 : 0
    static let kTabSafeBottom: CGFloat = kSafeBottom + kTabBarHeight
    
    // Scaling
    static let scale = kScreenWidth/ip6Width
    
    // Device Handling
    static let isIPhoneX = (kStatusBarHeight != 20)
    
    //autoBgView
    static let kSpacingWidth : CGFloat = 17.5
    static let kNavTopSpacing : CGFloat = 18
}


