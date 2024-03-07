//
//  CATransform3DEntryVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/28.
//

import Foundation
@objc(CATransform3DEntryVC)
class CATransform3DEntryVC:BaseTableVC{
    
    override var dataSource: [TableViewModel]{
        get{
            guard let data = self.private_data else{
                
                let model1 = TableViewModel(title: "CATransform3D属性", VCName: "CATransform3DNormalVC")
                let model2 = TableViewModel(title: "正方体", VCName: "CubeVC")
                let model3 = TableViewModel(title: "核心动画_BaseAnimation", VCName: "BaseAnimationVC")
                
                let model4 = TableViewModel(title: "CATransfrom3D", VCName: "CATransfrom3DVC")
                let tempData  = [model1, model2, model3, model4]
                self.private_data = tempData
                return tempData
            }
            return data
        }
        set{
            super.dataSource = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Entry"
    }
}
