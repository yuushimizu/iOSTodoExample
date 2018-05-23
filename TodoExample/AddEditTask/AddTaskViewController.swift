//
//  AddTaskViewController.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/17.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class AddTaskViewController: UIViewController {
    @IBOutlet var binding: AddTaskBinding!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        let viewModel = AddTaskViewModel(
            tasksRepository: TasksRepository.shared //
        )
        viewModel.navigation.saved
            .bind {[weak self] _ in
                self?.dismiss(animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
        viewModel.navigation.cancel
            .bind {[weak self] in
                self?.dismiss(animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
        binding.bind(viewModel)
    }
    
    static func create() -> UIViewController {
        let storyboard = UIStoryboard(name: "AddTask", bundle: nil)
        return storyboard.instantiateInitialViewController()!
    }
}
