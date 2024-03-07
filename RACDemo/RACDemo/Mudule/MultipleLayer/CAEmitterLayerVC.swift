//
//  CAEmitterLayerVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/28.
//

import Foundation
import UIKit

/*
 CAEmitterLayer粒子动画效果,抖音那种点赞等,火雨等
 粒子效果待优化,类似tableview复用机制
 */
@objc(CAEmitterLayerVC)
class CAEmitterLayerVC:BaseVC{
    
    var colorBallLayer:CAEmitterLayer?
    
    var emitterCellArray:[CAEmitterCell] = []
    
    lazy var circleView:UIView = {
        let view = UIView(frame: CGRect(x: 150, y: 400, width: 50, height: 50))
        view.backgroundColor = .green
        view.layer.cornerRadius = 25
        
        return view
    }()
    
    lazy var btnsView:MultipleButtonsView = {
        let btnsV = MultipleButtonsView(frame: CGRect(x: 0, y: CALength.kScreenHeight - 300.0, width: CALength.kScreenWidth, height: 200), buttonNames: ["开始","停止","自动播放/停止"])
        btnsV.delegate = self
        return btnsV
    }()
    
    
    deinit {
        print("CAEmitterLayerVC deinit")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(btnsView)
        view.addSubview(circleView)
        
        let delayTime: DispatchTimeInterval = .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: .now() + delayTime) {
            self.setupEmitter()
        }
    }
      
    func setupEmitter() {

        // 1. 创建发射源
        let colorBallLayer = CAEmitterLayer()
        self.view.layer.addSublayer(colorBallLayer)
        self.colorBallLayer = colorBallLayer

        // 发射源尺寸 colorBallLayer 的 frame
        let size = CGSize(width: 100, height: 300)
        colorBallLayer.emitterSize = size
        // 发射源形状
        colorBallLayer.emitterShape = .point
        // 发射模式
        colorBallLayer.emitterMode = .points
        // 粒子发射的中心点.
        colorBallLayer.emitterPosition = CGPoint(x:CALength.kScreenWidth-50, y: CALength.kScreenHeight - 50)
        
        colorBallLayer.emitterPosition = circleView.center
        

        // 2. 设置 Cell(粒子的样式)
        let imageNames = ["1", "2", "3", "4"]
        
        for i in 0..<imageNames.count{
            
            let colorBallCell = CAEmitterCell()
            // 粒子名称
            colorBallCell.name = "ccCell\(i)"
            // 粒子的产生率
            colorBallCell.birthRate = 2
            // 粒子的生命周期
            colorBallCell.lifetime = 5.0
            // 消失速度
            colorBallCell.alphaSpeed = -0.2
            
            //发射方向
            //水平方向
            colorBallCell.emissionLongitude = -.pi/2
            // 垂直方向
            //colorBallCell.emissionLatitude = 0
            colorBallCell.emissionRange = .pi/16
            // 粒子速度
            colorBallCell.velocity = 40.0
            colorBallCell.velocityRange = 3.0
            colorBallCell.yAcceleration = -10.0
            
            colorBallCell.scale = 0.005
            colorBallCell.scaleRange = 0.01
            colorBallCell.scaleSpeed = 0.002
            
            // 粒子的内容
            guard let image = UIImage(named: "\(imageNames[i])"),let circleImage = circularImage(from: image) else {
                return
            }
            
            colorBallCell.contents = circleImage.cgImage
            // 颜色变化
            //colorBallCell.color = UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0).cgColor
            // 粒子颜色改变范围
            //colorBallCell.alphaRange = 0.8
            //colorBallCell.redRange = 1.0
            //colorBallCell.greenRange = 1.0
            
            // 粒子变化的速度
            colorBallCell.blueSpeed = 1.0
            colorBallCell.alphaRange = -0.1
            
            emitterCellArray.append(colorBallCell)
        }

        
    }
    
    func emitterFire(){
        setupEmitter()
        for cell in emitterCellArray{
            cell.birthRate = 2
        }
        colorBallLayer?.emitterCells = emitterCellArray
    }
    
    
    func emitterStop(){
        
        colorBallLayer?.emitterCells = []
        colorBallLayer?.removeAllAnimations()
        
        for cell in emitterCellArray{
            cell.birthRate = 0
        }
        emitterCellArray.removeAll()
        colorBallLayer?.removeAllAnimations()
    }
    
    
    func circularImage(from rectangleImage: UIImage) -> UIImage? {
        // 根据图片的尺寸创建画布
        let shorterSide = min(rectangleImage.size.width, rectangleImage.size.height)
        let imageSize = CGSize(width: shorterSide, height: shorterSide)
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0.0)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        // 创建圆形路径
        let circlePath = UIBezierPath(ovalIn: CGRect(origin: .zero, size: imageSize))
        
        // 将圆形路径添加为剪切路径
        circlePath.addClip()
        
        // 绘制图片
        let drawRect = CGRect(x: (imageSize.width - rectangleImage.size.width) / 2, y: (imageSize.height - rectangleImage.size.height) / 2, width: rectangleImage.size.width, height: rectangleImage.size.height)
        rectangleImage.draw(in: drawRect)
        
        // 获取圆形图片
        let circularImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // 结束绘制
        UIGraphicsEndImageContext()
        
        return circularImage
    }
}

//MARK: - Delegate
extension CAEmitterLayerVC:MultipleButtonsViewDelegate{
    
    func didClickBtn(btn: UIButton) {
        if(btn.tag == 0){
            emitterFire()
        }else if(btn.tag == 1){
            emitterStop()
        }else if(btn.tag == 2){
            
        }else if(btn.tag == 3){
            
        }
    }
}
