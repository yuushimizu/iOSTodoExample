//
//  Result.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/22.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import Foundation

enum Result<T> {
    case succeeded(T)
    case failed(Error)
}
