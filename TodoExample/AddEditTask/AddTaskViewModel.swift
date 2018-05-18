//
//  AddTaskViewModel.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/18.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import Foundation
import os.log
import RxSwift
import RxCocoa

class AddTaskViewModel : AddEditTaskViewModel {
    private let disposeBag = DisposeBag()
    
    private let tasksRepository: TasksRepository
    
    public weak var navigator: AddTaskNavigator?
    
    public let save = PublishRelay<Void>()
    
    public let cancel = PublishRelay<Void>()
    
    public init(tasksRepository: TasksRepository) {
        self.tasksRepository = tasksRepository
        super.init()
        save.emit {[weak self] in self?.saveTask()}.disposed(by: disposeBag)
        cancel.emit {[weak self] in self?.navigator?.cancel()}.disposed(by: disposeBag)
    }
    
    private func saveTask() {
        let task = Task(id: nil, title: title.value, content: content.value)
        _ = self.tasksRepository.save(task: task).subscribe {event in
            switch event {
            case .success:
                self.navigator?.saved()
            case .error(let error):
                os_log("(>_<) %@", error.localizedDescription)
            }
        }
    }
}
