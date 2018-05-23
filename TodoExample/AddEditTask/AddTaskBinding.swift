//
//  AddTaskBinding.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/18.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import Foundation
import UIKit
import os.log
import RxSwift
import RxCocoa

class AddTaskBinding: NSObject {
    private var viewModel: AddTaskViewModel?
    
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var form: AddEditTaskForm!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    public func bind(_ viewModel: AddTaskViewModel) {
        self.viewModel = viewModel
        form.bind(viewModel.form)
        saveButton.rx.tap.bind(to: viewModel.input.save).disposed(by: disposeBag)
        cancelButton.rx.tap.bind(to: viewModel.input.cancel).disposed(by: disposeBag)
        viewModel.saveErrors
            .bind {error in
                os_log("(>_<) < %@", error.localizedDescription)
            }
            .disposed(by: disposeBag)
    }
}
