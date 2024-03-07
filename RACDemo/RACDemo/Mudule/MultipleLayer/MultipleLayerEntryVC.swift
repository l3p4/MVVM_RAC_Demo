//
//  MultipleLayerEntryVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/28.
//

import Foundation
@objc(MultipleLayerEntryVC)
class MultipleLayerEntryVC:BaseTableVC{
    
    override var dataSource: [TableViewModel]{
        get{
            guard let data = self.private_data else{
                
                let model1 = TableViewModel(title: "贝塞尔曲线_CAShapeLayer", VCName: "CAShapeLayerVC")
                
                let model2 = TableViewModel(title: "CATextLayer", VCName: "CATextLayerVC")
                let model3 = TableViewModel(title: "CATransformLayerVC", VCName: "CATransformLayerVC")
                let model4 = TableViewModel(title: "CAGradientLayer", VCName: "CAGradientLayerVC")
                let model5 = TableViewModel(title: "CAReplicatorLayerVC", VCName: "CAReplicatorLayerVC")
                let model6 = TableViewModel(title: "粒子效果_CAEmitterLayer", VCName: "CAEmitterLayerVC")
                let model7 = TableViewModel(title: "粒子效果_CAEmitterLayer", VCName: "CAEmitterLayerVC")
                
                
                let tempData  = [model1, model2, model3, model4, model5, model6, model7]
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


/*
 QuarzCore 有下面的layer
 import QuartzCore.CAEAGLLayer
 import QuartzCore.CAEmitterLayer
 import QuartzCore.CAGradientLayer
 import QuartzCore.CALayer
 import QuartzCore.CAMetalLayer
 import QuartzCore.CAReplicatorLayer
 import QuartzCore.CAScrollLayer
 import QuartzCore.CAShapeLayer
 import QuartzCore.CATextLayer
 import QuartzCore.CATiledLayer
 import QuartzCore.CATransformLayer
 
 */
