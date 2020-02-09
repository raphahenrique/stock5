//
//  SearchStockViewController.swift
//  Stock5
//
//  Created by Raphael Henrique on 07/02/20.
//  Copyright © 2020 TBD-patrichel. All rights reserved.
//

import UIKit

class SearchStockViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var stocksTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        stocksTableView.delegate = self
        stocksTableView.dataSource = self
        
    }
    
    func searchStock(term: String) {
        
        
        print("i am just printing \(term)")
        
    }
    
}

extension SearchStockViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if var searchTerm = searchTextField.text {
            searchTerm += string
            if searchTerm.count > 2 {
                searchStock(term: searchTerm)
            }
        }
        return true
    }
}

extension SearchStockViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
    
    
}
