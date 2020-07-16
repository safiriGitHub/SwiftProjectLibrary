//
//  ShowDefaultCell.swift
//  LogisticsDriver
//
//  Created by pengpai on 2019/12/11.
//  Copyright © 2019 qiluys. All rights reserved.
//

import UIKit

public class ShowDefaultCell: UITableViewCell, RegisterCellFromNib, CustomInfoCellProtocol {
    
    public static var height: CGFloat { 55 }
    
    public var customInfoTitleLabel = UILabel()
    public var customInfoContentLabel = UILabel()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        contentView.addSubview(customInfoTitleLabel)
        customInfoTitleLabel.font = UIFont.systemFont(ofSize: 16)
        customInfoTitleLabel.textColor = UIColor(hex: "333")
        
        contentView.addSubview(customInfoContentLabel)
        customInfoContentLabel.font = UIFont.systemFont(ofSize: 16)
        customInfoContentLabel.textColor = UIColor(hex: "333")
        customInfoContentLabel.numberOfLines = 2
        customInfoContentLabel.textAlignment = .right
        
        customInfoTitleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.right.equalTo(customInfoContentLabel.snp.left).offset(-10)
        }
        customInfoContentLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
            make.left.equalTo(customInfoTitleLabel.snp.right).offset(10)
        }
        customInfoTitleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
