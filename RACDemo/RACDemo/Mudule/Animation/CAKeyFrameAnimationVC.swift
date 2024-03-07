//
//  CAKeyFrameAnimationVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/29.
//

import Foundation
import UIKit

@objc(CAKeyFrameAnimationVC)
class CAKeyFrameAnimationVC: BaseVC {
    
    //MARK: - Property & Lazy Load
    var isAnimationProceeding = false
    
    lazy var carLayer:CALayer = {
        let carLayer = CALayer()
        carLayer.contents = UIImage(named: "car")?.cgImage
        carLayer.frame = CGRect(x: 15, y: 200-5, width: 20, height: 20)
        carLayer.anchorPoint = CGPointMake(0.5, 0.8)
        return carLayer
    }()
    
    lazy var curLayer:CALayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = nil
        return shapeLayer
    }()
    
    lazy var path:UIBezierPath = {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 40, y: 200))
        path.addCurve(to: CGPoint(x: 300, y: 200), controlPoint1: CGPoint(x: 100, y: 100), controlPoint2: CGPoint(x: 200, y: 400))
        return path
    }()
    
    lazy var kfAnimation:CAKeyframeAnimation = {
        //keyFrame
        let kfAnimation = CAKeyframeAnimation()
        kfAnimation.keyPath = "position"
        kfAnimation.path = path.cgPath
        kfAnimation.duration = 4.0
        kfAnimation.rotationMode = .rotateAuto
        kfAnimation.fillMode = .forwards
        kfAnimation.isRemovedOnCompletion = false
        
        kfAnimation.delegate = self
        return kfAnimation
    }()
    
    
    lazy var btnsView:MultipleButtonsView = {
        let btnsV = MultipleButtonsView(frame: CGRect(x: 0, y: CALength.kScreenHeight - 300.0, width: CALength.kScreenWidth, height: 200), buttonNames: ["开始", "停止"])
        btnsV.delegate = self
        return btnsV
    }()
    
    
    //MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubView()
    }
    
    //MARK: - Private Functions
    func setupSubView() {
        view.layer.addSublayer(carLayer)
        view.layer.addSublayer(curLayer)
        view.addSubview(btnsView)
        
    }
    
    func animationStart() {
        if (isAnimationProceeding) {
            return
        }
        kfAnimation.path = path.cgPath
        kfAnimation.rotationMode = .rotateAuto
        carLayer.add(kfAnimation, forKey: nil)
    }
    
    func animationReverseStart() {
        kfAnimation.path = path.reversing().cgPath
        kfAnimation.rotationMode = .rotateAutoReverse
        carLayer.add(kfAnimation, forKey: nil)
    }
    
    func animationStop() {
        carLayer.removeAllAnimations()
    }
    
}

//MARK: - Delegate
extension CAKeyFrameAnimationVC:MultipleButtonsViewDelegate{
    
    func didClickBtn(btn: UIButton) {
        if(btn.tag == 0){
            animationStart()
        }else if(btn.tag == 1){
            animationStop()
        }
    }
}

extension CAKeyFrameAnimationVC:CAAnimationDelegate{
    
    func animationDidStart(_ anim: CAAnimation) {
        isAnimationProceeding = true
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        isAnimationProceeding = false
    }
}

