//
//  WebViewController.swift
//  irReader
//
//  Created by Fuxing Xue on 2017/2/20.
//  Copyright © 2017年 Fuxing Xue. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate{

    @IBOutlet weak var webBrowser: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var webUrlString = "http://www.kuvku.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webBrowser.delegate = self
        let url = URL(string: webUrlString)
        let request = URLRequest(url: url!)
        webBrowser.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        //启动菊花转
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        //结束菊花转
        activityIndicator.stopAnimating()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
