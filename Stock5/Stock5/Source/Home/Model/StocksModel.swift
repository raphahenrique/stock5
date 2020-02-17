//
//  StocksModel.swift
//  Stock5
//
//  Created by Raphael Henrique on 17/02/20.
//  Copyright © 2020 TBD-patrichel. All rights reserved.
//

import Foundation

// Model for AlphaVantage API
struct SAlphaVantageSearchAPIModel: Decodable {
    let bestMatches: [SAVResultModel]
}

struct SAVResultModel: Decodable {
    /*
                "1. symbol": "BIDI4.SAO",
                "2. name": "Banco Inter S.A.",
                "3. type": "Equity",
                "4. region": "Brazil/Sao Paolo",
                "5. marketOpen": "10:00",
                "6. marketClose": "17:30",
                "7. timezone": "UTC-03",
                "8. currency": "BRL",
                "9. matchScore": "0.6667"
     */
    
    let symbol: String
    let name: String
    let type: String
    let region: String
    let marketOpen: String
    let marketClose: String
    let timezone: String
    let currency: String
    let matchScore: String
    
    private enum CodingKeys: String, CodingKey {
        case symbol = "1. symbol"
        case name = "2. name"
        case type = "3. type"
        case region = "4. region"
        case marketOpen = "5. marketOpen"
        case marketClose = "6. marketClose"
        case timezone = "7. timezone"
        case currency = "8. currency"
        case matchScore = "9. matchScore"
    }
    
}
