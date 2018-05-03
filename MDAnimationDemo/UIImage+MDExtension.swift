//
//  UIImage+MDExtension.swift
//  MDCredit
//
//  Created by Alan on 2017/11/10.
//  Copyright © 2017年 MD. All rights reserved.
//

import UIKit

extension UIImage{
    open class func creatImageWithColor(color:UIColor)->UIImage{
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    

}
