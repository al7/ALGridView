//
//  ViewController.swift
//  ALGridView
//
//  Created by Alexandre Leite on 4/11/15.
//  Copyright (c) 2015 Alexandre Leite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK- View Lifecycle

    override func loadView() {
        self.view = UIView(frame: UIScreen.mainScreen().bounds)
        self.view.backgroundColor = UIColor.blueColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

