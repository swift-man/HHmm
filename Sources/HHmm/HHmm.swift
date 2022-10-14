import Foundation

public struct HHmm: Equatable {
  public static func empty() -> HHmm {
    return HHmm(text: "")
  }
  
  public static func currentTime() -> HHmm {
    return HHmm(date: Date())
  }
  
  public let value: String
  public var hour: Int?
  public var minute: Int?
  
  public var date: Date? {
    return dateFormatter.date(from: value)
  }
  
  public var isEmpty: Bool {
    return value.isEmpty
  }
  
  public init(text: String) {
    self.value = text
    let date = dateFormatter.date(from: text)
    self.hour = date?.hour
    self.minute = date?.minute
  }
  
  public init(hour: Int, minute: Int) {
    var date = Date()
    date.hour = hour
    date.minute = minute
    self.value = dateFormatter.string(from: date)
  }
  
  public init(date: Date) {
    self.value = dateFormatter.string(from: date)
    self.hour = date.hour
    self.minute = date.minute
  }
  
  public var systemStyleString: String? {
    guard
      let systemFormat = DateFormatter.dateFormat(fromTemplate: "j",
                                                  options: 0,
                                                  locale: .current),
      let date = dateFormatter.date(from: value)
    else { return nil }
    
    let dateFormatter = DateFormatter()
    if systemFormat.hasPrefix("a") {
      dateFormatter.dateFormat = "a h:mm"
    } else {
      dateFormatter.dateFormat = "HH:mm"
    }
    
    return dateFormatter.string(from: date)
  }
  
  private var dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    return dateFormatter
  }()
}

extension Optional where Wrapped == HHmm {
  public var isNilOrEmpty: Bool {
    return self?.isEmpty ?? true
  }
}

extension Date {
  fileprivate var hour: Int {
    get {
      return Calendar.current.component(.hour, from: self)
    }
    set {
      let allowedRange = Calendar.current.range(of: .hour, in: .day, for: self)!
      guard allowedRange.contains(newValue) else { return }
      
      let currentHour = Calendar.current.component(.hour, from: self)
      let hoursToAdd = newValue - currentHour
      if let date = Calendar.current.date(byAdding: .hour, value: hoursToAdd, to: self) {
        self = date
      }
    }
  }
  
  fileprivate var minute: Int {
    get {
      return Calendar.current.component(.minute, from: self)
    }
    set {
      let allowedRange = Calendar.current.range(of: .minute, in: .hour, for: self)!
      guard allowedRange.contains(newValue) else { return }
      
      let currentMinutes = Calendar.current.component(.minute, from: self)
      let minutesToAdd = newValue - currentMinutes
      if let date = Calendar.current.date(byAdding: .minute, value: minutesToAdd, to: self) {
        self = date
      }
    }
  }
}
