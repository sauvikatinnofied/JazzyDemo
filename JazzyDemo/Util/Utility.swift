//
//  Utility.swift
//  e360
//
//  Created by Sauvik Dolui on 29/11/16.
//  Copyright © 2016 Innofied Solution Pvt. Ltd. All rights reserved.
//

import Foundation
import UIKit


class Utility {
	
	// MARK: - JSON
    
    /// Generates JSON object from a .json file
    ///
    /// - Note:
    /// The JSON object could be `[String: Any]` dictionary or an `array` of `[String: Any]`
    ///
    /// - Parameter file: The path to the JSON file
    /// - Returns: JSON Object []
    
	class func JSON(file: String) -> Any? {
		
		guard let path = Bundle.main.url(forResource: file, withExtension: "json") else {
			print("File Not Found \(file).json")
			return nil
		}
		
		do {
			let stringData = try Data(contentsOf: path)
			return try JSONSerialization.jsonObject(with: stringData, options: .mutableContainers)
		} catch (let error) {
			print("\(error)")
			return nil
		}
	}
	
	// MARK: - Date Calculations
    /// It generate user facing display text for a specific date
    ///
    /// - Parameters:
    ///   - formatString: The format of the disply date text
    ///   - date: The date which for which string is to be generated
    /// - Returns: User facing string representation of the date
	class func getDateStringFromFormat(formatString: String, date: Date) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = formatString
		return dateFormatter.string(from: date)
	}
    
    
    /// Prepares a date object from a string representation of a date and the date format
    ///
    /// - Parameters:
    ///   - formatString: The date format
    ///   - dateString: Date's string equivalent
    /// - Returns: The date object
    class func getDateFromDateString(formatString: String, dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        //dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = formatString
        return dateFormatter.date(from: dateString)!
    }
    
    /// Genrates ISO8601 format string from a `Date` object
    ///
    /// - Parameter date: The date which is to be converted
    /// - Returns: The string representation of the date
	class func getISO8601DateString(date: Date) -> String {
		return getDateStringFromFormat(formatString: "yyyy-MM-dd'T'HH:mm:ss.SSSZ", date: date)
	}
    
    class func getNumberOfItemsText(numberOfItems: Int) -> String {
        return numberOfItems > 1 ? "Items" : "Item"
    }
    
	// MARK: - Log
	class func logAllAvailableFonts() {
		for family in UIFont.familyNames {
			print("\(family)")
			for name in UIFont.fontNames(forFamilyName: family) {
				print("   \(name)")
			}
		}
	}
    class func showSimpleAlert(title: String?, message: String?) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
            let rootVC = appDelegate.window?.rootViewController else {
                Log.e("Could not find the root view controller, can not present the Alert")
                return
        }
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil)) // Not handler is added
        rootVC.present(alertController, animated: true, completion: nil) // No Completion Handler is added
    }
    
    class func createTimeStampFromDateString(dateString : String, withFormat : String) -> Double{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = withFormat
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let date = dateFormatter.date(from: dateString)
        let timeIntervalsince1970 = date?.timeIntervalSince1970
        
        return timeIntervalsince1970!
    }
    
    class func createTimeStampFromDate(date : Date) -> Double{
        let timeIntervalsince1970 = date.timeIntervalSince1970
        return timeIntervalsince1970
    }

    
    class func createDateStringFromTimeStamp(timeStamp : NSNumber, withFormat : String) -> String{
        
        let date = Date(timeIntervalSince1970: TimeInterval(Double(timeStamp.int64Value) / 1000.0))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = withFormat
        let stringDate = dateFormatter.string(from: date)
        
        return stringDate
    }
    
    
    class func createDateFromTimeStamp(timeStamp : NSNumber) -> Date{
        
        let date = Date(timeIntervalSince1970: TimeInterval(Double(timeStamp.int64Value) / 1000.0))        
        return date
    }

    class func getJSONFromDictionary(dictionary: [String: AnyObject]) -> String? {
        do {
            let data = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
            return String(data: data, encoding:.utf8)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        return nil
    }
    
    // MARK: VERSION
    class func getVersionString() -> String {
        // CFBundleDisplayName
        // CFBundleShortVersionString Version Number
        // CFBundleVersion Build Number
        guard let infoPlistDictionary = Bundle.main.infoDictionary  else {
            return ""
        }
        let appName = "V".localized //infoPlistDictionary["CFBundleDisplayName"] as? String ?? ""
        let versionNumber = infoPlistDictionary["CFBundleShortVersionString"] as? String ?? ""
        let buildNumber = infoPlistDictionary["CFBundleVersion"] as? String ?? ""
        
        //return appName + " " + "\(buildNumber)"
        return appName + " " + versionNumber + "(\(buildNumber))"
    }
    

}
