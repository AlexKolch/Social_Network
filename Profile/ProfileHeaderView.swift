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
   private func spiderLabel() -> UILabel {
        let spiderLabelFrame = CGRect(x: 0, y: 0, width: 200, height: 21)
        let spiderLabel = UILabel(frame: spiderLabelFrame)
        spiderLabel.center = CGPoint(x: 210, y: 100)
        spiderLabel.textAlignment = .center
        spiderLabel.text = "Spider-man"
        spiderLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return spiderLabel
    }
}
