//
//  BigPictureSplitViewController.swift
//  Testinio_0
//
//  Created by Mateusz Orzoł on 22.06.2016.
//  Copyright © 2016 Mateusz Orzoł. All rights reserved.
//

import UIKit

class BigPictureSplitViewController: UISplitViewController {
    
    let detailView = BigPictureViewController()

    @IBAction func Small(sender: UIButton) {
        
        detailView.imageUrl = NSURL(string: urls.cat)
        
    }
    @IBAction func Big(sender: UIButton) {
        
        detailView.imageUrl = NSURL(string: urls.cat4k)

    }
}
