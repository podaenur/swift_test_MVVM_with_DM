//
//  WithDataModelViewModel.swift
//  swift_test_MVVM_with_DM
//
//  Created by Evgeniy Akhmerov on 02/11/2017.
//  Copyright © 2017 Evgeniy Akhmerov. All rights reserved.
//

import Foundation

class WithDataModelViewModel: BaseViewModel, WithDataModelOutput/*, DataModelContainer*/ {
    
    var didLoadData: (([String]) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        dataModel.fetchData()
    }
    
    // MARK: - WithDataModelOutput
    
    func dataDidFetched(_ data: [String]) {
        didLoadData?(data)
    }
    
    // MARK: - DataModelContainer
    
//    typealias DataModelType = WithDataModel
//    var dataModel: WithDataModel = WithDataModel()
////    var dataModel: WithDataModelInput
}
