//
//  AddEditTaskFormBinding.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/18.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxOptional

class AddEditTaskFormBinding: NSObject {
    private var viewModel: AddEditTaskFormViewModel?
    
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var title: UITextField!
    
    @IBOutlet weak var content: UITextView!
    
    @IBOutlet weak var contentPlaceholder: UIView!
    
    public func bind(_ viewModel: AddEditTaskFormViewModel) {
        self.viewModel = viewModel
        viewModel.title.asDriver().drive(title.rx.text).disposed(by: disposeBag)
        title.rx.text.bind(to: viewModel.title).disposed(by: disposeBag)
        viewModel.content.asDriver().drive(content.rx.text).disposed(by: disposeBag)
        content.rx.text.bind(to: viewModel.content).disposed(by: disposeBag)
        content.rx.text.map {$0?.isNotEmpty}.filterNil().bind(to: contentPlaceholder.rx.isHidden).disposed(by: disposeBag)
    }
}
