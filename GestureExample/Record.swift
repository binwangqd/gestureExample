//
//  Record.swift
//  GestureExample
//
//  Created by Bin Wang on 2017-12-07.
//  Copyright © 2017 Bin Wang. All rights reserved.
//

import Foundation

class Record : NSObject {
    var recordNo: Int
    var recordDesc: String
    
    init(recordNo: Int, recordDesc: String) {
        self.recordNo = recordNo
        self.recordDesc = recordDesc
    }
}
