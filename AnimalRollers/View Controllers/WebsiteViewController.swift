//
//  WebViewViewController.swift
//  SpriteKitTest
//
//  Created by Xcode User on 2018-04-24.
//  Copyright © 2018 Harjot. All rights reserved.
//

import UIKit

class WebsiteViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet var webView : UIWebView!
    @IBOutlet var activity : UIActivityIndicatorView!
    
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activity.isHidden=true
        activity.startAnimating()
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        activity.isHidden=false
        activity.startAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlAddress=URL(string:"https://en.wikipedia.org/wiki/Pass_the_Pigs")
        let url=URLRequest(url:urlAddress!)
        webView.loadRequest(url as URLRequest)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}

}
/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */
