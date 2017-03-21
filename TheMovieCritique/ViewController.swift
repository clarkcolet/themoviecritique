//
//  ViewController.swift
//  TheMovieCritique
//
//  Created by nishanth on 15/03/2017.
//  Copyright © 2017 Group3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let rstManager = RestManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        rstManager.makeTokenRequest()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

