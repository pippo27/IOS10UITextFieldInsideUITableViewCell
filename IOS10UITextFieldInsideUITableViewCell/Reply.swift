//
//  Reply.swift
//  BasicUITextField
//
//  Created by Arthit Thongpan on 3/4/17.
//  Copyright © 2017 Arthit Thongpan. All rights reserved.
//

import UIKit

class Reply: NSObject {
    var detail: String
    var name: String
    
    init?(detail: String, name: String) {
        
        // detail must not be empty
        guard !detail.isEmpty else {
            return nil
        }
        
        // name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.detail = detail
        self.name = name
    }
}
