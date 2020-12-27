# LNP React Native demo application

This React Native project has the purpose to show the capabilities of
the [LNP Node & SDK](https://github.com/LNP-BP/lnp-node) and to provide
a concrete example of integration of the library in a mobile application.

For detailed and platform-dependent setup instructions see the
[official React Native documentation](https://reactnative.dev/docs/environment-setup).

### Common requirements

- [Node](https://nodejs.org) 8.3 or newer

### Common build

From the project root, run:
```bash
$ npm install
```
This will install the React Native command line interface and other necessary
Node dependencies.

Start [Metro](https://github.com/facebook/metro), a JavaScript bundler for React Native, by running:
```bash
$ npx react-native start --port 8081
```

## Android

### Requirements

- Java SE Development Kit (JDK) 8
- Android development environment (Android Studio, SDK, AVD)

### Build and run

Build the lnp-node android bindings by following
[these instructions](/bindings/android) and then, from the project root, run:

```bash
$ mkdir -p demo/react-native/android/app/libs
$ cp bindings/android/library/build/outputs/aar/library-debug.aar demo/react-native/android/app/libs/library-debug.aar
```

Open the android project from Android Studio
(`File -> Open... -> <path_to_this_project>/demo/react-native/android`),
build it (`Build -> Make project`) and
run the app (`Run -> Run 'app'` or `npx react-native run-android`).

## iOS

### Requirements

- Mac
- [Watchman](https://github.com/facebook/watchman)
- Xcode
