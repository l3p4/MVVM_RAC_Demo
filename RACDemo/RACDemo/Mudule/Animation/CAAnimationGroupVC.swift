//
//  CAAnimationGroupVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/3/2.
//

import Foundation
import UIKit

@objc (CAAnimationGroupVC)
class CAAnimationGroupVC: BaseVC{
    
    lazy var subView:UIView = {
        let view = UIView(frame: CGRectMake(100, 100, 50, 50))
        view.backgroundColor = UIColor.random
        view.layer.cornerRadius = 25
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(subView)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let opacityAnim = CABasicAnimation(keyPath: "opacity")
        opacityAnim.fromValue = 1.0
        opacityAnim.toValue = 0.1
        
        let keyFrameAnim = CAKeyframeAnimation()
        keyFrameAnim.keyPath = "position"
        let bp = UIBezierPath()
        bp.move(to: self.subView.center)
        bp.addLine(to: CGPointMake(100, 600))
        keyFrameAnim.path = bp.cgPath
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [opacityAnim,keyFrameAnim]
        groupAnimation.fillMode = .forwards
        groupAnimation.isRemovedOnCompletion = false
        groupAnimation.duration = 5.0
        
        subView.layer.add(groupAnimation, forKey: nil)
    }
}
