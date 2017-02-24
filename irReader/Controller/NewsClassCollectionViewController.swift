//
//  NewsClassCollectionViewController.swift
//  irReader
//
//  Created by Fuxing Xue on 17/2/21.
//  Copyright © 2017年 Fuxing Xue. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

private let reuseIdentifier = "Cell"
class NewsClassCollectionViewController: UICollectionViewController {
    
    let fetchClassID: String = rootClassID
    private var newsClassList: [NewsClassItem] = []
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        self.clearsSelectionOnViewWillAppear = false
        self.collectionView!.register(UINib(nibName: "NewsClassCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        let url = fetchUrl(style: .getClass) + "?bclassid=" + fetchClassID
        Alamofire.request(url).responseJSON { response in
            if response.error != nil {
                let alertController = UIAlertController(title: "网络错误", message: "请检查网络或者稍后再试。", preferredStyle: .alert)
                let iKnowAction = UIAlertAction(title: "知道了", style: .default, handler: nil)
                alertController.addAction(iKnowAction)
                self.present(alertController, animated: true, completion: nil)
            } else {
                if let jsonData = response.data{
                    let json = JSON(data: jsonData)
                    for (_,subJson):(String,JSON) in json["result"] {
                        
                        let title = subJson["bclass"]["bclassname"].string!
                        let classID = subJson["bclass"]["bclassid"].string!
                        let bclassimgURL = subJson["bclass"]["bclassimg"].string!
                        let newsClassItem: NewsClassItem = NewsClassItem(title: title, classID: classID, classIconUrl: bclassimgURL)
                        self.newsClassList.append(newsClassItem)
                        self.collectionView?.reloadData()
                        
                    }
                }
                self.activityIndicator.stopAnimating()
            }
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return newsClassList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewsClassCollectionViewCell
        cell.label.text = newsClassList[indexPath.row].title
        cell.imageView.image = newsClassList[indexPath.row].classIcon
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "newsListController") as! NewsListTableViewController
        vc.newsClassID = newsClassList[indexPath.row].classID
        show(vc, sender: nil)
    }
    
}
