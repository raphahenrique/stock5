//
//  SearchStockViewController.swift
//  Stock5
//
//  Created by Raphael Henrique on 07/02/20.
//  Copyright © 2020 TBD-patrichel. All rights reserved.
//

import UIKit

class SearchStockViewController: UIViewController {
    
    // to do - move it to view
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var stocksTableView: UITableView!
    
    // to do - create view model
    private lazy var business = HomeBusiness(provider: StocksProvider(), delegate: self)
    var searchResults = [SAVResultModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        stocksTableView.delegate = self
        stocksTableView.dataSource = self
        stocksTableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
        
    }
    
    func searchStock(term: String) {
        self.business.searchForStock(keyword: term)
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
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = stocksTableView.dequeueReusableCell(withIdentifier: "defaultCell")
        
        cell?.textLabel?.text = searchResults[indexPath.row].name
        cell?.detailTextLabel?.text = searchResults[indexPath.row].symbol
        
        return cell ?? UITableViewCell()
    }
    
}

extension SearchStockViewController: HomeBusinessDelegate {
    
    func didReturnSearch(matches: [SAVResultModel]) {
        DispatchQueue.main.async {
            self.searchResults = matches
            self.stocksTableView.reloadData()
            self.view.layoutIfNeeded()
        }
    }
    
    func errorToSearch() {
        print("nothing to show")
    }
    
    
    
    
    
}

