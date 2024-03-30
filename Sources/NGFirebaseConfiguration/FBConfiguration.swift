//
//  File.swift
//  
//
//  Created by Neo Golightly on 20.03.24.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseFunctions
import FirebaseDatabase
import OSLog

/// Firebase configuration
///
/// An easy way to start your Firebase project without a AppDelegate.
public struct FBConfiguration {
  private static let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "FBConfiguration")
  /// Creates a new FBConfiguration with FBOptions and emulator option.
  /// - Parameters:
  ///   - options: Firebase project options
  ///   - useEmulator: Set to **`true`** if you like to use the Firebase emulator. Default **`false`**
  ///   - emulatorOptions: Configure your emulator options here
  public static func configure(options: FBOptions, useEmulator: Bool = false, emulatorOptions: FBEmulatorOptions = .defaultOptions()) {
    // Test if app already exists
    if FirebaseApp.app() == nil {
      // Configure Firebase with options instead of using the google file
      FirebaseApp.configure(options: .init(options: options))
      // Emulator configuration
      if useEmulator {
        logger.info("use firebase emulator")
        // Auth emulator configuration
        if let authPort = emulatorOptions.authPort {
          logger.info("use firebase auth with emulator")
          Auth.auth().useEmulator(withHost: emulatorOptions.server, port: authPort)
        }
        // Firestore emulator configuration
        if let firestorePort = emulatorOptions.firestorePort {
          logger.info("use firebase firestore with emulator")
          Firestore.firestore().useEmulator(withHost: emulatorOptions.server, port: firestorePort)
          let settings = Firestore.firestore().settings
          settings.cacheSettings = MemoryCacheSettings()
          settings.isSSLEnabled = false
          Firestore.firestore().settings = settings
        }
        // Storage emulator configuration
        if let storagePort = emulatorOptions.storagePort {
          logger.info("use firebase storage with emulator")
          Storage.storage().useEmulator(withHost: emulatorOptions.server, port: storagePort)
        }
        if let functionsPort = emulatorOptions.functionsPort {
          logger.info("use firebase functions with emulator")
          Functions.functions().useEmulator(withHost: emulatorOptions.server, port: functionsPort)
        }
      }
    }
  }
}
