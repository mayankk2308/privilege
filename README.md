# Privilege

Easily request superuser privilege in macOS applications with a user-interactive and native password prompt.

## Installation
**Privilege** only supports **Swift Package Manager**. Add it as a dependency in your project's `Package.swift` dependencies section as follows:
```swift
.package(name: "Privilege", url: "https://github.com/mayankk2308/privilege.git", from: "1.0.0")
```
Then add the package `"Privilege"` to your targets that require it.

## Usage
First import the module:
```swift
import Privilege
```

To **gain superuser** permissions:
```swift
Privilege.escalate()
// Returns true if rights are extended successfully.
```

To **de-escalate**:
```swift
Privilege.deEscalate()
// Returns true if rights are dropped successfully.
```