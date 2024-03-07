//
//  CATextLayerVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/28.
//

/*
 没有交互的,可以用CATextLayerVC替换UILabel.
 CATextLayerVC包括很多UILabel的属性,
 可以封装一个layerLabel来替代UILabel渲染速度更快.
 */

import Foundation
import UIKit
import QuartzCore

@objc(CATextLayerVC)
class CATextLayerVC:BaseVC{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawTextLayer()
        drawAttributeString()
    }
    
    
    func drawTextLayer(){
        let textLayer = CATextLayer()
        textLayer.string = "测试CATextLayer 123123 BCDE,测试CATextLayer 123123 BCDE,测试CATextLayer 123123 BCDE,测试CATextLayer 123123 BCDE,测试CATextLayer 123123 BCDE,测试CATextLayer 123123 BCDE,测试CATextLayer 123123 BCDE,测试CATextLayer 123123 BCDE,测试CATextLayer 123123 BCDE"
        textLayer.frame = CGRectMake(10, 200, CALength.kScreenWidth - 20, 80)
        textLayer.backgroundColor = UIColor.orange.cgColor
        
        textLayer.alignmentMode = .center
        textLayer.isWrapped = true
        textLayer.font = UIFont.systemFont(ofSize: 5)
        
        //字体
        let fontName = "Helvetica-Bold"
        textLayer.font = fontName as CFTypeRef
        textLayer.fontSize = 20
        //设置为rentina渲染
        textLayer.contentsScale = UIScreen.main.scale
        //字体颜色
        textLayer.foregroundColor = UIColor.white.cgColor
        //省略号
        textLayer.truncationMode = .end
        view.layer.addSublayer(textLayer)
    }
    
    
    func drawAttributeString(){
        let textLayer = CATextLayer()
        
        // 创建富文本字符串
        let attributedString = NSAttributedString(string: "Hello, World!", attributes: [
            .font: UIFont.systemFont(ofSize: 18),
            .foregroundColor: UIColor.red
        ])
        
        textLayer.string = attributedString
        textLayer.frame = CGRectMake(10, 400, CALength.kScreenWidth - 20, 80)
        textLayer.backgroundColor = UIColor.green.cgColor
        
        view.layer.addSublayer(textLayer)
    }
}
