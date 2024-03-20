//
//  FBConfigurationView.swift
//
//
//  Created by Neo Golightly on 20.03.24.
//

import SwiftUI
import Observation

/// A view wrapper for Firebase configurations
///
/// Use this view to wrap it around your base content view or in #preview for testing
public struct FBConfigurationView<Content, Store: AnyObject>: View  where Content: View, Store: Observable {
  @Bindable var store: Store
  private let content: () -> Content
  /// Creates a new FBConfigurationView
  /// - Parameters:
  ///   - store: Your data container
  ///   - options: Set the Firebase options
  ///   - useEmulator: Select if you want to use the emulator
  ///   - server: Sets the server for your Firebase project
  ///   - content: The view content
  public init(store: Bindable<Store>,
              options: FBOptions,
              useEmulator: Bool = false,
              emulatorOptions: FBEmulatorOptions? = nil, @ViewBuilder content: @escaping () -> Content) {
    FBConfiguration.configure(options: options, useEmulator: useEmulator, emulatorOptions: emulatorOptions)
    self._store = store
    self.content = content
  }
  
  public var body: some View {
    content()
      .environment(store)
  }
}