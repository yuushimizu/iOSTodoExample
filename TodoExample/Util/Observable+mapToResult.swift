//
//  Observable+mapToResult.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/22.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import Foundation
import RxSwift

extension ObservableType {
    func mapToResult() -> Observable<Result<E>> {
        return self.map {Result<E>.succeeded($0)}.catchError {Observable.just(Result<E>.failed($0))}
    }
}
