//
//  UITextView+Extension.swift
//  ChildPediatric
//
//  Created by safiri on 2018/5/11.
//  Copyright © 2018年 safiri. All rights reserved.
//

import UIKit

public extension UITextView {
    func setHtmlString(_ htmlString: String) {
        if let data = htmlString.data(using: String.Encoding.unicode) {
            self.attributedText = try? NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType:NSAttributedString.DocumentType.html], documentAttributes: nil)
            
        }
    }
}
