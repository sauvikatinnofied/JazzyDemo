//
//  Bundle+Verison.swift
//  Busapp
//
//  Created by Writayan Das on 16/11/18.
//  Copyright © 2018 Innofied Solution Pvt. Ltd. All rights reserved.
//

import Foundation


// MARK: - An extension to get useful version information
extension Bundle {
    
    
    /// Provides the release version number from `Info.plist`
    ///
    /// - Note:
    ///     Please refere to `Bundle Version String, Short` key of `Info.plist`.
    ///
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    // Provides the build number from `Info.plist`
    ///
    /// - Note:
    ///     Please refere to `Bundle Number` key of `Info.plist`.
    ///
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    
    /// Provides the App's Display Name Under App Icon
    ///
    /// - Note:
    ///     Please refere to `Bundle Display Name` key of `Info.plist`.
    ///
    var appName: String {
        return (object(forInfoDictionaryKey: "CFBundleDisplayName") as? String) ?? ""
    }
    
    /// Provides full version string of the application
    ///
    /// - Important: It is generated concatinating Release Version and Sho
    var appVersion: String {
        return "\(releaseVersionNumber ?? "").\(buildVersionNumber ?? "")"
    }
}
