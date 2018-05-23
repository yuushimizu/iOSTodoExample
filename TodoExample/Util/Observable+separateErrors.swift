//
//  Observable+separateErrors.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/23.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import Foundation
import RxSwift

extension ObservableType {
    func separateErrors<ResultType>() -> (Observable<ResultType>, Observable<Error>) where E == Result<ResultType> {
        let shared = self.share()
        let successes = shared.flatMap {result -> Observable<ResultType> in
            switch result {
            case .succeeded(let value):
                return Observable.just(value)
            case .failed:
                return Observable.empty()
            }
        }
        let failures = shared.flatMap {result -> Observable<Error> in
            switch result {
            case .succeeded:
                return Observable.empty()
            case .failed(let error):
                return Observable.just(error)
            }
        }
        return (successes, failures)
    }
}
