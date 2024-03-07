//
//  CATransitionVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/29.
//  转场动画,负责翻页,页面跳转效果,图片切换

import Foundation
import UIKit

@objc(CATransactionVC)
class CATransitionVC: BaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redView:UIView = UIView(frame: CGRect(x:0, y:200, width:CALength.kScreenWidth, height:400))
        redView.backgroundColor = UIColor.red
        view.addSubview(redView)
         
        let blueView:UIView = UIView(frame: redView.frame)
        blueView.backgroundColor = UIColor.blue
        view.addSubview(blueView)
    }
     
    //点击切换两个红蓝视图
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let transition = CATransition()
        transition.duration = 1.0
        transition.type = .reveal //推送类型
        transition.subtype = .fromLeft //从左侧
        self.view.exchangeSubview(at: 1, withSubviewAt: 0)
        self.view.layer.add(transition, forKey: nil)
    }
    
    func setupSubView() {
        
    }
}
