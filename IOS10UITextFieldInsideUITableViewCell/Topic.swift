//
//  Topic.swift
//  BasicUITextField
//
//  Created by Arthit Thongpan on 3/4/17.
//  Copyright © 2017 Arthit Thongpan. All rights reserved.
//

import UIKit

class Topic: NSObject {
    var title: String
    var detail: String
    var name: String
    var replys: [Reply]
    
    init?(title: String, detail: String, name: String) {
        
        // title must not be empty
        guard !title.isEmpty else {
            return nil
        }
        
        // detail must not be empty
        guard !detail.isEmpty else {
            return nil
        }
        
        // name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.title = title
        self.detail = detail
        self.name = name
        self.replys = []
    }
}
