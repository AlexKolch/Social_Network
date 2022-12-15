//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Алексей Колыченков on 10.12.2022.
//

import Foundation
import UIKit

final class ProfileHeaderView: UIView {
    
    // MARK: - Private Properties
    //let spiderLabel = UILabel()
    let button = UIButton()
    var myTextField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(setupTextField())
        addSubview(spiderLabel())
        addSubview(setupButton())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupTextField() -> UITextField {
        let textFieldFrame = CGRect(x: 250, y: 200, width: 200, height: 31)
        myTextField = UITextField(frame: textFieldFrame)
        myTextField.textAlignment = .center
        myTextField.placeholder = "Waiting for something"
        myTextField.font = UIFont.boldSystemFont(ofSize: 14)
        return myTextField
        
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
