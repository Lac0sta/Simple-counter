//
//  ViewController.swift
//  Simple counter
//
//  Created by Aleksei Frolov on 01.09.2024.
//

import UIKit

class ViewController: UIViewController {

    private var counterNumber: UInt = 0
    
    @IBOutlet private var counterLabel: UILabel!
    @IBOutlet private var plusButton: UIButton!
    @IBOutlet private var minusButton: UIButton!
    @IBOutlet private var dropCounterButton: UIButton!
    @IBOutlet private var textViewField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = "\(counterNumber)"
        textViewField.isEditable = false
        textViewField.text = "Action history:\n"
        textViewField.font = UIFont.boldSystemFont(ofSize: 13)
    }
    
    @IBAction func plusButtonClicked(_ sender: UIButton) {
        counterNumber += 1
        counterLabel.text = "\(counterNumber)"
    }
    
    @IBAction func minusButtonClicked(_ sender: UIButton) {
        counterNumber -= 1
        counterLabel.text = "\(counterNumber)"
    }
    
    @IBAction func dropCounterButtonClicked(_ sender: UIButton) {
        counterNumber = 0
        counterLabel.text = "\(counterNumber)"
    }
    
    
    

}

