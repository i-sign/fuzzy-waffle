//
//  ViewController.swift
//  iosApp
//
//  Created by Warinthorn Tuadsin on 11/1/2566 BE.
//  Copyright © 2566 BE orgName. All rights reserved.
//

import UIKit
import WebKit
import shared

class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    var webView: WKWebView!
    let config = Config()
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
    }
    
    func webView(_ webView: WKWebView,
                   createWebViewWith configuration: WKWebViewConfiguration,
                   for navigationAction: WKNavigationAction,
                 windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil, let url = navigationAction.request.url {
            UIApplication.shared.open(url)
        }
        
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: config.targetURL())
        let request = URLRequest(url: url!)
        webView.load(request)
    }
}
