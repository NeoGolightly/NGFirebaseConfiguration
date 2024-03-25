//
//  FBEmulatorOptions.swift
//  
//
//  Created by Neo Golightly on 20.03.24.
//

import Foundation

/// Firebase emulator options
///
/// Configures your Firebase emulator with your server address and ports for the different Firebase services.
/// See [Firebase emulator documentation](https://firebase.google.com/docs/emulator-suite/install_and_configure) for more informations.
/// # Example
/// If the port 8080 is already in use you can define another port for Firestore when initialize your emulator with the FirebaseCLI or later in the firebase.json file in your Firebase project folder. Then you can set this port in your app.
/// ```swift
/// FBEmulatorOptions(server: "192.123.1.2", firestorePort: 9090)
/// ```
public struct FBEmulatorOptions {
  /// Your emulator server address
  ///
  /// Define your own server address like 192.123.1.2
  let server: String
  /// Firestore emulator port number
  let firestorePort: Int?
  /// Auth emulator port number
  let authPort: Int?
  /// Functions emulator port number
  let functionsPort: Int?
  /// Storage emulator port number
  let storagePort: Int?
  
  /// Creates a new FBEmulatorOptions object
  /// - Parameters:
  ///   - server: Your emulator server address. Default is "localhost"
  ///   - firestorePort: Firestore emulator port number
  ///   - authPort: Auth emulator port number
  ///   - functionsPort: Functions emulator port number
  ///   - storagePort: Storage emulator port number
  public init(server: String = "localhost",
              firestorePort: Int? = nil,
              authPort: Int? = nil,
              functionsPort: Int? = nil,
              storagePort: Int? = nil) {
    self.server = server
    self.firestorePort = firestorePort
    self.authPort = authPort
    self.functionsPort = functionsPort
    self.storagePort = storagePort
  }
  
  /// Default options with standard emulator configuration for ports
  /// - Parameter server: Set your own server address like 192.123.1.2
  /// - Returns: A default ``FBEmulatorOptions`` object
  public static func defaultOptions(server: String = "localhost") -> FBEmulatorOptions {
    .init(server: server,
          firestorePort: 8080,
          authPort: 9099,
          functionsPort: 5001,
          storagePort: 9199)
  }
}
