//
//  EntryVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/26.
//

import Foundation
import UIKit

class EntryVC: BaseTableVC {

    
    override var dataSource: [TableViewModel]{
        get{
            guard let data = self.private_data else{
                
                let model1 = TableViewModel(title: "layer_属性", VCName: "CALayerKnowledgeVC")
                let model2 = TableViewModel(title: "图层树_LayerTreeVC", VCName: "LayerTreeVC")
                let model3 = TableViewModel(title: "CAAnimation", VCName: "AnimationEntryVC")
                let model4 = TableViewModel(title: "CATransfrom3D", VCName: "CATransform3DEntryVC")
                let model5 = TableViewModel(title: "各种layer", VCName: "MultipleLayerEntryVC")
                let tempData  = [model1, model2, model3, model4, model5]
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
