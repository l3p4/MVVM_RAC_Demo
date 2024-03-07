//
//  LayerTreeVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/25.
//

import Foundation
import UIKit

@objc(LayerTreeVC)
 @objcMembers class LayerTreeVC:BaseVC{
     
     var displayLink:CADisplayLink?
     
     deinit {
         displayLink?.invalidate()
         displayLink = nil
     }
     
     lazy var view1:UIView = {
         var view = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
         view.backgroundColor = .yellow
         return view
     }()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        view.addSubview(view1)
        
    }
     
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         beginAnimationOfView1()
         printLayerPresentationAndModelFrame()
         
     }
    
     func printLayerPresentationAndModelFrame(){
         displayLink = CADisplayLink(target: self, selector: #selector(printFrame(_:)))
         displayLink?.add(to: .current, forMode: .default)
         self.perform(#selector(cancelPrint), with: nil, afterDelay: 3)
     }
     
     
     @objc func cancelPrint(){
         displayLink?.invalidate()
     }
     /*
      //https://www.cnblogs.com/breezemist/p/3489326.html
      https://www.jianshu.com/p/d09e7929f269
      图层树layerTree分为modelTree,presentationTree,renderTree.
      
      modelTree中的modelLayer实际就是layer,是给layer赋值的时候存储相关属性的模型对象.
      presentationLayer呈现/表现,在核心动画中,可以通过presentation()访问动态变化的数据
      还有一个renderTree中的对象,异步绘制,为核心动画私有.
      
      presentation:Optional((100.0, 117.97318756580353, 100.0, 100.0))
      model:(100.0, 100.0, 100.0, 100.0)
      presentation:Optional((100.0, 118.53112876415253, 100.0, 100.0))
      model:(100.0, 100.0, 100.0, 100.0)
      presentation:Optional((100.0, 119.0867081284523, 100.0, 100.0))
      model:(100.0, 100.0, 100.0, 100.0)
      presentation:Optional((100.0, 119.63988244533539, 100.0, 100.0))
      model:(100.0, 100.0, 100.0, 100.0)
      */
     @objc func printFrame(_ displayLink:CADisplayLink){
         let pRect = view1.layer.presentation()?.frame
         let mRect = view1.layer.model().frame
         print("presentation:\(String(describing: pRect)) \nmodel:\(mRect)")
     }

    
     func beginAnimationOfView1(){
         let basicA = CABasicAnimation(keyPath: "position.y")
         basicA.fromValue = view1.layer.position.y
         basicA.toValue = view1.layer.position.y + 100
         basicA.duration = 3
         basicA.isRemovedOnCompletion = false
         basicA.fillMode = .forwards;
         view1.layer.add(basicA, forKey: "basicAnimation")
     }
}
