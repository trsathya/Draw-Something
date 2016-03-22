//
//  ViewController.swift
//  DrawSomething
//
//  Created by Sathya Rajaraman on 3/18/16.
//  Copyright © 2016 Sathyakumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clear() {
        (view as! MyView).clear()
    }
}

