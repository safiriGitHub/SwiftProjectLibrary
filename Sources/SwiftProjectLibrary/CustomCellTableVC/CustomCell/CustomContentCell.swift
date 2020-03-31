//
//  CustomContentCell.swift
//  LogisticsCargoOwner
//
//  Created by pengpai on 2020/2/28.
//  Copyright © 2020 qiluys. All rights reserved.
//

import UIKit

public class CustomContentCell: UITableViewCell, RegisterCellFromNib {
    
    public static var height: CGFloat = 40
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        contentView.addSubview(contentLabel)
        contentLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        contentLabel.textColor = UIColor(hex: "333945")
        
        contentLabel.snp_makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.bottom.equalToSuperview()
        }
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public let contentLabel = UILabel()
}
