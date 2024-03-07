//
//  CustomCircleTransition.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/3/1.
//

import Foundation
import UIKit

class CustomCircleTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var isPush = false
    var transitionContext: UIViewControllerContextTransitioning?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let _ = transitionContext.viewController(forKey: .to),
              let _ = transitionContext.viewController(forKey: .from),
              let toView = transitionContext.view(forKey: .to),
              let fromView = transitionContext.view(forKey: .from)  else{
            transitionContext.completeTransition(false)
            return
        }
        
        let timeInterval = transitionDuration(using: transitionContext)
        
        let containerView = transitionContext.containerView
        self.transitionContext = transitionContext
        
        let btnFrame = CGRectMake(CALength.kScreenWidth/2.0 - 80/2, CALength.kScreenHeight - 100 - 80, 80, 80)
        let smallBP = UIBezierPath(ovalIn: btnFrame)
        let radius = CALength.kScreenHeight
        let bigBP = UIBezierPath(ovalIn: btnFrame.insetBy(dx: -radius, dy: -radius))
        
        let smallShaperLayer = CAShapeLayer()
        smallShaperLayer.path = smallBP.cgPath
        let bigShaperLayer = CAShapeLayer()
        bigShaperLayer.path = bigBP.cgPath
        
        
        let baseAnimate = CABasicAnimation()
        baseAnimate.delegate = self
        baseAnimate.duration = timeInterval
        baseAnimate.keyPath = "path"
        
        if(isPush){
            containerView.addSubview(toView)
            
            baseAnimate.fromValue = smallBP.cgPath
            baseAnimate.toValue = bigBP.cgPath
            
            bigShaperLayer.add(baseAnimate, forKey: "")
            toView.layer.mask  = bigShaperLayer
        }else{
            containerView.addSubview(toView)
            containerView.addSubview(fromView)

            baseAnimate.fromValue = bigBP.cgPath
            baseAnimate.toValue = smallBP.cgPath
            
            smallShaperLayer.add(baseAnimate, forKey: "")
            fromView.layer.mask  = smallShaperLayer
        }
    }
}


extension CustomCircleTransition:CAAnimationDelegate{
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        transitionContext?.completeTransition(true)
    }
}
