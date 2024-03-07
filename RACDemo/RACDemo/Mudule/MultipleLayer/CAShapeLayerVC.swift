//
//  CAShapeLayerVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/28.
//

/*
 CAShapeLayer用来绘制贝塞尔曲线,绘制圆形,椭圆等曲线
 
 */

import Foundation
import UIKit

@objc(CAShapeLayerVC)
class CAShapeLayerVC: BaseVC{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawCircle()
        drawRoundCorner()
        drawRoundCornerForView()
    }
    
    
    func drawCircle(){
        let path:UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: 200, y: 100))
        path.addArc(withCenter: CGPoint(x: 200, y: 200), radius: 50, startAngle: -.pi/2.0, endAngle: .pi*2, clockwise: true)
        
        //1.创建sharperLayer
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = 3.0
        shapeLayer.lineJoin = .round
        shapeLayer.lineCap = .round
        view.layer.addSublayer(shapeLayer)
    }
    
    func drawRoundCorner(){
        let rect = CGRectMake(100, 300, 100, 100)
        let radii = CGSize(width: 10, height: 20)
        let corner1:UIRectCorner = [.topLeft, .topRight]
        let path = UIBezierPath.init(roundedRect: rect, byRoundingCorners: corner1, cornerRadii: radii)
        
        //1.创建sharperLayer
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = 3.0
        shapeLayer.lineJoin = .round
        shapeLayer.lineCap = .round
        view.layer.addSublayer(shapeLayer)
        
    }
    
    func drawRoundCornerForView(){
        // 创建一个视图
        let sampleView = UIView(frame: CGRect(x: 100, y: 500, width: 200, height: 100))
        sampleView.backgroundColor = UIColor.blue
        view.addSubview(sampleView)
        
        // 创建一个圆角形状的路径
        let cornerRadius: CGFloat = 20.0
        let maskPath = UIBezierPath(roundedRect: sampleView.bounds,
                                    byRoundingCorners: [.topLeft, .bottomLeft],
                                    cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        
        // 创建一个CAShapeLayer
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.cgPath
        
        // 将CAShapeLayer分配为视图的图层蒙版
        sampleView.layer.mask = maskLayer
    }
}
