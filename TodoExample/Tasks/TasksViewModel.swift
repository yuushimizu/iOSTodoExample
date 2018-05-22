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

protocol TasksNavigator : class {
    func addTask()
}

class TasksViewModel {
    typealias Navigator = TasksNavigator
    
    struct Input {
        public let addTask = PublishRelay<Void>()
    }
    
    private let disposeBag = DisposeBag()
    
    private let tasksRepository: TasksRepository
    
    public weak var navigator: Navigator?
    
    public var tasks: Observable<[Task]> {
        return tasksRepository.tasks
    }
    
    public let input = Input()
    
    public init(tasksRepository: TasksRepository) {
        self.tasksRepository = tasksRepository
        input.addTask.bind {[weak self] in
            self?.navigator?.addTask()
        }.disposed(by: disposeBag)
    }
}
