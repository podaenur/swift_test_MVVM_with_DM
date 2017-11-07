//
//  Base.swift
//  swift_test_MVVM_with_DM
//
//  Created by Evgeniy Akhmerov on 01/11/2017.
//  Copyright © 2017 Evgeniy Akhmerov. All rights reserved.
//

import UIKit

//  VIEW MODEL

protocol ViewModelContext {}

protocol ViewModel {
    init(with context: ViewModelContext?)
    
    func initialSetup()
    func viewDidLoad()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
}

class BaseViewModel: ViewModel {
    required init(with context: ViewModelContext?) {}
    func initialSetup() {}
    func viewDidLoad() {}
    func viewWillAppear(_ animated: Bool) {}
    func viewDidAppear(_ animated: Bool) {}
    func viewWillDisappear(_ animated: Bool) {}
    func viewDidDisappear(_ animated: Bool) {}
}

//  VIEW CONTROLLER

class BaseViewController<ViewModelType: ViewModel>: UIViewController {
    var viewModel: ViewModelType!
    
    init(viewModel: ViewModelType, nibName nibNameOrNil: String? = nil, bundle nibBundleOrNil: Bundle? = nil) {
        self.viewModel = viewModel
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.viewModel.initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.viewWillDisappear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear(animated)
    }
}

//  DATA MODEL

protocol DataModelInput {}              //  подписывается дата модель
protocol DataModelOutput: class {}      //  подписывается вью модель

protocol DataModel {
    associatedtype ViewModelType: DataModelOutput
    weak var viewModel: ViewModelType? { get }
}


protocol DataModelContainer {
    associatedtype DataModelType: DataModelInput
    var dataModel: DataModelType { get }
}
