//
//  DetailViewController.swift
//  NewsApp
//
//  Created by 原田　礼朗 on 2016/06/30.
//  Copyright © 2016年 reo harada. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailWebView: UIWebView!
    var url: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // NSURLに変換する
        let nsurl = NSURL(string: self.url)
        // NSURLをリクエストする
        let request = NSURLRequest(URL: nsurl!)
        // detailWebViewに表示する
        self.detailWebView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
