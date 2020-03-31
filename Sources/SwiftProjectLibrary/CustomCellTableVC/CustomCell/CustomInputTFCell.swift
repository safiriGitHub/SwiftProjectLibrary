//
//  CustomInputTFCell.swift
//  LogisticsCargoOwner
//
//  Created by pengpai on 2020/1/13.
//  Copyright © 2020 qiluys. All rights reserved.
//

import UIKit

/// 根据具体业务自定义 
public class CustomInputTFCell: UITableViewCell, RegisterCellFromNib {
    
    public static var height: CGFloat = 50
    
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var inputTFContentView: UIView!
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var accessoryImageView: UIImageView!
    @IBOutlet weak var inputTFContentViewTrailing: NSLayoutConstraint!
    @IBOutlet weak var inputTFContentViewLeading: NSLayoutConstraint!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        accessoryImageView.isHidden = true
    }
    
    enum inputCellStyle {
        case normal
        case starNormal
        case starNormal2
        case starImportant
        case noStarLeadingZero
    }
    func configUIStyle(_ style: inputCellStyle) {
        
        if style == .normal {
            titlelabel.textColor = UIColor(hex: "666666")
            starImageView.isHidden = true
            inputTFContentViewTrailing.constant = 20
        }else if style == .starNormal {
            titlelabel.textColor = UIColor(hex: "666666")
            starImageView.isHidden = false
            inputTFContentViewTrailing.constant = 20
        }else if style == .starNormal2 {
            titlelabel.textColor = UIColor(hex: "666666")
            starImageView.isHidden = false
            inputTFContentViewTrailing.constant = 30
        }else if style == .starImportant {
            titlelabel.textColor = UIColor(hex: "131212")
            starImageView.isHidden = false
            inputTFContentViewTrailing.constant = 35
        }else if style == .noStarLeadingZero {
            titlelabel.textColor = UIColor(hex: "9B9FAA")
            titlelabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
            starImageView.isHidden = true
            inputTFContentViewTrailing.constant = 35
            inputTFContentViewLeading.constant = 7
        }
    }
    
    func clearSeparatorLine() {
        separatorInset = UIEdgeInsets(top: 0, left: frame.width, bottom: 0, right: 0)
    }
    
    
    lazy var inputTF: UITextField = {
        let tf = UITextField()
        inputTFContentView.addSubview(tf)
        tf.snp_makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tf.textAlignment = .right
        tf.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return tf
    }()
    
    lazy var inputPhoneTF: LimitTextField = {
        let tf = LimitTextField()
        inputTFContentView.addSubview(tf)
        tf.snp_makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tf.lengthLimitCb = { 11 }
        tf.keyboardType = .phonePad
        tf.textAlignment = .right
        tf.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return tf
    }()
    
    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
