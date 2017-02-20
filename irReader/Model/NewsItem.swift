//
//  News.swift
//  irReader
//
//  Created by Fuxing Xue on 2017/2/19.
//  Copyright © 2017年 Fuxing Xue. All rights reserved.
//

import UIKit

class NewsItem: NSObject {

    var title: String
    var url: String
    
    init(title: String, url: String) {
        self.title = title
        self.url = url
    }
    
    
}
