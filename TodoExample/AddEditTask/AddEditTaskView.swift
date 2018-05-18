//
//  AddEditTaskView.swift
//  TodoExample
//
//  Created by Yuu Shimizu on 2018/05/18.
//  Copyright © 2018 yuushimizu. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class AddEditTaskView: UIView {
    @IBOutlet var binding: AddEditTaskBinding!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeView()
    }
    
    private func initializeView() {
        let view = UINib(nibName: "AddEditTaskView", bundle: Bundle(for: type(of:self))).instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
