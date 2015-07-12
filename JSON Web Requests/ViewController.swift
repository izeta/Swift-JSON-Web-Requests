//
//  ViewController.swift
//  JSON Web Requests
//
//  Created by Zeta on 7/11/15.
//  Copyright (c) 2015 Zeta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func query(sender: UIButton) {
        //creating web request
        var escapedSearchTerm = "mario"
        let urlPath = "https://itunes.apple.com/search?term=\(escapedSearchTerm)&media=software"
        let url:NSURL! = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            
            //once request is completed, this inside code is executed
            println("Task completed")
            if((error) != nil) {
                // If there is an error in the web request, print it to the console
                println(error.localizedDescription)
            }
            
            /*
            // If wanted to serialize the JSON data, use this code
            var err: NSError?
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as! NSDictionary
            if(err != nil) {
                // If there is an error parsing JSON, print it to the console
                println("JSON Error \(err!.localizedDescription)")
            }
            let results: NSArray = jsonResult["results"] as! NSArray
            dispatch_async(dispatch_get_main_queue(), {
                println(results)
            })
            */
            
            // Using the data as a simple String
            dispatch_async(dispatch_get_main_queue(), {
                println("textView")
                self.textView.text = NSString(data: data, encoding: NSUTF8StringEncoding) as! String
            })
        })
        task.resume()
    }
    

}

