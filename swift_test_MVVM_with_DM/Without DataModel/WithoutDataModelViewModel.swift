//
//  WithoutDataModelViewModel.swift
//  swift_test_MVVM_with_DM
//
//  Created by Evgeniy Akhmerov on 01/11/2017.
//  Copyright © 2017 Evgeniy Akhmerov. All rights reserved.
//

import Foundation

class WithoutDataModelViewModel: BaseViewModel {
    
    var didLoadData: (([String]) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let strings = ["Z", "Y", "X", "A"]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.didLoadData?(strings)
        }
    }
}
