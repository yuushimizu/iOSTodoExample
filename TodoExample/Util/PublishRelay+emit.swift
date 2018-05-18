//
//  PublishRelay+emit.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/18.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension PublishRelay {
    public func emit(_ onNext: @escaping (E) -> Void) -> Disposable {
        return self.asSignal().emit(onNext: onNext)
    }
}
