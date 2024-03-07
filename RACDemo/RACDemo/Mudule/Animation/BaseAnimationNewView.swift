//
//  BaseAnimationNewView.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/3/2.
//

import Foundation
import UIKit

protocol BaseAnimationNewViewDelegate:NSObject {
    func newViewBtnDidClick(_ button:UIButton)
}

class BaseAnimationNewView:UIView{
    weak var delegate: BaseAnimationNewViewDelegate?
    lazy var button = {
        let btn:UIButton = UIButton(type: .custom)
        self.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.bringSubviewToFront(button)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
   @objc func btnClick(_ btn:UIButton)  {
       if let delegate = self.delegate{
           delegate.newViewBtnDidClick(btn)
       }

    }
}
