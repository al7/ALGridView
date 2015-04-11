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
        self.view = ViewControllerView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

class ViewControllerView: UIView {
    
    var gridView: GridView?
    
    //MARK- Initializers
    
    init() {
        super.init(frame: UIScreen.mainScreen().bounds)
        self.backgroundColor = UIColor.whiteColor()
        
        var gridFrame = CGRect.zeroRect
        gridFrame.size.width = min(self.bounds.size.width, self.bounds.size.height)
        gridFrame.size.height = gridFrame.size.width
        
        var margins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        /** SAMPLE CODE BELOW **/
        
        self.gridView = GridView(frame: gridFrame, columns: 3, rows: 3, margins: margins, padding: 10.0) {
            column, row, contentView in
            
            let label = UILabel(frame: contentView.bounds)
            label.textAlignment = .Center
            label.backgroundColor = UIColor.lightGrayColor()
            label.textColor = UIColor.darkGrayColor()
            label.text = "\(column)x\(row)"
            contentView.addSubview(label)
        }
        self.addSubview(self.gridView!)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK- Base Overrides
    
    override func layoutSubviews() {
        self.gridView?.center = self.center
    }
}

