//
//  CAReplicatorSubView.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/28.
//

import Foundation
import UIKit


class CAReplicatorSubView:UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let imageView = UIImageView(image: UIImage(named: "1"))
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class var layerClass: AnyClass{
        return CAReplicatorLayer.self
    }
    
}
