//
//  RxBindViewModel.swift
//  swift_test_MVVM_with_DM
//
//  Created by Evgeniy Akhmerov on 05/11/2017.
//  Copyright © 2017 Evgeniy Akhmerov. All rights reserved.
//

import Foundation

class RxBindViewModel: BaseViewModel, RxBindViewModelInteracting {
    
    private(set) var words = [String]()
    
    // MARK: - Life cycle
    
    override func initialSetup() {
        super.initialSetup()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            var set = CharacterSet.punctuationCharacters
            set.formUnion(.whitespaces)
            let strings = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis risus eget urna mollis ornare vel eu leo.".components(separatedBy: set)
            self.words = strings.flatMap({ $0.isEmpty ? nil : $0 })
        }
    }
    
    // MARK: - RxBindViewModelInteracting
    
    var numberOfRows: Int {
        return words.count
    }
    
    func text(at indexPath: IndexPath) -> String? {
        return words[indexPath.row]
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        print("Say: \(words[indexPath.row])")
    }
}
