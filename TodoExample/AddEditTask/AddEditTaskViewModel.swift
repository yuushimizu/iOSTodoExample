//
//  AddEditTaskViewModel.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/18.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

open class AddEditTaskViewModel {
    public let title = BehaviorRelay(value: "")
    
    public let content = BehaviorRelay(value: "")
}
