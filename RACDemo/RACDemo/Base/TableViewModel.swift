//
//  TableViewModel.swift
//  iOS_CoreAnimation_Demo
//
//  Created by simon on 2024/2/26.
//

import Foundation

struct TableViewModel {
    
    init(title:String, VCName:String) {
        self.title = title
        self.VCName = VCName
    }
    
    var title:String
    var VCName:String
}
