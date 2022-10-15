//
//  HHmmFormatter.swift
//  HHmm
//
//  Created by SwiftMan on 2022/10/16.
//

import Foundation

open class HHmmFormatter: DateFormatter {
  open override func date(from string: String) -> Date? {
    guard !string.isEmpty else { return nil }
    
    if string.count == 1 {
      dateFormat = "h"
    } else if string.count == 2 {
      dateFormat = "hm"
    } else if string.count == 3 {
      dateFormat = "hmm"
    } else if string.count == 4 {
      dateFormat = "HHmm"
    } else if string.count == 5 {
      dateFormat = "HH:mm"
    } else {
      dateFormat = systemFormat
    }
    
    
    return super.date(from: string)
  }
  
  open override func string(from date: Date) -> String {
    dateFormat = "HH:mm"
    return super.string(from: date)
  }
  
  public var systemFormat: String? {
    guard let format = DateFormatter.dateFormat(fromTemplate: "j",
                                                options: 0,
                                                locale: .current)
    else {
      return "HH:mm"
    }
    
    if format.hasPrefix("a") {
      return "a h:mm"
    }
    
    return "HH:mm"
  }
  
  func systemStyleString(from string: String) -> String? {
    guard
      let systemFormat,
      let date = date(from: string)
    else { return nil }
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = systemFormat
    return dateFormatter.string(from: date)
  }
}
