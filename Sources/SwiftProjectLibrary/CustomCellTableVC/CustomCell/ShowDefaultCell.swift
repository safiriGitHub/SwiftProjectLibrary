//
//  ShowDefaultCell.swift
//  LogisticsDriver
//
//  Created by pengpai on 2019/12/11.
//  Copyright © 2019 qiluys. All rights reserved.
//

import UIKit

public class ShowDefaultCell: UITableViewCell, RegisterCellFromNib {
    public static var height: CGFloat { 55 }
    
    public let titleLabel = UILabel()
    public let contentLabel = UILabel()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        contentView.addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        titleLabel.textColor = UIColor(hex: "5B6469")
        
        contentView.addSubview(contentLabel)
        contentLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        contentLabel.textColor = UIColor(hex: "333945")
        contentLabel.numberOfLines = 2
        contentLabel.textAlignment = .right
        
        titleLabel.snp_makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.right.equalTo(contentLabel.snp_left).offset(-10)
        }
        contentLabel.snp_makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
            make.left.equalTo(titleLabel.snp_right).offset(10)
        }
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
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
