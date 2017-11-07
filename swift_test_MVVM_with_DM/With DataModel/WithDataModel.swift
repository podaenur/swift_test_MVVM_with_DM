//
//  WithDataModel.swift
//  swift_test_MVVM_with_DM
//
//  Created by Evgeniy Akhmerov on 02/11/2017.
//  Copyright © 2017 Evgeniy Akhmerov. All rights reserved.
//

import Foundation

class WithDataModel: DataModel, WithDataModelInput {
    
//    weak var viewModel: WithDataModelOutput?
    weak var viewModel: WithDataModelViewModel?
    
    // MARK: - WithDataModelInput
    
    func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            let strings = ["A", "B", "C", "Z"]
            self.viewModel?.dataDidFetched(strings)
        }
    }
}
