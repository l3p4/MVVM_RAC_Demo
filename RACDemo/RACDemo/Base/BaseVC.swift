//
//  BaseVC.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/28.
//

import Foundation
import UIKit


class BaseVC:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    deinit {
        print("deinit:\(self)")
    }
}
