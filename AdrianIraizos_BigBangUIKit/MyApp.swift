//
//  MyApp.swift
//  AdrianIraizos_BigBangUIKit
//
//  Created by Adrian Iraizos Mendoza on 14/9/23.
//

import UIKit

class MyApp: UIApplication {
    override func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:], completionHandler completion: ((Bool) -> Void)? = nil) {
        if let host = url.host, host.contains("hackingwithswift.com") {
            super.open(url, options: options, completionHandler: completion)
        } else {
            completion?(false)
        }
    }
}
