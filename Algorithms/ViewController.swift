//
//  ViewController.swift
//  Algorithms
//
//  Created by Felix Carao on 20/08/2019.
//  Copyright © 2019 Felix Carao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var fontLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var fontSlider: UISlider!
    
    func fontSize(givenValue:Float)->Int{
        return Int((givenValue*100)+12)
    }
    
    let quoteList:[String] = [
    "1. I am death incarnate",
    "2. I dream and the world trembles",
    "3. Time flows",
    "4. I bring life and hope"
    ]
    var quoteNumber:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteLabel.text = quoteList[quoteNumber]
    }
    
    //MARK: Actions
    @IBAction func nextButton(_ sender: UIButton) {
        quoteNumber += 1
        if quoteNumber == quoteList.count{
            quoteNumber = 0
        }
        quoteLabel.text = quoteList[quoteNumber]
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        quoteNumber -= 1
        if quoteNumber == -1{
            quoteNumber = quoteList.count-1
        }
        quoteLabel.text = quoteList[quoteNumber]
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        fontLabel.text = "Font Size:\(fontSize(givenValue: sender.value))"
        quoteLabel.font=quoteLabel.font.withSize(CGFloat(fontSize(givenValue: sender.value)))
    }
}

