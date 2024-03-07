//
//  CATransform3DNormalVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/26.
//

import Foundation
import UIKit

@objc(CATransform3DNormalVC)
class CATransform3DNormalVC:BaseVC{
    
    lazy var subView1:UIView = {
        var view = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        view.backgroundColor = .yellow
        let image = UIImage(named: "1")
        view.layer.contents = image?.cgImage
        view.layer.contentsGravity = .resizeAspectFill
        view.layer.contentsScale = UIScreen.main.scale
        view.layer.masksToBounds = true
        
        return view
    }()
    
    lazy var btnsView:MultipleButtonsView = {
        let btnsV = MultipleButtonsView(frame: CGRect(x: 0, y: CALength.kScreenHeight - 400.0, width: CALength.kScreenWidth, height: 200), buttonNames: ["1","2","3","4"])
        return btnsV
    }()
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        view.addSubview(subView1)
        view.addSubview(btnsView)
    }
    

    
    override func viewDidLayoutSubviews() {
        
    }
    
    /*
     投影方式:正投影 透视投影(修改m34的值)
     */
    
    //正投影
    func normalProjection(){
        
        var transform = CATransform3DMakeRotation(.pi/4, 0, 1, 0)
        self.subView1.layer.transform = transform
//        CATextLayer
//        CAEmitterLayer
//        QuartzCore
    }
    
    //透视投影
    func perspectiveProjection(){
        /*
         CATransform3DIdentity是单位矩阵，该矩阵没有缩放，旋转，歪斜，透视。该矩阵设置到图层上就是设置默认值
         */
//        var transform = CATransform3DIdentity
//        //设置 视觉灭点 跟什么轴没关系
//        transform.m34 = -1/1000.0
//
//
//
//        transform = CATransform3DRotate(transform, .pi/4, 0, 1, 0)
        self.subView1.layer.anchorPoint = CGPoint(x: 0, y: 0)
//        var transform1 = CATransform3DMakeRotation(.pi/4, 0, 1, 0)
//        self.subView1.layer.transform = transform1
        //背面不渲染,比如绕Y轴旋转180度,就看不到了
//        self.subView1.layer.isDoubleSided = false
        //多个subLayer就设置sublayerTransform 这个属性
        //self.subView1.layer.sublayerTransform = transform
    }
    
    func transform3DAnimate(){
        var transform = CATransform3DIdentity
        //public func CATransform3DRotate(_ t: CATransform3D, 角度_ angle: CGFloat, 1旋转0不选择_ x: CGFloat, _ y: CGFloat, _ z: CGFloat) -> CATransform3D
        
        //transform = CATransform3DRotate(transform, .pi/4, 0, 1, 0)
        //x y 放大1.5倍
        transform = CATransform3DScale(transform, 1.5, 1.5, 0)
        //平移
        //依赖于已存在的自己的transform,,由于自己的transform,会变化,所以会一直变化
//        transform = CATransform3DTranslate(subView1.layer.transform, -100, 0, 0)
        //不依赖于已存在的变换矩阵,而是固定的transform.不会一直变化
        var transform2 = CATransform3DMakeTranslation(-100, 0, 0)
        //效果合并
        transform = CATransform3DConcat(transform, transform2)
        
        
        subView1.layer.transform = transform
    }
    
}
