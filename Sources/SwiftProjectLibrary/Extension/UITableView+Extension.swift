//
//  UITableView+Extension.swift
//  ChildPediatric
//
//  Created by safiri on 2018/4/21.
//  Copyright © 2018年 safiri. All rights reserved.
//

import UIKit

public protocol RegisterCellFromNib {
    static var height: CGFloat { get }
}

public extension RegisterCellFromNib {
    static var identifier: String { return "\(self)" }
    static var nib: UINib? { return UINib(nibName: "\(self)", bundle: nil) }
}

public extension UITableView {
    /// 注册 cell 的方法
    func zs_registerCell<T: UITableViewCell>(cell: T.Type) where T:RegisterCellFromNib {
        if let nib = T.nib {
            register(nib, forCellReuseIdentifier: T.identifier)
        }else {
            register(cell, forCellReuseIdentifier: T.identifier)
        }
    }
    
    ///从缓存池出队已经存在的 cell
    func zs_dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: RegisterCellFromNib {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
    
    func zs_dequeueReusableCell<T: UITableViewCell>() -> T where T: RegisterCellFromNib {
        return dequeueReusableCell(withIdentifier: T.identifier) as! T
    }

}
