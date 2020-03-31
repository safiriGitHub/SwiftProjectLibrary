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
    
    @IBOutlet public weak var titlelabel: UILabel!
    @IBOutlet public weak var unitLabel: UILabel!
    @IBOutlet public weak var starImageView: UIImageView!
    @IBOutlet public weak var inputTFContentView: UIView!
    @IBOutlet public weak var inputTFContentViewLeading: NSLayoutConstraint!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
    }
    
    public lazy var inputTF: UITextField = {
        let tf = UITextField()
        inputTFContentView.addSubview(tf)
        tf.snp_makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        tf.textAlignment = .right
        tf.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return tf
    }()
    
    public lazy var inputDecimalTF: LimitDecimalTextField = {
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
    

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
