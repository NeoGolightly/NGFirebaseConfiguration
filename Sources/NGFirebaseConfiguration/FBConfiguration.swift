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

/// Firebase configuration
///
/// An easy way to start your Firebase project without a AppDelegate.
public struct FBConfiguration {
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
        // Auth emulator configuration
        if let authPort = emulatorOptions.authPort {
          Auth.auth().useEmulator(withHost: emulatorOptions.server, port: authPort)
        }
        // Firestore emulator configuration
        if let firestorePort = emulatorOptions.authPort {
          Firestore.firestore().useEmulator(withHost: emulatorOptions.server, port: firestorePort)
          let settings = Firestore.firestore().settings
          settings.cacheSettings = MemoryCacheSettings()
          settings.isSSLEnabled = false
          Firestore.firestore().settings = settings
        }
        // Storage emulator configuration
        if let storagePort = emulatorOptions.storagePort {
          Storage.storage().useEmulator(withHost: emulatorOptions.server, port: storagePort)
        }
        if let functionsPort = emulatorOptions.functionsPort {
          Functions.functions().useEmulator(withHost: emulatorOptions.server, port: functionsPort)
        }
      }
    }
  }
}
