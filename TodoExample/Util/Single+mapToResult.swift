//
//  Single+mapToResult.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/23.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import Foundation
import RxSwift

extension PrimitiveSequenceType where TraitType == SingleTrait {
    func mapToResult() -> Single<Result<ElementType>> {
        return self.map {Result<ElementType>.succeeded($0)}.catchError {Single.just(Result<ElementType>.failed($0))}
    }
}
