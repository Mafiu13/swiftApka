//
//  NumbersViewController.swift
//  Testinio_0
//
//  Created by Mateusz Orzoł on 22.06.2016.
//  Copyright © 2016 Mateusz Orzoł. All rights reserved.
//

import UIKit

class NumbersViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBAction func slide(sender: UISlider) {
        let number = sender.value
        numberLabel.text = "\(number)"
    }
    
    @IBAction func resetButton(sender: UIButton) {
        slider.setValue(slider.minimumValue, animated: true)
        numberLabel.text = "\(slider.value)"
    }
    
}
