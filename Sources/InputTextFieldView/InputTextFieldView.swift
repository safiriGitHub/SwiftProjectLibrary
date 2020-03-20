//
//  InputTextFieldView.swift
//  LogisticsDriver
//
//  Created by pengpai on 2019/12/2.
//  Copyright © 2019 qiluys. All rights reserved.
//

import UIKit
import Snapkit

class InputTextFieldView: UIView, UITextFieldDelegate {

    
    init(type: InputTextFieldViewType) {
        super.init(frame: .zero)
        inputType = type
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
    }
    
    func setupSubviews() {
        
        addSubview(hintingLabel)
        self.hintingLabel.snp_makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(15)
        }
        
        addSubview(lineView)
        self.lineView.snp_makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        addSubview(inputContentview)
        inputContentview.snp_makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-1)
            make.top.equalToSuperview().offset(35)
        }
        
        inputTF.delegate = self
        inputTF.isSecureTextEntry = inputType == .Password
        inputContentview.addSubview(inputTF)
        inputTF.snp_makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        addSubview(rightOperationBtn)
        rightOperationBtn.snp_makeConstraints { (make) in
            make.trailing.equalToSuperview()
            make.centerY.equalTo(inputContentview.snp_centerY)
        }
        rightOperationBtn.addTarget(self, action: #selector(rightOperationBtnClick), for: .touchUpInside)
    }
    
    static func attrPlaceholerMake(_ string: String, foregroundColor color: UIColor) -> NSAttributedString {
        return NSAttributedString.init(string:string, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20, weight: .light), NSAttributedString.Key.foregroundColor:color])
    }
    
    //MARK: - action animation
    func animationLineView(actitity: Bool) {
        if actitity {
            self.lineView.snp_updateConstraints { (make) in
                make.height.equalTo(2)
            }
            self.lineView.backgroundColor = lineViewActiveColor
            self.hintingLabel.textColor = hintLabelActiveColor
        }else {
            self.lineView.snp_updateConstraints { (make) in
                make.height.equalTo(1)
            }
            self.lineView.backgroundColor = lineViewNormalColor
            self.hintingLabel.textColor = hintLabelNormalColor
        }
    }
    
    func animationHintingLabel(inputed: Bool) {
        
        if inputed {
            self.hintingLabel.isHidden = false
            UIView.animate(withDuration: 0.35) {
                self.hintingLabel.alpha = 1
            }
        }else {
            UIView.animate(withDuration: 0.5, animations: {
                self.hintingLabel.alpha = 0
            }) { (_) in
                self.hintingLabel.isHidden = true
            }
        }
    }
    
    @objc func rightOperationBtnClick() {
        self.rightOperationBtn.isSelected = !self.rightOperationBtn.isSelected
        if inputType == .Password {
            self.inputTF.isSecureTextEntry = !self.rightOperationBtn.isSelected
        }
    }
 
    
    //MARK: - delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.isActivity = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.isActivity = false
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string.isEmpty {
            if range.location == 0 {
                if var t = textField.text,  let r = Range(range, in: t) {
                    t.replaceSubrange(r, with: string)
                    isInputed = !t.isEmpty
                }
            }
        }else {
            isInputed = true
        }
        
        if maxLimit > 0 {
            if  range.location == maxLimit && range.length == 0 {
                // 限制了输入时候的情况
                return false
            }
            if (range.location < maxLimit && (string.count + range.location) > maxLimit) { // 限制了粘贴字符时候的情况
                return false
            }
        }
        
        if inputType == .Password {
            let textFieldContent = textField.text as NSString?
            let updatedString = textFieldContent?.replacingCharacters(in: range, with: string)
            textField.text = updatedString
            return false
        }
        
        return true
    }

    
    //MARK: - params
    /// 输入模式
    var inputType: InputTextFieldViewType = .Normal
    /// 控制最长输入
    var maxLimit: Int = 0
    
    /// 提示label
    let hintingLabel: UILabel = {
        let hint = UILabel()
        hint.textColor = UIColor.init(r: 150, g: 150, b: 150)
        hint.font = UIFont.systemFont(ofSize: 15, weight: .light)
        hint.isHidden = true
        hint.alpha = 0
        return hint
    }()
    /// 输入框底部线活动颜色
    var lineViewActiveColor: UIColor? = UIColor(hexString: "5e2adc")
    /// 输入框底部线普通颜色
    var lineViewNormalColor: UIColor? = UIColor.init(r: 232, g: 232, b: 232)
    
    /// 输入框
    let inputTF: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 20, weight: .light)
        textField.borderStyle = .none
        textField.textColor = UIColor.init(r: 51, g: 57, b: 69)
        textField.tintColor = UIColor.init(r: 51, g: 57, b: 69)
        return textField
    }()
    
    /// 输入框底部线
    let lineView: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.init(r: 232, g: 232, b: 232)
        return line
    }()
    /// 输入框底部线活动颜色
    var hintLabelActiveColor: UIColor? = UIColor.init(r: 150, g: 150, b: 150)
    /// 输入框底部线普通颜色
    var hintLabelNormalColor: UIColor? = UIColor.init(r: 222, g: 222, b: 222)
    
    /// 输入框右边按钮
    let rightOperationBtn: UIButton = { //这里的逻辑待封装优化，先这样
        let btn = UIButton(type: .custom)
        btn.isHidden = true
        return btn
    }()
    /// 输入框右边按钮是否隐藏
    var isRightOperationHidden: Bool = true {
        willSet {
            self.rightOperationBtn.isHidden = newValue
        }
    }
    
    /// 是否在活跃状态
    var isActivity: Bool = false {
        willSet {
            animationLineView(actitity: newValue)
        }
    }
    
    /// 是否含有输入
    var isInputed: Bool = false {
        willSet {
            if self.isInputed != newValue {
                animationHintingLabel(inputed: newValue)
            }
        }
    }
    
    /// 输入框的placeholder
    var attrPlaceholder:NSAttributedString? {
        willSet {
            self.inputTF.attributedPlaceholder = newValue
        }
    }
    
    let inputContentview = UIView()
 
    
    
}
enum InputTextFieldViewType {
    case Normal, Password
}
