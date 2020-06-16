//
//  ViewModel.swift
//  SwiftProjectLibrary-Demo
//
//  Created by safiri on 2020/6/11.
//  Copyright © 2020 safiri. All rights reserved.
//

import Foundation
import UIKit

class ViewModel: ViewModelInterface {
    
    var delegate: ViewModelDelegate?
    
    var userNameBorderColor: UIColor? {
        return usernameValid ? UIColor.black : UIColor.red
    }
    
    var passwordBorderColor: UIColor? {
        return passwordValid ? UIColor.black : UIColor.red
    }
    
    var loginButtonEnable: Bool {
        return usernameValid && passwordValid
    }
    
    private var usernameValid = false
    private var passwordValid = false
    private var userName: String?
    private var password: String?
    
    func userNameDidChange(text: String?) {
        if let t = text {
            if t.count < 6 {
                usernameValid = false
            }else {
                usernameValid = true
            }
        }
        userName = text
        delegate?.reloadViews()
    }
    
    func passwordDidChange(text: String?) {
        if let t = text {
            if t.count < 6 {
                passwordValid = false
            }else {
                passwordValid = true
            }
        }
        password = text
        delegate?.reloadViews()
    }
    
    func login() {
        delegate?.moveToHomeScreen()
    }
    
    
}
