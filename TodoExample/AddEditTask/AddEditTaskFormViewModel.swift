//
//  AddEditTaskFormViewModel.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/18.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

open class AddEditTaskFormViewModel {
    public let title = BehaviorRelay(value: "")
    
    public let content = BehaviorRelay(value: "")
    
    public var values: Observable<(title: String, content: String)> {
        return Observable.combineLatest(title, content) {(title: $0, content: $1)}
    }
}
