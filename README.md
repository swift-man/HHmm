# HHmm
![Badge](https://img.shields.io/badge/swift-white.svg?style=flat-square&logo=Swift)
![Badge - Version](https://img.shields.io/badge/Version-1.0.0-1177AA?style=flat-square)
![Badge - Swift Package Manager](https://img.shields.io/badge/SPM-compatible-orange?style=flat-square)
![Badge - Platform](https://img.shields.io/badge/platform-mac|ios|watchos|tvos-yellow?style=flat-square)
![Badge - License](https://img.shields.io/badge/license-MIT-black?style=flat-square)
```swift
let dateComponents = DateComponents(year: 2022, month: 10, day: 15, hour: 20, minute: 20)
guard let date = Calendar.current.date(from: dateComponents) else { return }

let hhmm = HHmm(date: date)
print(hhmm.hour) // 20
print(hhmm.minute) // 20
print(hhmm.value) // "20:20"
```

```swift
let hhmm = HHmm(text: "08:15")
print(hhmm.hour) // 8
print(hhmm.minute) // 15
print(hhmm.value) // "08:15"
```

```swift
let hhmm = HHmm(hour: 06, minute: 45)
print(hhmm.hour) // 6
print(hhmm.minute) // 45
print(hhmm.value) // "06:45"
print(hhmm.systemStyleString) // "오후 8:20"
```

