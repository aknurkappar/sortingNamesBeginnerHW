//
//  customOptionButtons.swift
//  sortingNamesBeginnerHW
//
//  Created by коня on 05.10.2023.
//

import UIKit

class CustomOptionButton: UIButton {
    
    var isSelectedOption : Bool = false
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tintColor = UIColor.systemGray4
        layer.cornerRadius = 10
    }
    
    func selectOption(){
        tintColor = UIColor.systemBlue
        isSelectedOption = true

    }
    
    func undoSelection(){
        tintColor = UIColor.systemGray4
        isSelectedOption = false
    }
    

}


