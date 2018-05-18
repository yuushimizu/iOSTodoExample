//
//  AddEditTaskBinding.swift
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

class AddEditTaskBinding: NSObject {
    private let disposeBag = DisposeBag()
    
    private var viewModel: AddEditTaskViewModel?
    
    @IBOutlet weak var title: UITextField!
    
    @IBOutlet weak var content: UITextView!
    
    @IBOutlet weak var contentPlaceholder: UIView!
    
    public func bind(_ viewModel: AddEditTaskViewModel) {
        self.viewModel = viewModel
        viewModel.title.bind(to: title.rx.text).disposed(by: disposeBag)
        title.rx.text.bind(to: viewModel.title).disposed(by: disposeBag)
        viewModel.content.bind(to: content.rx.text).disposed(by: disposeBag)
        content.rx.text.bind(to: viewModel.content).disposed(by: disposeBag)
        content.rx.text.map {$0?.isNotEmpty}.filterNil().bind(to: contentPlaceholder.rx.isHidden).disposed(by: disposeBag)
    }
}
