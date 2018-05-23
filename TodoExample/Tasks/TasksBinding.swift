//
//  TasksBinding.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/17.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class TasksBinding: NSObject {
    private var viewModel: TasksViewModel?
    
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var taskList: UITableView!
    
    @IBOutlet weak var addTaskButton: UIBarButtonItem!
    
    public func bind(_ viewModel: TasksViewModel) {
        self.viewModel = viewModel
        viewModel.tasks.asDriver(onErrorDriveWith: Driver.empty())
            .drive(taskList.rx.items(cellIdentifier: "TaskListCell")) {row, task, cell in
                cell.textLabel?.text = task.title
            }.disposed(by: disposeBag)
        addTaskButton.rx.tap.bind(to: viewModel.input.addTask).disposed(by: disposeBag)
    }
}
