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

protocol AddTaskNavigator : class {
    func saved()
    
    func cancel()
}

class AddTaskViewModel {
    typealias Navigator = AddTaskNavigator
    
    private let disposeBag = DisposeBag()
    
    private let tasksRepository: TasksRepository
    
    public weak var navigator: Navigator?
    
    public let form = AddEditTaskFormViewModel()

    public let input = (
        save: PublishRelay<Void>(),
        cancel: PublishRelay<Void>())
    
    public init(tasksRepository: TasksRepository) {
        self.tasksRepository = tasksRepository
        input.save.withLatestFrom(form.values)
            .flatMapLatest {self.tasksRepository.save(task: Task(id: nil, title: $0.title, content: $0.content))}
            .subscribe {event in
                switch event {
                case .next:
                    self.navigator?.saved()
                case .error(let error):
                    os_log("(>_<) %@", error.localizedDescription)
                default:
                    break
                }
            }.disposed(by: disposeBag)
        input.cancel.bind {[weak self] in self?.navigator?.cancel()}.disposed(by: disposeBag)
    }
}
