//
//  CACustomTransitionVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/29.
//  转场动画,负责翻页,页面跳转效果,图片切换

import Foundation
import UIKit

@objc(CACustomTransitionVC)
class CACustomTransitionVC: BaseVC {
    
    lazy var button:UIButton = {
        let btn:UIButton = UIButton(type: .custom)
        view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        btn.setTitle("点击", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitleColor(.red, for: .highlighted)
        btn.layer.cornerRadius = 40
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        return btn
    }()
    
    deinit{
        navigationController?.delegate = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.bringSubviewToFront(button)
        navigationController?.delegate = self
    }
    
    @objc func btnClick(_ btn:UIButton) {
        let secondVC = CACustomTransSecondVC()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}


extension CACustomTransitionVC: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animator = CustomCircleTransition()
        if operation == .push {
            animator.isPush = true
            return animator
        }else if (operation) == .pop{
            animator.isPush = false
            return animator
        }
        return nil
    }
    

}


