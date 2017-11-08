//
//  RxBindViewModel.swift
//  swift_test_MVVM_with_DM
//
//  Created by Evgeniy Akhmerov on 05/11/2017.
//  Copyright © 2017 Evgeniy Akhmerov. All rights reserved.
//

import RxSwift

class RxBindViewModel: BaseViewModel, RxBindViewModelInteracting {
    
    // MARK: - Properties
    
    let words = Variable<[String]>([])
    
    // MARK: - Life cycle
    
    override func initialSetup() {
        super.initialSetup()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            var set = CharacterSet.punctuationCharacters
            set.formUnion(.whitespaces)
            let strings = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis risus eget urna mollis ornare vel eu leo.".components(separatedBy: set)
            self.words.value = strings
        }
    }
    
    // MARK: - RxBindViewModelInteracting
    
    func didSelectRow(at indexPath: IndexPath) {
        print("Say: \(words.value[indexPath.row])")
    }
}
