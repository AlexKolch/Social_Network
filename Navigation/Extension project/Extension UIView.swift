//
//  Extension UIView.swift
//  Navigation
//
//  Created by Алексей Колыченков on 16.01.2023.
//

import UIKit

extension UIView {

    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            addSubview(subview)
        }
    }
}
