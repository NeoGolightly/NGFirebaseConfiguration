//
//  FBOptions.swift
//
//
//  Created by Neo Golightly on 20.03.24.
//

import Foundation

/// Firebase project options
///
/// Use this instead of a firebase configuration file.
/// Usefull to injects different enviroments:
/// ```swift
/// extension FBOptions {
///   static let dev: FBOptions {
///     FBOptions(googleAppID: "1:513513451:ios:j5bjh34bhjbj5",
///               gcmSenderID: "12302130",
///               apiKey: "AafsadDSAFSDf3543FWEFAA",
///               projectID: "yourProjectID",
///               bundleID: "com.yourCompany.yourApp",
///               storageBucket: "yourBucket.appspot.com")
///   }
/// }
///
/// FBConfiguration.configure(options: .dev)
/// ```
public struct FBOptions {
  /// The Google App ID that is used to uniquely identify an instance of an app.
  public let googleAppID: String
  /// The Project Number from the Google Developer's console.
  ///
  /// Example: **012345678901**. Used to configure Firebase Cloud Messaging.
  public let gcmSenderID: String
  /// An API key used for authenticating requests from your Apple app, e.g.
  /// 
  /// The key must begin with "A" and contain exactly 39 alphanumeric characters, used to identify your
  /// app to Google servers.
  public let apiKey: String
  /// The Project ID from the Firebase console.
  ///
  /// Example: abc-xyz-123
  public let projectID: String
  /// The bundle ID for the application. 
  ///
  /// Defaults to **Bundle.main.bundleIdentifier** when not set manually or in a plist.
  public let bundleID: String
  /// The Google Cloud Storage bucket name, e.g. abc-xyz-123.storage.firebase.com
  public let storageBucket: String
  /// The OAuth2 client ID for Apple applications used to authenticate Google users.
  ///
  /// Example:  12345.apps.googleusercontent.com. Used for signing in with Google.
  public let clientID: String?
  /// The database root URL, e.g. http://abc-xyz-123.firebaseio.com
  public let databaseURL: String?
  /// The URL scheme used to set up Durable Deep Link service.
  public let deepLinkURLScheme: String?
  /// The App Group identifier to share data between the application and the application extensions.
  ///
  /// The App Group must be configured in the application and on the Apple Developer Portal.
  public let appGroupID: String?
  
  /// Creates a new FBOptions object
  /// - Parameters:
  ///   - googleAppID: The Google App ID that is used to uniquely identify an instance of an app
  ///   - gcmSenderID: The Project Number from the Google Developer's console
  ///   - apiKey: An API key used for authenticating requests from your Apple app
  ///   - projectID: The Project ID from the Firebase console
  ///   - bundleID: The bundle ID for the application
  ///   - storageBucket: The Google Cloud Storage bucket name
  ///   - clientID: The OAuth2 client ID for Apple applications used to authenticate Google users
  ///   - databaseURL: The database root URL
  ///   - deepLinkURLScheme: The URL scheme used to set up Durable Deep Link service
  ///   - appGroupID: The App Group identifier to share data between the application and the application extensions
  public init(googleAppID: String,
              gcmSenderID: String,
              apiKey: String,
              projectID: String,
              bundleID: String,
              storageBucket: String,
              clientID: String? = nil,
              databaseURL: String? = nil,
              deepLinkURLScheme: String? = nil,
              appGroupID: String? = nil) {
    self.googleAppID = googleAppID
    self.gcmSenderID = gcmSenderID
    self.apiKey = apiKey
    self.projectID = projectID
    self.bundleID = bundleID
    self.storageBucket = storageBucket
    self.clientID = clientID
    self.databaseURL = databaseURL
    self.deepLinkURLScheme = deepLinkURLScheme
    self.appGroupID = appGroupID
  }
}
