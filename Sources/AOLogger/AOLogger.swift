import Foundation
import UIKit

func print(_ object: Any) {
    // Only allowing in DEBUG mode
    #if DEBUG
    Swift.print(object)
    #endif
}

enum LogEvent: String {
    case w = "[⚠️]"
    case e = "[‼️]"
    case i = "[ℹ️]"
    case d = "[💬]"
}

public class Log {
    
    fileprivate static var dateFormat = "dd/MM/yyyy HH:mm:ss:SSS"
    fileprivate static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.calendar = .current
        formatter.locale = .current
        formatter.timeZone = .current
        return formatter
    }
    
    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
    
    public class func e( _ object: Any,
                  filename: String = #file,
                  line: Int = #line,
                  column: Int = #column,
                  funcName: String = #function) {
        
        print("\(Date().toString()) \(LogEvent.e.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(object)")
    }
    
    public class func d( tag: Any = "",
                  _ object: Any,
                  filename: String = #file,
                  line: Int = #line,
                  column: Int = #column,
                  funcName: String = #function) {
        print("\(Date().toString()) \(LogEvent.d.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(funcName) [\(tag)] -> \(object)")
    }
    
    public class func i( tag: Any = "",
                  _ object: Any,
                  filename: String = #file,
                  line: Int = #line,
                  column: Int = #column,
                  funcName: String = #function) {
        print("\(Date().toString()) \(LogEvent.i.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(funcName) [\(tag)] -> \(object)")
    }
    
    public class func w( _ object: Any,
                  filename: String = #file,
                  line: Int = #line,
                  column: Int = #column,
                  funcName: String = #function) {
        print("\(Date().toString()) \(LogEvent.w.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(object)")
    }
}

extension Date {
   func toString() -> String {
      return Log.dateFormatter.string(from: self as Date)
   }
}

