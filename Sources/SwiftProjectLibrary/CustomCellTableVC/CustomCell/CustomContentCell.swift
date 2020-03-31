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
        // Initialization code
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet public weak var contentLabel: UILabel!
    
}
