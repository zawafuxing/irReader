//
//  ViewController.swift
//  irReader
//
//  Created by Fuxing Xue on 2017/2/18.
//  Copyright © 2017年 Fuxing Xue. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(FetchNewsList.fetchNewsList(number: 10))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

