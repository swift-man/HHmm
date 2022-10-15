import Foundation

public struct HHmm: Equatable {
  public static func empty() -> HHmm {
    return HHmm(text: "")
  }
  
  public static func currentTime() -> HHmm {
    return HHmm(date: Date())
  }
  
  public var value: String {
    didSet {
      let formatter = HHmmFormatter()
      if formatter.date(from: value) == nil {
        self = HHmm.empty()
      }
    }
  }
  
  public var hour: Int? {
    get {
      let date = HHmmFormatter().date(from: value)
      return date?.hour
    }
    set {
      guard let newValue else {
        value = ""
        return
      }
      var date = Date()
      date.hour = newValue
      date.minute = minute ?? 0
      
      let formatter = HHmmFormatter()
      let string = formatter.string(from: date)
      
      value = string
    }
  }
  
  public var minute: Int? {
    get {
      let date = HHmmFormatter().date(from: value)
      return date?.minute
    }
    set {
      guard let newValue else {
        value = ""
        return
      }
      var date = Date()
      date.hour = hour ?? 0
      date.minute = newValue
      
      let formatter = HHmmFormatter()
      let string = formatter.string(from: date)
      
      value = string
    }
  }
  
  public var date: Date? {
    return HHmmFormatter().date(from: value)
  }
  
  public var isEmpty: Bool {
    return value.isEmpty
  }
  
  public init(text: String) {
    guard !text.isEmpty else {
      self.value = ""
      return
    }
    let formatter = HHmmFormatter()
    guard let date = formatter.date(from: text) else {
      self.value = ""
      return
    }
    
    self.value = formatter.string(from: date)
  }
  
  public init(hour: Int, minute: Int) {
    var date = Date()
    date.hour = hour
    date.minute = minute
    
    let formatter = HHmmFormatter()
    let string = formatter.string(from: date)
    
    value = string
  }
  
  public init(date: Date) {
    self.value = HHmmFormatter().string(from: date)
    self.hour = date.hour
    self.minute = date.minute
  }
  
  public var systemStyleString: String? {
    return HHmmFormatter().systemStyleString(from: value)
  }
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
