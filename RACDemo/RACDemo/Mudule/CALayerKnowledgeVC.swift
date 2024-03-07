//
//  CALayerKnowledgeVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/25.
//

import Foundation
import UIKit

@objc(CALayerKnowledgeVC)
 @objcMembers class CALayerKnowledgeVC:BaseVC{
     
     //MARK: - Property & Lazy Load
     lazy var view1:UIView = {
         var view = UIView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
         view.backgroundColor = .yellow
         let image = UIImage(named: "1")
         //用途:可以给UIView设置背景图片
         view.layer.contents = image?.cgImage
         view.layer.contentsGravity = .resizeAspectFill
         //contentMode本质也是设置layer.contentsGravity
         //view.contentMode = .left
         //可以设定展示哪一部分的图片,可以用来做类似H5的精灵图,sprite(多张小图拼成一张大图,后按照位置尺寸来裁剪,优化app性能(资源加载,单词渲染,请求次数),减少服务器负担)
         view.layer.contentsRect = CGRect(x: 0.5, y: 0.5, width: 0.5, height: 0.5)
         //默认是1,Retina屏正常是2或者3
         view.layer.contentsScale = UIScreen.main.scale
         view.layer.masksToBounds = true
         //实际也是调用layer的masksToBounds
         view.clipsToBounds = true
         return view
     }()
     
    //MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        view.addSubview(view1)
        
    }
     
     //MARK: - Event Response
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//         beginAnimationOfView1()
//         printLayerPresentationAndModelFrame()
         
//         view1.layer.contentsGravity = .bottomLeft
         
         CATransaction.begin()
         CATransaction.setAnimationDuration(21)
         
         CATransaction.setCompletionBlock {
             self.view1.layer.backgroundColor = UIColor.red.cgColor
             
             self.view1.layer.setAffineTransform( CGAffineTransformRotate(self.view1.layer.affineTransform(), .pi/4.0))
         }
        
         CATransaction.commit()
     }
     
}
