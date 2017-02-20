//
//  FetchNewsList.swift
//  irReader
//
//  Created by Fuxing Xue on 2017/2/19.
//  Copyright © 2017年 Fuxing Xue. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FetchNewsList: NSObject {
    
    static func fetchNewsList(number: Int) -> [NewsItem]{
        var list: [NewsItem] = []
        let url = fetchUrl(style: .getList)
        Alamofire.request(url).responseJSON { response in
            if let jsonData = response.data{
                let json = JSON(data: jsonData)
                for (_,subJson):(String,JSON) in json["result"][0] {
                    let newsItem: NewsItem = NewsItem(title: subJson["title"].stringValue, url: subJson["titleurl"].stringValue)

                    list.append(newsItem)
                }
            }
        }
        print("外面的list")
        while list == [] {
            print("循环中...")
        }
        print(list)
        return list
    }
}
