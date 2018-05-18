//
//  AddTaskBinding.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/18.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class AddTaskBinding : NSObject {
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var view: AddEditTaskView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    public func bind(_ viewModel: AddTaskViewModel) {
        view.binding.bind(viewModel)
        saveButton.rx.tap.bind(to: viewModel.save).disposed(by: disposeBag)
        cancelButton.rx.tap.bind(to: viewModel.cancel).disposed(by: disposeBag)
    }
}
