//
//  CAReplicatorLayerVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/28.
//

import Foundation
import UIKit

@objc(CAReplicatorLayerVC)
class CAReplicatorLayerVC:BaseVC{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubView()
    }
    
    func setupSubView() {
        
        let imageView = CAReplicatorSubView(frame: CGRect(x: 100, y: 150, width: 200, height: 200))
        view.addSubview(imageView)
        
        if let layer = imageView.layer as? CAReplicatorLayer{
            layer.instanceCount = 2
            
            var transform = CATransform3DIdentity
            let verOffset = imageView.height
            transform = CATransform3DTranslate(transform, 0, verOffset, 0)
            transform = CATransform3DScale(transform, 1, -1, 0)
            layer.instanceTransform = transform
            
            layer.instanceAlphaOffset = -0.7
        }
    }
}
