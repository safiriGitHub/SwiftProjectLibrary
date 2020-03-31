//
//  CustomInputTFUnitCell.swift
//  LogisticsCargoOwner
//
//  Created by pengpai on 2020/1/14.
//  Copyright © 2020 qiluys. All rights reserved.
//

import UIKit

public class CustomInputTFUnitCell: UITableViewCell, RegisterCellFromNib {
    
    public static var height: CGFloat = 50
    
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var inputTFContentView: UIView!
    @IBOutlet weak var inputTFContentViewLeading: NSLayoutConstraint!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
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
    
    lazy var inputDecimalTF: LimitDecimalTextField = {
        let tf = LimitDecimalTextField()
        inputTFContentView.addSubview(tf)
        tf.snp_makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tf.keyboardType = .decimalPad
        tf.textAlignment = .right
        tf.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return tf
    }()
    
//    var inputType: CustomCellInputType = .None{
//        willSet {
//            if newValue == .Normal {
//
//            }else if newValue == .Decimal {
//
//            }
//        }
//    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
