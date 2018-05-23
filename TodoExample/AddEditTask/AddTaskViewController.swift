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
    
    let tasksRepository = TasksRepository.shared //
    
    override func viewDidLoad() {
        let viewModel = AddTaskViewModel(
            navigator: self,
            tasksRepository: tasksRepository
        )
        binding.bind(viewModel)
    }
    
    static func create() -> UIViewController {
        let storyboard = UIStoryboard(name: "AddTask", bundle: nil)
        return storyboard.instantiateInitialViewController()!
    }
}

extension AddTaskViewController: AddTaskViewModel.Navigator {
    func saved() {
        dismiss(animated: true, completion: nil)
    }
    
    func cancel() {
        dismiss(animated: true, completion: nil)
    }
}
