//
//  TasksViewController.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/17.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController {
    @IBOutlet var binding: TasksBinding!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tasksRepository = TasksRepository.shared //
        let viewModel = TasksViewModel(tasksRepository: tasksRepository)
        viewModel.navigator = self
        binding.bind(viewModel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TasksViewController : TasksViewModel.Navigator {
    func addTask() {
        self.show(AddTaskViewController.create(), sender: nil)
    }
}
