//
//  MultipleButtonsView.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/28.
//

import Foundation
import UIKit

class MultipleButtonsView:UIView{
    
    weak var delegate:MultipleButtonsViewDelegate?
    var buttonNames:[String] = []
    var btnArray:[UIButton] = []
    
    init(frame:CGRect, buttonNames:[String]){
        super.init(frame: frame)
        self.buttonNames = buttonNames
        setubSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setubSubViews(){
        
        var btnW = 150.0
        let btnH = 40.0
        let numbersInRow = 3
        let verSpace = 40.0
        let width = frame.width
        let midSpace = 15.0

        btnW = (width - midSpace * Double(numbersInRow + 2))/Double(numbersInRow)
        
        for index in 0..<buttonNames.count{
            let btn = UIButton(type: .custom)
            btn.tag = index
            let name = buttonNames[index]
            btn.setTitle(name, for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.backgroundColor = UIColor(hexString: "0x00C78C")
            btn.setTitleColor(.blue, for: .highlighted)
            
            btn.layer.cornerRadius = 8.0
            btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
            btn.titleLabel?.adjustsFontSizeToFitWidth = true
            
            
            btn.frame = CGRect(x: midSpace+(btnW+midSpace)*(Double(index%3)), y: Double(btnH + verSpace) * Double(index/3), width: btnW, height: btnH)
            btn.addTarget(self, action: #selector(btnClick1(_:)), for: .touchUpInside)
            
            addSubview(btn)
            btnArray.append(btn)
        }
    }

    @objc func btnClick1(_ btn:UIButton){
        if let delegate = self.delegate {
            delegate.didClickBtn(btn: btn)
        }
    }
}

protocol MultipleButtonsViewDelegate:AnyObject {
    func didClickBtn(btn:UIButton)
}
