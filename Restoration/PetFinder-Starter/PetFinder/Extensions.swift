//
//  Extensions.swift
//  PetFinder
//
//  Created by Luke Parham on 8/31/15.
//  Copyright © 2015 Luke Parham. All rights reserved.
//

import UIKit

extension UIImageView {
  
  func loadURL(url: NSURL?) {
    guard let url = url else {
      return
    }
    
    let urlRequest = NSURLRequest(url: url as URL)
    
    URLSession.shared.dataTask(with: urlRequest as URLRequest) { (data, response, error) -> Void in
        if let response = response, let data = data, response.isHTTPResponseValid() {
            DispatchQueue.main.async {
                if UIImage(data: data) == nil {
                    self.image = UIImage(named: "standardCat")
                } else {
                    self.image = UIImage(data: data)
                }
            }
        }
      }.resume()
  }
  
}

extension URLResponse {
  func isHTTPResponseValid() -> Bool {
    guard let response = self as? HTTPURLResponse else {
      return false
    }
    
    return (response.statusCode >= 200 && response.statusCode <= 299)
  }
}
