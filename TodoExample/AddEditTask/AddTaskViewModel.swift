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

class AddTaskViewModel {
    private let disposeBag = DisposeBag()
    
    private weak var tasksRepository: TasksRepository?

    public let input = (
        save: PublishRelay<Void>(),
        cancel: PublishRelay<Void>()
    )
    
    public let navigation: (
    saved: Observable<Task>,
    cancel: Observable<Void>
    )
    
    public let form = AddEditTaskFormViewModel()

    public let saveErrors: Observable<Error>
    
    public init(tasksRepository: TasksRepository) {
        let navigationRelays = (
            saved: PublishRelay<Task>(),
            cancel: PublishRelay<Void>()
        )
        self.navigation = (
            saved: navigationRelays.saved.asObservable(),
            cancel: navigationRelays.cancel.asObservable()
        )
        let (saved, saveErrors) = input.save.withLatestFrom(form.values)
            .flatMapLatest {values -> Observable<Result<Task>> in
                return tasksRepository.save(task: Task(id: nil, title: values.title, content: values.content))
                    .mapToResult()
                    .asObservable()
            }
            .separateErrors()
        self.saveErrors = saveErrors
        saved.bind(to: navigationRelays.saved).disposed(by: disposeBag)
        input.cancel.bind(to: navigationRelays.cancel).disposed(by: disposeBag)
    }
}
