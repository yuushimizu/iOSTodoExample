//
//  TasksViewController.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/17.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import UIKit
import RxSwift

class TasksViewController: UIViewController {
    @IBOutlet var binding: TasksBinding!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let viewModel = TasksViewModel(
            tasksRepository: TasksRepository.shared //
        )
        viewModel.navigation.addTask
            .bind {[weak self] in
                self?.show(AddTaskViewController.create(), sender: nil)
            }
            .disposed(by: disposeBag)
        binding.bind(viewModel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
