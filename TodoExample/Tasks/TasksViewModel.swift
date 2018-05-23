//
//  TasksViewModel.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/17.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import Foundation
import os.log
import RxSwift
import RxCocoa

class TasksViewModel {
    struct Input {
        public let addTask = PublishRelay<Void>()
    }
    
    struct Navigation {
        public let addTask: Observable<Void>
    }
    
    private let disposeBag = DisposeBag()
    
    public let input = Input()
    
    public let navigation: Navigation
    
    public let tasks: Observable<[Task]>
    
    public init(tasksRepository: TasksRepository) {
        let addTaskNavigationRelay = PublishRelay<Void>()
        self.navigation = Navigation(addTask: addTaskNavigationRelay.asObservable())
        self.tasks = tasksRepository.tasks
        input.addTask.bind(to: addTaskNavigationRelay).disposed(by: disposeBag)
    }
}
