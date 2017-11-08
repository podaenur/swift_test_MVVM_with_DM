//
//  RxBindController.swift
//  swift_test_MVVM_with_DM
//
//  Created by Evgeniy Akhmerov on 05/11/2017.
//  Copyright © 2017 Evgeniy Akhmerov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol RxBindViewModelInteracting {
    var words: Variable<[String]> { get }
    func didSelectRow(at indexPath: IndexPath)
}

class RxBindController: BaseViewController<RxBindViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private let bag = DisposeBag()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "RxBindController"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        viewModel.words.asObservable().bind(to: tableView.rx.items(cellIdentifier: "cell")) {
            (i, str, cell) in
            cell.textLabel?.text = str
            }.disposed(by: bag)
        
        tableView.rx.itemSelected.asObservable()
            .subscribe(onNext: {
                [weak self] (indexPath) in
                self?.tableView.deselectRow(at: indexPath, animated: true)
                self?.viewModel.didSelectRow(at: indexPath)
            }).disposed(by: bag)
    }
}
