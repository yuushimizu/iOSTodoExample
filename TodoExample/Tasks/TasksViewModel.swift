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
    private let disposeBag = DisposeBag()
    
    private let tasksRepository: TasksRepository
    
    public weak var navigator: TasksNavigator?
    
    public var tasks: Observable<[Task]> {
        return tasksRepository.tasks
    }
    
    public let addTask = PublishRelay<Void>()
    
    public init(tasksRepository: TasksRepository) {
        self.tasksRepository = tasksRepository
        self.addTask.emit {[weak self] in
            self?.navigator?.addTask()
        }.disposed(by: disposeBag)
    }
}
