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
    
    @IBOutlet public weak var titleLabel: UILabel!
    @IBOutlet public weak var conLabel: UILabel!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
