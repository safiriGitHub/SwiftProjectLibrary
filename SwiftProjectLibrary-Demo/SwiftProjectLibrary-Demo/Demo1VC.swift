//
//  Demo1VC.swift
//  SwiftProjectLibrary-Demo
//
//  Created by pengpai on 2020/3/28.
//  Copyright © 2020 safiri. All rights reserved.
//

import UIKit

class Demo1VC: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        
        inputTFContentView.addSubview(sfzInputTFView)
        sfzInputTFView.snp_makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        inputDecimalTF.lengthLimitCb = { 8 }
        inputDecimalTF.text = "3.022"
        
        testTF.lengthLimitCb = { 5 }
        testTF.regularLimitTypeCb = { .RegularChineseNumbersLetters }
//        testTF.delegate = self
        
//        testTF1.regularLimitTypeCb = { .RegularDecimalNumbers }
//        testTF1.delegate = self
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print(range)
//        print(string)
//        
//        
//        return true
//    }
    
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
    
    
    @IBOutlet weak var inputDecimalTF: LimitDecimalTextField!
    @IBOutlet weak var testTF: LimitTextField!
     
    @IBOutlet weak var testTF1: UITextField!
    @IBOutlet weak var bankTF: LimitBankCardTextField!
}
