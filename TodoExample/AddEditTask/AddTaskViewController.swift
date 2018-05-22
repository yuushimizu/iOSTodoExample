//
//  AddTaskViewController.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/17.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import Foundation
import UIKit

class AddTaskViewController: UIViewController {
    @IBOutlet var binding: AddTaskBinding!
    
    override func viewDidLoad() {
        let tasksRepository = TasksRepository.shared //
        let viewModel = AddTaskViewModel(tasksRepository: tasksRepository)
        viewModel.navigator = self
        binding.bind(viewModel)
    }
    
    static func create() -> UIViewController {
        let storyboard = UIStoryboard(name: "AddTask", bundle: nil)
        return storyboard.instantiateInitialViewController()!
    }
}

extension AddTaskViewController : AddTaskViewModel.Navigator {
    func saved() {
        dismiss(animated: true, completion: nil)
    }
    
    func cancel() {
        dismiss(animated: true, completion: nil)
    }
}
