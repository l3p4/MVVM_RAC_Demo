//
//  CACustomTransSecondVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/29.
//  转场动画,负责翻页,页面跳转效果,图片切换

import Foundation
import UIKit

@objc(CACustomTransSecondVC)
class CACustomTransSecondVC: BaseVC {
    
    lazy var button:UIButton = {
        let btn:UIButton = UIButton(type: .custom)
        view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        btn.frame = CGRectMake(CALength.kScreenWidth/2.0 - 80/2, CALength.kScreenHeight - 100 - 40, 80, 80)
        btn.setTitle("点击", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitleColor(.red, for: .highlighted)
        btn.layer.cornerRadius = 40
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        title = "secondVC"
        setupSubView()
    }
    
    func setupSubView() {
        view.bringSubviewToFront(self.button)
    }
    
    @objc func btnClick(_ btn:UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

