//
//  ViewController.swift
//  iOSDemo
//
//  Created by AP1-01 on 2025/8/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        log.debug(tag: "D", "Debug")
        
        log.error(["key1":"value1", "key2":"value2", "key3":"value3"])
        
        log.verbose(tag: "V", "Verbose")
        
        log.markVerbose = "XXX"
        log.verbose(tag: "V", "Verbose")

    }


}

