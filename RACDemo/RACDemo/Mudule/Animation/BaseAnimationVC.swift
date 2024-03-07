//
//  BaseAnimationVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/1/20.
//

import Foundation
import UIKit

@objc(BaseAnimationVC)
@objcMembers class BaseAnimationVC:BaseVC{
    
    
    //MARK:  Property
    lazy var label:UILabel = {
        let label = UILabel(frame: CGRectMake(100, 100, 100, 100))
        label.text = "1"
        label.backgroundColor = UIColor.green
        label.textAlignment = .center
        return label
    }()
    
    lazy var layer1:CALayer = {
        
        let layer2 = CALayer()
        layer2.frame = CGRectMake(100, 200, 100, 100)
        layer2.backgroundColor = UIColor.red.cgColor
        return layer2
    }()
    
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    @objc func btnClick(){
        print("click button")
    }
    
    lazy var btn:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("2", for: .normal)
        
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        btn.frame = CGRectMake(100, 400, 100, 100)
        btn.backgroundColor = .orange
        return btn

    }()
    
    
    //MARK: Life Circle
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        
        title = "BaseAnimation"
        view.addSubview(label)
        view.addSubview(btn)
        view.layer.addSublayer(layer1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let animation = CABasicAnimation(keyPath: "position.y")
//        animation.toValue = 200
//        animation.duration = 1
//
//        animation.repeatCount = 1;
//
//        //设置以后动画不会返回到初始位置
//        animation.isRemovedOnCompletion = false;
//        animation.fillMode = .forwards
//
////        label.layer.add(animation, forKey: nil)
////        label.layer.add(animation, forKey: "123")
//
//        btn.layer.add(animation, forKey: nil)
//        btn.layer.add(animation, forKey: nil)
        
//        CATransaction.begin()
//        btn.layer.model()
        
//        let transcation = CATransaction()
        self.layer1.backgroundColor = UIColor.black.cgColor
//        CATransaction.begin()
////        transcation.
//        CATransaction.setAnimationDuration(0.25)
        self.layer1.position.y = 600
        var btnLayerFrame = self.btn.layer.frame
        btnLayerFrame.origin.y = 600
        self.btn.layer.frame = btnLayerFrame
//        CATransaction.setCompletionBlock {
//        }
//        CATransaction.commit()
        
    }
}
