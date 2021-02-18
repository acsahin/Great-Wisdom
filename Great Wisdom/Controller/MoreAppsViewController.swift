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
        let url = URL(string: "https://play.google.com/store/apps/details?id=com.acs.tabuu_app")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
}
