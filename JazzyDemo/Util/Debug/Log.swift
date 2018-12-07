//
//  Logger.swift
//  BidRide
//
//  Created by Sauvik Dolui on 21/04/2017.
//  Copyright © 2016 Innofied Solutions Pvt. Ltd. All rights reserved.
//

import Foundation

/// Enum which maps an appropiate symbol which added as prefix for each log message
///
/// - error: Log type error
/// - info: Log type info
/// - debug: Log type debug
/// - verbose: Log type verbose
/// - warning: Log type warning
/// - severe: Log type severe
enum LogPrefix: String {
    case error = "[‼️]"
    case info = "[ℹ️]"
    case debug = "[💬]"
    case verbose = "[🔬]"
    case warning = "[⚠️]"
    case severe = "[🔥]"
}

/// Wrapping Swift.print() within DEBUG flag
///
/// - Note: *print()* might cause [security vulnerabilities](https://codifiedsecurity.com/mobile-app-security-testing-checklist-ios/)
///
/// - Parameter object: The object which is to be logged
///
func print(_ object: Any) {
    // Only allowing in DEBUG mode
    #if DEBUG
    Swift.print(object)
    #endif
}


/// An enum to present current config of `Log` utility
///
/// - debug: In this mode, all logs are streamed to console
/// - release: With this config print is not allowed
///

enum LogLevel {
    case debug
    case release
}

public class Log {
    
    static var logLevel: LogLevel = .debug
    static var dateFormat = "yyyy-MM-dd hh:mm:ssSSS"
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    
    // MARK: - Loging methods
    
    
    /// Logs error messages on console with prefix [‼️]
    ///
    /// - Parameters:
    ///   - object: Object or message to be logged
    ///   - filename: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - column: Column number of the log message
    ///   - funcName: Name of the function from where the logging is done
    public class func e( _ message: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if logLevel == .debug {
            print("\(Date().toString()) \(LogPrefix.error.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(message)")
        }
    }
    /// Logs info messages on console with prefix [ℹ️]
    ///
    /// - Parameters:
    ///   - object: Object or message to be logged
    ///   - filename: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - column: Column number of the log message
    ///   - funcName: Name of the function from where the logging is done
    public class func i ( _ message: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if logLevel == .debug {
            print("\(Date().toString()) \(LogPrefix.info.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(message)")
        }
    }
    /// Logs debug messages on console with prefix [💬]
    ///
    /// - Parameters:
    ///   - object: Object or message to be logged
    ///   - filename: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - column: Column number of the log message
    ///   - funcName: Name of the function from where the logging is done
    public class func d( _ message: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if logLevel == .debug {
            print("\(Date().toString()) \(LogPrefix.debug.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(message)")
        }
    }
    /// Logs messages verbosely on console with prefix [🔬]
    ///
    /// - Parameters:
    ///   - object: Object or message to be logged
    ///   - filename: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - column: Column number of the log message
    ///   - funcName: Name of the function from where the logging is done
    public class func v( _ message: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if logLevel == .debug {
            print("\(Date().toString()) \(LogPrefix.verbose.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(message)")
        }
    }
    /// Logs warnings verbosely on console with prefix [⚠️]
    ///
    /// - Parameters:
    ///   - object: Object or message to be logged
    ///   - filename: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - column: Column number of the log message
    ///   - funcName: Name of the function from where the logging is done
    public class func w( _ message: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if logLevel == .debug {
            print("\(Date().toString()) \(LogPrefix.warning.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(message)")
        }
    }
    /// Logs severe events on console with prefix [🔥]
    ///
    /// - Parameters:
    ///   - object: Object or message to be logged
    ///   - filename: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - column: Column number of the log message
    ///   - funcName: Name of the function from where the logging is done
    public class func s( _ message: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if logLevel == .debug {
            print("\(Date().toString()) \(LogPrefix.severe.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(message)")
        }
    }
    
    /// Extract the file name from the file path
    ///
    /// - Parameter filePath: Full file path in bundle
    /// - Returns: File Name with extension
    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
}


// MARK: - Date Extension
internal extension Date {
    /// Internal Extension to get string representative of a date using `dateFormatter`'s format
    ///
    /// - Returns: String representation of the date object
    func toString() -> String {
        return Log.dateFormatter.string(from: self as Date)
    }
}
