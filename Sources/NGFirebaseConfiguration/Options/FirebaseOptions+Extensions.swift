//
//  FirebaseOptions+Extensions.swift
//
//
//  Created by Neo Golightly on 20.03.24.
//

import Foundation
import FirebaseCore

extension FirebaseOptions {
  
  /// Adds a convenience initializer to FirebaseOptions.
  ///
  /// Bridges ``FBOptions`` to FirebaseOptions
  /// - Parameter options: Set your ``FBOptions`` here
  convenience init(options: FBOptions){
    self.init(googleAppID: options.googleAppID, gcmSenderID: options.gcmSenderID)
    self.apiKey = options.apiKey
    self.projectID = options.projectID
    self.bundleID = options.bundleID
    self.storageBucket = options.storageBucket
    self.appGroupID = options.appGroupID
    self.clientID = options.clientID
    self.databaseURL = options.databaseURL
    self.deepLinkURLScheme = options.deepLinkURLScheme
  }
}
