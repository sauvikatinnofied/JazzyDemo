//
//  Array.swift
//  OneClick
//
//  Created by Sauvik Dolui on 28/08/17.
//  Copyright © 2017 Innofied. All rights reserved.
//

import Foundation

// MARK: - An extension on Array with useful utility functions
public extension Array {
    
    /// Safe element access function rather than accessing element using subscript
    ///
    /// ```
    ///     // Can crash due to array out of bounds exception
    ///     let element = myArray[i]
    ///     // Avoid crash using
    ///     guard let element = myArray.safeAccess(i) else { return }
    ///     // It't time to play with array element
    /// ```
    ///
    /// - Parameter index: The index of the element which is to be accessed
    /// - Returns: The `element` if exists else `nil`
    func safeAccess(index: Int) -> Element? {
        guard index < count else {
            return nil
        }
        return self[index]
    }
    
    
    /// A safe and crash free way to remove element from an array
    ///
    /// ```
    ///     // Can crash due to array out of bounds exception
    ///     myArray.remove(at: i)
    ///     // Avoid crash using
    ///     myArray.safeDelete(i)
    /// ```
    ///
    /// - Parameter index: The index of the element which needs to be removed
    /// - Returns: The deleted `element` if found or `nil` if element is not found.
    @discardableResult mutating func safeDelete(index: Int) -> Element? {
        guard index < count else {
            return nil
        }
        return remove(at: index)
    }
    
}
