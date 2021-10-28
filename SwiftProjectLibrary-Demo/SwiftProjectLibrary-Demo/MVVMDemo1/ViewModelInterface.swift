//
//  ViewModelInterface.swift
//  SwiftProjectLibrary-Demo
//
//  Created by safiri on 2020/6/11.
//  Copyright © 2020 safiri. All rights reserved.
//

import Foundation
import UIKit

@objc protocol ViewModelDelegate {
    func reloadViews()
    func alertInfo()
    func moveToHomeScreen()
}

protocol ViewModelInterface {
    var delegate: ViewModelDelegate? { get set }
    
    var userNameBorderColor: UIColor? { get }
    var passwordBorderColor: UIColor? { get }
    var loginButtonEnable: Bool { get }
    
    func userNameDidChange(text: String?)
    func passwordDidChange(text: String?)
    func login()
}
