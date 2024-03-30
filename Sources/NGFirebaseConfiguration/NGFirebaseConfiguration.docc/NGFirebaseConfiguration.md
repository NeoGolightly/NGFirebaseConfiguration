# ``NGFirebaseConfiguration``

@Metadata {
  @Available(visionOS, introduced: "1.0")
  @Available(macCatalyst, introduced: "17.0")
  @Available(tvOS, introduced: "17.0")
  @Available(macOS, introduced: "14.0")
  @Available(iOS, introduced: "17.0")
}

## Overview

### Set your Firebase options
```swift
extension FBOptions {
  static var dev: Self {
    FBOptions(googleAppID: "your-google-app-id",
              gcmSenderID: "your-gcm-sender-id",
              apiKey: "your-api-key",
              projectID: "your-project-id",
              bundleID: "your-bundle-identifier",
              storageBucket: "your-storage-bucket")
  }
}

```
### Set up your Store Container
```swift
@Observable
class Store: FBStore {
  let auth = AuthStore()
  var someProperty: String = "observed string"
  required init() {}
}
```

### Configure your Main App View
```swift
@main
struct YourApp: App {  
  var body: some Scene {
    WindowGroup {
      FBConfigurationView(store: Store.self, options: .dev) {
        ContentView()
      }
    }
  }
}
```
### Use with your Previews

```swift
#Preview {
  FBConfigurationView(store: Store.self, options: .dev, useEmulator: true) {
    ContentView()
  }
}
```

### Use other emulator server or ports for emulator

```swift
extension FBEmulatorOptions {
  static var emuOptions: FBEmulatorOptions {
    // If you don't set the port, the feature (firestore, auth, storage or functions) 
    // will be disabled for the emulator
    FBEmulatorOptions(server: IPAdresses.home, firestorePort: 9090, authPort: 9099)
  }
}

#Preview {
  FBConfigurationView(store: Store.self, options: .dev, useEmulator: true, emulatorOptions: .emuOptions) {
    ContentView()
  }
}
```

## Topics

### Articles
- <doc:Views>
- <doc:Configurations>
- <doc:Options>
