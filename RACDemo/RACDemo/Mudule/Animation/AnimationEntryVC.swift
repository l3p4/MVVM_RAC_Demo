//
//  AnimationEntryVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/26.
//

import Foundation
import UIKit

@objc(AnimationEntryVC)
class AnimationEntryVC: BaseTableVC {

    
    override var dataSource: [TableViewModel]{
        get{
            guard let data = self.private_data else{
                let model1 = TableViewModel(title: "BaseAnimation", VCName: "BaseAnimationVC")
                let model2 = TableViewModel(title: "BaseAnimation+UIBezierPath", VCName: "BaseAnimation2VC")
                let model3 = TableViewModel(title: "CAKeyFrameAnimation", VCName: "CAKeyFrameAnimationVC")
                let model4 = TableViewModel(title: "转场动画_CATransaction", VCName: "CATransactionVC")
                let model5 = TableViewModel(title: "自定义NavCPush转场动画", VCName: "CACustomTransitionVC")
                let model6 = TableViewModel(title: "动画组-CAAnimationGroup", VCName: "CAAnimationGroupVC")
                
                let tempData  = [model1, model2, model3, model4, model5, model6]
                self.private_data = tempData
                
                return tempData
            }
            return data
        }
        set{
            super.dataSource = newValue
        }
    }
    
}
