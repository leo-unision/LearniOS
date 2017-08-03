//
//  ViewController.swift
//  HelloWorld
//
//  Created by leo_unision on 2017/7/31.
//  Copyright © 2017年 unision. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func bottonPressed(_ sender: UIButton) {
        myLabel.text = "Hello World"
    }


}

