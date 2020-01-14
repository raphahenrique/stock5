//
//  HomeStockViewController.swift
//  Stock5
//
//  Created by Raphael Henrique on 13/01/20.
//  Copyright © 2020 TBD-patrichel. All rights reserved.
//

import UIKit

class HomeStockViewController: UIViewController {
    
    // MARK: - View
    
    @IBOutlet weak var buyPriceTextField: UITextField!
    @IBOutlet weak var sellPriceTextField: UITextField!
    
    @IBOutlet weak var percentageLabel: UILabel!
    
    
    // MARK: - Controller
    
    var buyPrice: Double = 0
    var sellPrice: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        convertValues()
        
        let difference = sellPrice - buyPrice
        let percentage = difference / buyPrice * 100
        
        percentageLabel.text = "\(percentage) %"
        if percentage < 0 {
            percentageLabel.textColor = .red
        } else {
            percentageLabel.textColor = .green
        }
        
    }
    
    @IBAction func clearFieldsTapped(_ sender: Any) {
        
        buyPriceTextField.text = ""
        sellPriceTextField.text = ""
        
        percentageLabel.text = "XX%"
    }
    
    
    private func convertValues() {
        if let priceStart = buyPriceTextField.text,  let buyPriceD = Double(priceStart.replacingOccurrences(of: ",", with: "." )), let priceEnd = sellPriceTextField.text, let sellPriceD = Double(priceEnd.replacingOccurrences(of: ",", with: "." )) {
            
            buyPrice = buyPriceD
            sellPrice = sellPriceD
        
        
        }
        
    }
    
}
