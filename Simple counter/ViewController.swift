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
        
        let title = "Action history:\n\n"
        let attributedTitle = NSMutableAttributedString(
            string: title,
            attributes: [.font: UIFont.boldSystemFont(ofSize: 12)]
        )
        
        textViewField.attributedText = attributedTitle
    }
    
    private func convertDateIntoString(date: Date) -> String {
        let converter = DateFormatter()
        converter.dateFormat = "dd.MM.yyyy HH.mm.ss"
        return converter.string(from: date)
    }
    
    private func addActionHistory(action: String) -> Void {
        let description = "\(convertDateIntoString(date: Date())) - \(action)\n"
        
        let attributedDescription = NSAttributedString(
            string: description,
            attributes: [.font: UIFont.systemFont(ofSize: 10)]
        )
        
        let updatedText = NSMutableAttributedString(attributedString: textViewField.attributedText)
        updatedText.append(attributedDescription)
        textViewField.attributedText = updatedText
        
        let range = NSMakeRange(textViewField.text.count - 1, 1)
        textViewField.scrollRangeToVisible(range)
    }
    
    @IBAction func plusButtonClicked(_ sender: UIButton) {
        counterNumber += 1
        counterLabel.text = "\(counterNumber)"
        addActionHistory(action: "plus button clicked")
    }
    
    @IBAction func minusButtonClicked(_ sender: UIButton) {
        if counterNumber == 0 {
            addActionHistory(action: "attempt to make counter value negative")
            return
        } else {
            counterNumber -= 1
            counterLabel.text = "\(counterNumber)"
            addActionHistory(action: "minus button clicked")
        }
    }
    
    @IBAction func dropCounterButtonClicked(_ sender: UIButton) {
        counterNumber = 0
        counterLabel.text = "\(counterNumber)"
        addActionHistory(action: "drop button clicked")
    }
}

