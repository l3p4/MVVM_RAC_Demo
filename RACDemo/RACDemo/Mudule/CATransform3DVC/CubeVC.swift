//
//  CubeVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/28.
//

import Foundation
import UIKit

@objc(CubeVC)
class CubeVC:BaseVC{
    
    //MARK: - Property & Lazy Load
    var isNormalPerspective = true
    
    lazy var btnsView:MultipleButtonsView = {
        let btnsV = MultipleButtonsView(frame: CGRect(x: 0, y: CALength.kScreenHeight - 300.0, width: CALength.kScreenWidth, height: 200), buttonNames: ["展示最初平面","展示旋转前平面","展示立方体","切换视角"])
        btnsV.delegate = self
        return btnsV
    }()
    
    lazy var cubeContainer:UIView = {
        let width = CALength.kScreenWidth - 20
        let container = UIView(frame: CGRect(x: 10, y: 100, width: width, height: width))
        container.backgroundColor = .lightGray

        return container
    }()
    
    lazy var cubeViews:Array<UILabel> = {
        var labelArray:[UILabel] = []
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        for i in 0..<6 {
            let label = UILabel(frame: frame)
            label.text = String(i)
            label.backgroundColor = UIColor.random
            
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 30)
            
            labelArray.append(label)
        }
        return labelArray
    }()
    
    
    //MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(btnsView)
        
        view.addSubview(cubeContainer)
        
        cubeViews.forEach { label in
            cubeContainer.addSubview(label)
        }
        
        resetCubViews()
    }
    
    //MARK: - Private Functions
    func resetCubViews(){
        cubeViews.forEach { label in
            
            label.snp.updateConstraints{ make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
                make.size.equalTo(CGSize(width: 100, height: 100))
            }
            
            label.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            label.layer.transform = CATransform3DIdentity
        }
    }
    
    func showOneDimensionalView(){
        resetCubViews()
    }
    
    func showViewBeforeRotate(){
        for index in 0..<6{
            let label = cubeViews[index]
            
            switch index {
            case 0:
                self.view.bringSubviewToFront(label)
            case 1:
                label.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
                label.snp.updateConstraints { make in
                    make.centerY.equalToSuperview().offset(-50)
                }
            case 2:
                label.layer.anchorPoint = CGPoint(x: 0, y:0.5)
                label.snp.updateConstraints { make in
                    make.centerX.equalToSuperview().offset(50)
                }
            case 3:
                label.layer.anchorPoint = CGPoint(x: 0.5, y:0)
                label.snp.updateConstraints { make in
                    make.centerY.equalToSuperview().offset(50)
                }
            case 4:
                label.layer.anchorPoint = CGPoint(x: 1, y:0.5)
                label.snp.updateConstraints { make in
                    make.centerX.equalToSuperview().offset(-50)
                }
            case 5:
                //需要用translate移动z轴到-100的位置
                print("")
                
            default:
                print(1)
            }
        }
    }
    
    func showCube(){
        let subView1 = self.cubeViews[1]
        let transform1 = CATransform3DRotate(subView1.layer.transform,  .pi/2, 1, 0, 0);
        subView1.layer.transform = transform1;
        
        let subView2 = self.cubeViews[2]
        let transform2 = CATransform3DMakeRotation( .pi/2, 0, 1, 0);
        subView2.layer.transform = transform2;
        
        let subView3 = self.cubeViews[3]
        let transform3 = CATransform3DMakeRotation( -.pi/2, 1, 0, 0);
        subView3.layer.transform = transform3;
        
        let subView4 = self.cubeViews[4]
        let transform4 = CATransform3DMakeRotation( -.pi/2, 0, 1, 0);
        subView4.layer.transform = transform4;
    }
    
    func changePerspective(){
        isNormalPerspective = !isNormalPerspective
        
        let isShowCubic = isNormalPerspective
        var perspective = CATransform3DIdentity;
        
        if(!isShowCubic){
            perspective.m34 = -1.0 / 500.0;
            perspective = CATransform3DRotate(perspective, -(.pi/6), 1, 0, 0);
            perspective = CATransform3DRotate(perspective, -(.pi/6), 0, 1, 0);
        }
        self.cubeContainer.layer.sublayerTransform = perspective;
    }
      
}

//MARK: - Delegate
extension CubeVC:MultipleButtonsViewDelegate{
    
    func didClickBtn(btn: UIButton) {
        if(btn.tag == 0){
            showOneDimensionalView()
        }else if(btn.tag == 1){
            showViewBeforeRotate()
        }else if(btn.tag == 2){
            showCube()
        }else if(btn.tag == 3){
            changePerspective()
        }
    }
}
