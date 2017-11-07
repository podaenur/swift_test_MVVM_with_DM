//
//  WithDataModelController.swift
//  swift_test_MVVM_with_DM
//
//  Created by Evgeniy Akhmerov on 02/11/2017.
//  Copyright © 2017 Evgeniy Akhmerov. All rights reserved.
//

import UIKit

class WithDataModelController: BaseViewController<WithDataModelViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var textInfoLabel: UILabel! {
        didSet {
            textInfoLabel.text = nil
        }
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "With"
        
        viewModel.didLoadData = {
            [weak self] (data) in
            
            self?.textInfoLabel.text = data.joined(separator: " ")
        }
    }
}
