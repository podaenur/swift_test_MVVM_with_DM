//
//  WithDataModelIO.swift
//  swift_test_MVVM_with_DM
//
//  Created by Evgeniy Akhmerov on 02/11/2017.
//  Copyright © 2017 Evgeniy Akhmerov. All rights reserved.
//

import Foundation

/// Что приходит в дата модель
protocol WithDataModelInput: DataModelInput {
    func fetchData()
}

/// Что возвращается из дата модели
protocol WithDataModelOutput: DataModelOutput {
    func dataDidFetched(_ data: [String])
}
