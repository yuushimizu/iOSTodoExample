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

protocol TasksNavigator: class {
    func addTask()
}

class TasksViewModel {
    typealias Navigator = TasksNavigator
    
    struct Input {
        public let addTask = PublishRelay<Void>()
    }
    
    private let disposeBag = DisposeBag()
    
    public let input = Input()
    
    public let tasks: Observable<[Task]>
    
    public init(navigator: Navigator, tasksRepository: TasksRepository) {
        self.tasks = tasksRepository.tasks
        input.addTask.bind {[weak navigator] in
            navigator?.addTask()
            }.disposed(by: disposeBag)
    }
}
