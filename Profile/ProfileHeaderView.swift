//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Алексей Колыченков on 10.12.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    //let spiderLabel = UILabel()
    var myTextField = UITextField()
    
    private func setupTextField() {
        let textFieldFrame = CGRect(x: 250, y: 200, width: 200, height: 31)
        
        myTextField = UITextField(frame: textFieldFrame)
        myTextField.textAlignment = .center
        myTextField.placeholder = "Waiting for something"
        myTextField.font = UIFont.boldSystemFont(ofSize: 14)
        
    }
    
    private func spiderLabel() -> UILabel {
        let spiderLabelFrame = CGRect(x: 0, y: 0, width: 200, height: 21)
        let spiderLabel = UILabel(frame: spiderLabelFrame)
        spiderLabel.center = CGPoint(x: 210, y: 100)
        spiderLabel.textAlignment = .center
        spiderLabel.text = "Spider-man"
        spiderLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return spiderLabel
    }
    
let button = UIButton()
    
    private func setupButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 50, y: 300, width: 600, height: 50))
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        
        return button
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let v = superview {
            self.center = v.center
        }
    }
}
