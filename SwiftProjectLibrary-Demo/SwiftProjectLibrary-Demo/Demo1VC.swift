//
//  Demo1VC.swift
//  SwiftProjectLibrary-Demo
//
//  Created by pengpai on 2020/3/28.
//  Copyright © 2020 safiri. All rights reserved.
//

import UIKit

class Demo1VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        
        inputTFContentView.addSubview(sfzInputTFView)
        sfzInputTFView.snp_makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    @IBOutlet weak var inputTFContentView: UIView!
    
  let sfzInputTFView: InputTextFieldView = {
            let textField = LimitTextField()
            textField.font = UIFont.systemFont(ofSize: 20, weight: .light)
            textField.borderStyle = .none
    //        textField.textColor = UIColor.init(r: 51, g: 57, b: 69)
    //        textField.tintColor = UIColor.init(r: 51, g: 57, b: 69)
            textField.textColor = UIColor.gray
            textField.tintColor = UIColor.gray
            textField.uppercasedLimitCb = { true }
            textField.regularLimitTypeCb = { .RegularIdCard }
            let text = "手机号码"
            textField.attributedPlaceholder = InputTextFieldView.attrPlaceholerMake(text, foregroundColor: UIColor.red)
            
            let phoneInputTFView = InputTextFieldView(customTF: textField)
               
            phoneInputTFView.hintingLabel.text = text
               
            return phoneInputTFView
           }()

}
