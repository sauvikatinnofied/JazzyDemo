//
//  Double.swift
//  OneClick
//
//  Created by Sauvik Dolui on 23/08/17.
//  Copyright © 2017 Innofied Solution Pvt. Ltd. All rights reserved.
//

import Foundation

extension Double {
    func round(to: Int) -> Double {
        let divisor = pow(10.0, Double(to))
        return Darwin.round(self * divisor) / divisor
    }
    var currencyString: String {
        let numberformatter = NumberFormatter()
        numberformatter.numberStyle = .currency
        return numberformatter.string(from: NSNumber(value: self))!
    }
    
    /// <#Description#>
    var currencyValue: Double {
        return Double(currencyString)!
    }
    
    
    /// Generates a currency string
    ///
    /// - Parameters:
    ///   - currencySymbol: Currency Symbol, default is $
    ///   - needSpace: Whether a space is required in between the `currency` symbol and the `value`
    /// - Returns: currrent symbol with the value and string Example `$ 45.00` or `$45.00`
    func getCurrencyString(currencySymbol: String = "$", needSpace: Bool = false ) -> String {
        let numberformatter = NumberFormatter()
        numberformatter.currencySymbol = needSpace ? currencySymbol + " " : currencySymbol
        numberformatter.numberStyle = .currency
        
        return numberformatter.string(from: NSNumber(value: self))!
    }

}
