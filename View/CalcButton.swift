//
//  CalcButton.swift
//  CoolCalc
//
//  Created by Jadson on 15/11/21.
//

import UIKit

class CalcButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    func customizeView() {
        layer.cornerRadius = 50.0
    }

}
