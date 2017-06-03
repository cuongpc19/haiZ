//
//  ViewController.swift
//  haiZ
//
//  Created by AgribankCard on 6/3/17.
//  Copyright © 2017 cuongpc. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController, URLSessionDelegate, URLSessionTaskDelegate , URLSessionDataDelegate{
    
    
    
    @IBOutlet weak var uiImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageUrl = URL(string: "http://images.all-free-download.com/images/graphiclarge/business_time_193193.jpg")
        let defaultConfiguration = URLSessionConfiguration.default
        let mySession = URLSession(configuration: defaultConfiguration, delegate: self, delegateQueue: nil )
        
        let task = mySession.dataTask(with: imageUrl!, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            } else {
                let downloadedImage = UIImage(data: data!)
                self.performUIUpdatesOnMain  {
                    self.uiImage.image = downloadedImage
                }
            }
        })
        task.resume()
    }
    func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
        DispatchQueue.main.async {
            updates()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

