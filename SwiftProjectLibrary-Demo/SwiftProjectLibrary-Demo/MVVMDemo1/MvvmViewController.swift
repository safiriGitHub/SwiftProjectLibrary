//
//  MvvmViewController.swift
//  SwiftProjectLibrary-Demo
//
//  Created by safiri on 2020/6/11.
//  Copyright © 2020 safiri. All rights reserved.
//

import UIKit

class MvvmViewController: UIViewController, ViewModelDelegate {
   

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = ViewModel()
        viewModel.delegate = self
        
        userNameField.addTarget(self, action: #selector(userNameChanged(_:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(passwordChanged(_:)), for: .editingChanged)
    }
    
    // MARK: Action
    @objc func userNameChanged(_ field: UITextField) {
        viewModel.userNameDidChange(text: field.text)
    }
    
    @objc func passwordChanged(_ field: UITextField) {
        viewModel.passwordDidChange(text: field.text)
    }
    
    @IBAction func loginAction(sender: AnyObject) {
        viewModel.login()
    }
    
    //MARK: ViewModelDelegate
    
    func reloadViews() {
        userNameField.layer.borderColor = viewModel.userNameBorderColor?.cgColor
        passwordField.layer.borderColor = viewModel.passwordBorderColor?.cgColor
        loginButton.isEnabled = viewModel.loginButtonEnable
    }
    
    func alertInfo() {
        
    }
    
    func moveToHomeScreen() {
        
    }
    
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var viewModel: ViewModel!

}
