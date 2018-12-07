//
//  Sequence.swift
//  OneClick
//
//  Created by Sauvik Dolui on 23/08/17.
//  Copyright © 2016 e360 Technologies. All rights reserved.
//

import Foundation


// MARK: - Extension with utility functions
public extension Sequence where Iterator.Element: Hashable {
    
    /// Returns unique elements from a sequence
	var uniqueElements: [Iterator.Element] {
		return Array(
			Set(self)
		)
	}
}

// MARK: - An useful extension on Dictionary of type [String: String]
extension Dictionary where Key == String, Value == String {
    
    /// Generates a query string from a dictionary where type is [String: String]
    var queryString: String {
        let pairs = self.flatMap({ $0.key + String("=") + $0.value})
        return "?" + pairs.map({ String($0)}).joined (separator: "&")
    }
}
