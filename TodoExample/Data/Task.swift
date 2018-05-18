//
//  Task.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/18.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import Foundation

class Task {
    var id: Int64?
    
    var title: String
    
    var content: String
    
    init(id: Int64?, title: String, content: String) {
        self.id = id
        self.title = title
        self.content = content
    }
}
