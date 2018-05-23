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

protocol AddTaskNavigator: class {
    func saved()
    
    func cancel()
}

class AddTaskViewModel {
    typealias Navigator = AddTaskNavigator
    
    private let disposeBag = DisposeBag()

    public let input = (
        save: PublishRelay<Void>(),
        cancel: PublishRelay<Void>()
    )
    
    public let form = AddEditTaskFormViewModel()

    public let saveErrors: Observable<Error>
    
    public init(navigator: Navigator, tasksRepository: TasksRepository) {
        let (saved, saveErrors) = input.save.withLatestFrom(form.values)
            .flatMapLatest {[weak tasksRepository] values -> Observable<Result<Task>> in
                guard let tasksRepository = tasksRepository else {return Observable.empty()}
                return tasksRepository.save(task: Task(id: nil, title: values.title, content: values.content))
                    .asObservable()
                    .mapToResult()
            }
            .separateErrors()
        self.saveErrors = saveErrors
        saved.bind(onNext: {[weak navigator] _ in
            navigator?.saved()
            })
            .disposed(by: disposeBag)
        input.cancel.bind {[weak navigator] in
            navigator?.cancel()
            }
            .disposed(by: disposeBag)
    }
}
