//
//  StocksProvider.swift
//  Stock5
//
//  Created by Raphael Henrique on 06/02/20.
//  Copyright © 2020 TBD-patrichel. All rights reserved.
//

import Foundation
import NetworkLIB

/* Important Infos
 
 up to 5 API requests per minute and 500 requests per day)
  
 APIKEY
 5QM7EM88N0WT3XE5
 
 search
 https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=BIDI4&apikey=5QM7EM88N0WT3XE5
 
 quote
 https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=BIDI4.SAO&apikey=5QM7EM88N0WT3XE5
 
 */

typealias StockHandler = (Data?, SPError?) -> Void

struct SPError {
    let error: Error?
    let errorType: SPErrorType?
}

enum SPErrorType {
    case noResponse
    case parseError
    case unauthorized
    case noGoodStatusCode
    case genericError
}

struct SPParams {
    
}

protocol StockProviderProtocol {
    func searchForStock(keyword: String, params: SPParams?, completion: @escaping StockHandler)
}


class StocksProvider: StockProviderProtocol {
    
    let alphaVantageURL = "https://www.alphavantage.co/"
    let query = "query?function=SYMBOL_SEARCH&keywords="
    let apiKey = "&apikey=5QM7EM88N0WT3XE5"
    
    func searchForStock(keyword: String, params: SPParams? = nil, completion: @escaping StockHandler) {
        
        let completedURL = alphaVantageURL + query + keyword + apiKey
        
        RequestLib.client.request(url: completedURL) { (data, response, error) in
            
            guard error == nil else {
                let err = SPError(error: error, errorType: .genericError)
                completion(nil, err)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode > 299 else {
                let err = SPError(error: error, errorType: .noGoodStatusCode)
                completion(data, err)
                return
            }
            
            guard let content = data else {
                let err = SPError(error: error, errorType: .parseError)
                completion(data, err)
                return
            }
            
            completion(content, nil)
            
        }
        
    }
    
}


