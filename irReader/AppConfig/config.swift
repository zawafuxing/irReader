//
//  File.swift
//  irReader
//
//  Created by Fuxing Xue on 2017/2/19.
//  Copyright © 2017年 Fuxing Xue. All rights reserved.
//

import UIKit

//Json服务器配置
let serverUrlPerfix = "http://www.kuvku.com/e/api/"
enum fetchStyle {
    case getClass
    case getList
}

//域名URL前缀
let domainUrl = "http://www.kuvku.com/"

func fetchUrl(style: fetchStyle) ->String {
    switch style {
    case .getClass:
        return serverUrlPerfix+"getNewsClass.php"
    case .getList:
        return serverUrlPerfix+"getNewsList.php"
    }
}

let rootClassID = "2"
