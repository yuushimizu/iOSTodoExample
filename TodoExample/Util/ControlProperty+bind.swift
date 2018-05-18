//
//  ControlProperty+bind.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/18.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxOptional

extension ControlProperty where E: OptionalType {
    func bind(to: BehaviorRelay<E.Wrapped>) -> Disposable {
        return self.asDriver().filterNil().drive(to)
    }
}
