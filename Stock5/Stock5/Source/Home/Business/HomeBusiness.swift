//
//  HomeBusiness.swift
//  Stock5
//
//  Created by Raphael Henrique on 08/02/20.
//  Copyright © 2020 TBD-patrichel. All rights reserved.
//

import Foundation

protocol HomeBusinessProtocol {
    
    
    
}

protocol HomeBusinessDelegate: class {
    
    func didReturnSearch()
    func errorToSearch()
    
    
}

class HomeBusiness: HomeBusinessProtocol {
    
    private let provider: StockProviderProtocol
    
    var delegate: HomeBusinessDelegate?
    
    
    init(provider: StockProviderProtocol = StocksProvider(), delegate: HomeBusinessDelegate? = nil) {
        self.provider = provider
        self.delegate = delegate
    }
    
    func searchForStock(keyword: String) {
        
        provider.searchForStock(keyword: keyword, params: nil) { (data, error) in
            
            guard error == nil else {
                self.delegate?.errorToSearch()
                return
            }
            
            if let content = data {
                let conv = self.unwrap(data: content)
                
                if let matches = conv?.bestMatches {
                    for item in matches {
                        print(item.name)
                    }
                }
            }
            
        }
        
    }
    
    internal func unwrap(data: Data) -> SAlphaVantageSearchAPIModel? {
        do {
            let cardList = try JSONDecoder().decode(SAlphaVantageSearchAPIModel.self, from: data)
            return cardList
        } catch {
            print("DEBUG -> ERROR parsing")
            return nil
        }
    }
    
}
