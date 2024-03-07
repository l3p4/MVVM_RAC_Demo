//
//  CATransformLayerVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/28.
//
/*
 CATransformLayerVC 用来创建3D图形,更适用于复杂的三维图层管理和变换。
 
 */
import Foundation
import UIKit

@objc(CATransformLayerVC)
class CATransformLayerVC:BaseVC{
    
    lazy var cubeContainer:UIView = {
        let width = CALength.kScreenWidth - 20
        let container = UIView(frame: CGRect(x: 10, y: 100, width: width, height: width))
        container.backgroundColor = .lightGray

        return container
    }()
    
    lazy var btnsView:MultipleButtonsView = {
        let btnsV = MultipleButtonsView(frame: CGRect(x: 0, y: CALength.kScreenHeight - 300.0, width: CALength.kScreenWidth, height: 200), buttonNames: ["X轴-1","X轴-2","Z轴-1","Z轴-2"])
        btnsV.delegate = self
        return btnsV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(cubeContainer)
        view.addSubview(btnsView)
        
        var pt = CATransform3DIdentity
        pt.m34 = -1.0/500
        pt = CATransform3DRotate(pt, .pi/4, 1, 1, 0)
        pt = CATransform3DRotate(pt, .pi/4, 0, 1, 1)
        self.cubeContainer.layer.sublayerTransform = pt
        
        var ct = CATransform3DIdentity;
        ct = CATransform3DTranslate(ct, -100, 0, 0);
        let cube1 = drawCubeWithTransform(ct)
        cubeContainer.layer.addSublayer(cube1)
        cube1.isDoubleSided = true
    }
    
    
    func drawCubeWithTransform(_ transform:CATransform3D)-> CALayer{
        
        let cube:CATransformLayer = CATransformLayer()
        
        //add cube face 1
        var ct = CATransform3DMakeTranslation(0, 0, 50);
        let textLayer0 = faceWithTransform(ct)
        textLayer0.string = "0"
        textLayer0.alignmentMode = .center
        cube.addSublayer(textLayer0)
        
        ct = CATransform3DMakeTranslation(50, 0, 0);
        ct = CATransform3DRotate(ct, .pi/2.0, 0, 1, 0)
        let textLayer1 = faceWithTransform(ct)
        textLayer1.string = "1"
        textLayer1.alignmentMode = .center
        cube.addSublayer(textLayer1);
        
        ct = CATransform3DMakeTranslation(0, -50, 0);
        ct = CATransform3DRotate(ct, .pi/2.0, 1, 0, 0)
        let textLayer2 = faceWithTransform(ct)
        textLayer2.string = "2"
        textLayer2.alignmentMode = .center
        cube.addSublayer(textLayer2);
        
        ct = CATransform3DMakeTranslation(0, 50, 0);
        ct = CATransform3DRotate(ct, .pi/2.0, 1, 0, 0)
        let textLayer3 = faceWithTransform(ct)
        textLayer3.alignmentMode = .center
        textLayer3.string = "3"
        cube.addSublayer(textLayer3);
        
        ct = CATransform3DMakeTranslation(-50, 0, 0);
        ct = CATransform3DRotate(ct, -.pi/2.0, 0, 1, 0)
        let textLayer4 = faceWithTransform(ct)
        textLayer4.string = "4"
        textLayer4.alignmentMode = .center
        cube.addSublayer(textLayer4);
        
        ct = CATransform3DMakeTranslation(0, 0, -50);
        let textLayer5 = faceWithTransform(ct)
        textLayer5.alignmentMode = .center
        textLayer5.string = "5"
        
        cube.addSublayer(faceWithTransform(ct))
        return cube
    }
    
    func faceWithTransform(_ transform:CATransform3D) -> CATextLayer {
        let face = CATextLayer()
        face.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        face.backgroundColor = UIColor.random.cgColor
        face.transform = transform
        return face
    }
}

extension CATransformLayerVC:MultipleButtonsViewDelegate{
    
    enum Axis {
    case x, y, z
    }
    
    func showWithPerspective(_ angle1:CGFloat, _ axis1:Axis, _ angle2:CGFloat, _ axis2:Axis  ){
        
        var pt = CATransform3DIdentity
        pt.m34 = -1.0/500
        
        let x1 = axis1 == Axis.x ? 1.0: 0
        let y1 = axis1 == Axis.y ? 1.0 : 0
        let z1 = axis1 == Axis.z ? 1.0 : 1
        pt = CATransform3DRotate(pt, angle1, x1, y1, z1)
        
        let x2 = axis2 == Axis.x ? 1.0: 0
        let y2 = axis2 == Axis.y ? 1.0 : 0
        let z2 = axis2 == Axis.z ? 1.0 : 1
        pt = CATransform3DRotate(pt, angle2, x2, y2, z2)
        
        self.cubeContainer.layer.sublayerTransform = pt
    }
    
    func didClickBtn(btn: UIButton) {
        if(btn.tag == 0){
            showWithPerspective(.pi/4, .x, .pi/3, .y)
        }else if(btn.tag == 1){
            showWithPerspective(.pi, .x, .pi/4, .y)
        }else if(btn.tag == 2){
            showWithPerspective(.pi/4, .z, .pi/4, .y)
        }else if(btn.tag == 3){
            showWithPerspective(.pi, .z, .pi/4, .y)
        }
    }
}
