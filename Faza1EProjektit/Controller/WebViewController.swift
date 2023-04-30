//
//  WebViewController.swift
//  Faza1EProjektit
//
//  Created by shqiperimramadani on 26.04.23.
//

import UIKit
import WebKit
import NVActivityIndicatorView

class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    @IBOutlet weak var webVIew: WKWebView!
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var loaderView: NVActivityIndicatorView!
    var urlString: Page?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webVIew.navigationDelegate = self
        
        loaderView.startAnimating()
        if let urlString = urlString {
            loadUrl(urlString: urlString)
        }
    }
    
    func loadUrl(urlString: Page) {
        if let pageURL = URL(string: urlString.url) {
            let urlRequest = URLRequest(url: pageURL)
            print(urlRequest)
            self.webVIew.load(urlRequest)
            
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loaderView.stopAnimating()
        backGroundView.isHidden = true
    }
}
