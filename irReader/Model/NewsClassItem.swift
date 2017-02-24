//
//  NewClassItem.swift
//  irReader
//
//  Created by Fuxing Xue on 2017/2/21.
//  Copyright © 2017年 Fuxing Xue. All rights reserved.
//

import UIKit

class NewsClassItem: NSObject {
    var title: String
    var classID: String
    var classIcon: UIImage
    
    init(title: String, classID: String, classIconUrl: String) {
        self.title = title
        self.classID = classID
        if classIconUrl == "" {
            classIcon = #imageLiteral(resourceName: "noneImg")
        } else {
            let iconUrl = URL(string: (domainUrl + classIconUrl))
            let imageData = NSData(contentsOf: iconUrl!)
            classIcon = UIImage(data: imageData as! Data)!
        }
    }
}
