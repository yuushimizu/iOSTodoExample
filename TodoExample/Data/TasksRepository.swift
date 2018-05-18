//
//  TasksRepository.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/18.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class TasksRepository {
    public static let shared = TasksRepository()
    
    private let database = BehaviorRelay(value: [Task]())
    
    public var tasks: Observable<[Task]> {
        return database.asObservable()
    }

    public func save(task: Task) -> Single<Task> {
        return Single.create(subscribe: {observer in
            if task.id == nil {
                task.id = (self.database.value.map {$0.id!}.max(by: {$0 > $1}) ?? 0) + 1
            }
            var database = self.database.value
            if let saved = database.first(where: {$0.id! == task.id!}) {
                saved.title = task.title
                saved.content = task.content
            } else {
                database.append(task)
            }
            self.database.accept(database)
            observer(.success(task))
            return Disposables.create()
        })
    }
}
