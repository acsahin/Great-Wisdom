//
//  MoreAppsViewController.swift
//  Great Wisdom
//
//  Created by ACS on 18.02.2021.
//

import UIKit
import WebKit

class MoreAppsViewController: UIViewController, WKUIDelegate {

    @IBOutlet var webView: WKWebView!
    
    //var webView2: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.viewWillAppear(true)
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        let url = URL(string: kUrlString_moreApps)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
}
