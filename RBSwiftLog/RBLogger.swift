//
//  RBLogger.swift
//  RBTestNSLog
//
//  Created by AP1-01 on 2025/8/15.
//

import Foundation

public class RBLogger {
    static public let shared = RBLogger()
    
    private init() {
        print("Logger init")
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") //24H
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    }
    
    /// Log level current used.
    public var logLevel = LogLevel.defaultLevel
    
    /// Whether should show date & time field, ture for showing, false for hidding.
    fileprivate var showDateTime = true
    /// Whether should show log level field, ture for showing, false for hidding.
    fileprivate var showLogLevel = true
    /// Whether should show file name field, ture for showing, false for hidding.
    fileprivate var showFileName = true
    /// Whether should show line number field, ture for showing, false for hidding.
    fileprivate var showLineNumber = true
    /// Whether should show function name field, ture for showing, false for hidding.
    fileprivate var showFunctionName = true
    /// Whether should show Tag field, ture for showing, false for hidding.
    fileprivate var showTagInfo = true
    
    /// verbose log string.
    public var verboseSingal: String {
        set {
            LoggerSingal.verboseSingal = newValue
        }
        
        get {
            return LoggerSingal.verboseSingal
        }
    }
    
    /// debug log string.
    public var debugSingal: String{
        set {
            LoggerSingal.debugSingal = newValue
        }
        
        get {
            return LoggerSingal.debugSingal
        }
    }
    
    /// info log string.
    public var infoSignal: String {
        set {
            LoggerSingal.infoSignal = newValue
        }
        
        get {
            return LoggerSingal.infoSignal
        }
    }
    
    /// warning log string.
    public var warningSignal: String {
        set {
            LoggerSingal.warningSignal = newValue
        }
        
        get {
            return LoggerSingal.warningSignal
        }
    }
    
    /// error log string.
    public var errorSignal: String {
        set {
            LoggerSingal.errorSignal = newValue
        }
        
        get {
            return LoggerSingal.errorSignal
        }
    }
    
    /// fatal log string.
    public var fatalSignal: String {
        set {
            LoggerSingal.fatalSignal = newValue
        }
        
        get {
            return LoggerSingal.fatalSignal
        }
    }
    
    /// NSDateFromatter used internally.
    fileprivate let dateFormatter = DateFormatter()
    
    /// LogFunction used, print for DEBUG, NSLog for Production.
#if DEBUG
    private let LogFunction: (_ format: String) -> Void = {format in print(format)}
#else
    fileprivate let LogFunction: (_ format: String, _ args: CVarArg...) -> Void = NSLog
#endif
    
}

// MARK: - log function
extension RBLogger {
    
    /**
     Prinln an new line, without any fileds. This will ignore any filed settings.
     */
    public func emptyLine() {
        DispatchQueue.main.async(execute: { () -> Void in
            self.LogFunction("")
        })
    }
    
    /**
    Logs textual representation of `value` with .Verbose level.
    
    - parameter value:    A value conforms `Streamable`, `Printable`, `DebugPrintable`.
    - parameter function: Function name
    - parameter file:     File name
    - parameter line:     Line number
    - returns: The string logged out.
    */
    @discardableResult public func verbose<T>(tag: String, _ value: T, function: String = #function, file: String = #file, line: Int = #line) -> String? {
        return verbose("\(value)", tag: tag, function: function, file: file,  line: line)
    }
    
    /**
    Logs textual representation of `value` with .Debug level.
    - parameter value:    A value conforms `Streamable`, `Printable`, `DebugPrintable`.
    - parameter function: Function name
    - parameter file:     File name
    - parameter line:     Line number
    - returns: The string logged out.
    */
    @discardableResult public func debug<T>(tag: String, _ value: T, function: String = #function, file: String = #file, line: Int = #line) -> String? {
        return debug("\(value)", tag: tag, function: function, file: file,  line: line)
    }
    
    /**
    Logs textual representation of `value` with .Info level.
    
    - parameter value:    A value conforms `Streamable`, `Printable`, `DebugPrintable`.
    - parameter function: Function name
    - parameter file:     File name
    - parameter line:     Line number
    
    - returns: The string logged out.
    */
    @discardableResult public func info<T>(tag: String, _ value: T, function: String = #function, file: String = #file, line: Int = #line) -> String? {
        return info("\(value)", tag: tag, function: function, file: file,  line: line)
    }
    
    /**
    Logs textual representation of `value` with .Warning level.
    
    - parameter value:    A value conforms `Streamable`, `Printable`, `DebugPrintable`.
    - parameter function: Function name
    - parameter file:     File name
    - parameter line:     Line number
    
    - returns: The string logged out.
    */
    @discardableResult public func warning<T>(tag: String, _ value: T, function: String = #function, file: String = #file, line: Int = #line) -> String? {
        return warning("\(value)", tag:tag, function: function, file: file,  line: line)
    }
    
    /**
    Logs textual representation of `value` with .Error level.
    
    - parameter value:    A value conforms `Streamable`, `Printable`, `DebugPrintable`.
    - parameter function: Function name
    - parameter file:     File name
    - parameter line:     Line number
    
    - returns: The string logged out.
    */
    @discardableResult public func error<T>(tag: String, _ value: T, function: String = #function, file: String = #file, line: Int = #line) -> String? {
        return error("\(value)", tag:tag, function: function, file: file,  line: line)
    }
    
    /**
    Logs textual representation of `value` with .Fatal level.
    
    - parameter value:    A value conforms `Streamable`, `Printable`, `DebugPrintable`.
    - parameter function: Function name
    - parameter file:     File name
    - parameter line:     Line number
    
    - returns: The string logged out.
    */
    @discardableResult public func fatal<T>(tag: String, _ value: T, function: String = #function, file: String = #file, line: Int = #line) -> String? {
        return fatal("\(value)", tag: tag, function: function, file: file,  line: line)
    }

    /**
    Logs an message with formatted string and arguments list.
    
    - parameter level:    Log level
    - parameter format:   Formatted string
    - parameter function: Function name
    - parameter file:     File name
    - parameter line:     Line number
    - parameter args:     Arguments list
    
    - returns: The string logged out.
    */
    @discardableResult public func logWithLevel(tag: String, _ level: LogLevel, _ format: String = "", function: String = #function, file: String = #file, line: Int = #line, args: CVarArg...) -> String?
    {
        if level >= logLevel {
            return log(level, tag: tag, function: function, file: file, line: line, format: format, args: args)
        }
        return nil
    }
    
}

// MARK: - private log function
extension RBLogger
{
    /**
    Construct a log message, log it out and return it.
    
    - parameter level:    Log level
    - parameter function: Function name
    - parameter file:     File name
    - parameter line:     Line number
    - parameter format:   Formatted string
    - parameter args:     Arguments list
    
    - returns: The string logged out.
    */
    @discardableResult fileprivate func log(_ level: LogLevel, tag: String, function: String = #function, file: String = #file, line: Int = #line, format: String, args: [CVarArg]) -> String
    {
        //1. dateTime
        let dateTime = showDateTime ? "\(dateFormatter.string(from: Date())) " : ""
        //2. tagInfo
        let tagString = showTagInfo && !tag.isEmpty ? "[\(tag)] " : ""
        //3. log level
        let levelSignal = translateToLogString(level: level)
        let levelString = showLogLevel ? "[\(levelSignal)\(LogLevel.descritionForLogLevel(level))\(levelSignal)] " : ""
        
        //4. file name
        var fileLine = ""
        if showFileName {
            fileLine += "[" + (file as NSString).lastPathComponent
            fileLine += "] "
        }
        
        //5. functionname
        let functionString = showFunctionName ? function : ""
        
        //6. line info
        let lineString = showLineNumber ? ":Line:\(line) " : ""
        
        //7. message
        let message: String
        if args.count == 0 {
            message = format
        } else {
            message = String(format: format, arguments: args)
        }
        
        let infoString = "\(dateTime)\(tagString)\(levelString)\(fileLine)\(functionString)\(lineString)".trimmingCharacters(in: CharacterSet(charactersIn: " "))
        
        let logString = infoString + (infoString.isEmpty ? "" : " Message:") + "\(message)"
        self.LogFunction(logString)
        
        return logString
    }
    
    /**
    Logs an message with formatted string and arguments list with .Verbose level.
    - parameter format:   Formatted string
    - parameter function: Function name
    - parameter file:     File name
    - parameter line:     Line number
    - parameter args:     Arguments list
    
    - returns: The string logged out.
    */
    @discardableResult fileprivate func verbose(_ format: String = "", tag: String, function: String = #function, file: String = #file, line: Int = #line, args: CVarArg...) -> String? {
        if .verbose >= logLevel {
            return log(.verbose, tag: tag, function: function, file: file, line: line, format: format, args: args)
        }
        return nil
    }
    
    
    /**
    Logs an message with formatted string and arguments list with .Debug level.
    
    - parameter format:   Formatted string
    - parameter function: Function name
    - parameter file:     File name
    - parameter line:     Line number
    - parameter args:     Arguments list
    
    - returns: The string logged out.
    */
    @discardableResult fileprivate func debug(_ format: String = "", tag: String, function: String = #function, file: String = #file, line: Int = #line, args: CVarArg...) -> String?
    {
        if .debug >= logLevel {
            return log(.debug, tag: tag, function: function, file: file, line: line, format: format, args: args)
        }
        return nil
    }
    
    /**
    Logs an message with formatted string and arguments list with .Info level.
    
    - parameter format:   Formatted string
    - parameter function: Function name
    - parameter file:     File name
    - parameter line:     Line number
    - parameter args:     Arguments list
    
    - returns: The string logged out.
    */
    @discardableResult fileprivate func info(_ format: String = "", tag: String, function: String = #function, file: String = #file, line: Int = #line, args: CVarArg...) -> String?
    {
        if .info >= logLevel {
            return log(.info, tag: tag, function: function, file: file, line: line, format: format, args: args)
        }
        return nil
    }
    
    /**
    Logs an message with formatted string and arguments list with .Warning level.
    
    - parameter format:   Formatted string
    - parameter function: Function name
    - parameter file:     File name
    - parameter line:     Line number
    - parameter args:     Arguments list
    
    - returns: The string logged out.
    */
    @discardableResult fileprivate func warning(_ format: String = "", tag: String, function: String = #function, file: String = #file, line: Int = #line, args: CVarArg...) -> String?
    {
        if .warning >= logLevel {
            return log(.warning, tag: tag, function: function, file: file, line: line, format: format, args: args)
        }
        return nil
    }
    
    /**
    Logs an message with formatted string and arguments list with .Error level.
    
    - parameter format:   Formatted string
    - parameter function: Function name
    - parameter file:     File name
    - parameter line:     Line number
    - parameter args:     Arguments list
    
    - returns: The string logged out.
    */
    @discardableResult fileprivate func error(_ format: String = "", tag: String, function: String = #function, file: String = #file, line: Int = #line, args: CVarArg...) -> String?
    {
        if .error >= logLevel {
            return log(.error, tag: tag, function: function, file: file, line: line, format: format, args: args)
        }
        return nil
    }
    
    /**
    Logs an message with formatted string and arguments list with .fatal  level.
    
    - parameter format:   Formatted string
    - parameter function: Function name
    - parameter file:     File name
    - parameter line:     Line number
    - parameter args:     Arguments list
    
    - returns: The string logged out.
    */
    @discardableResult fileprivate func fatal(_ format: String = "", tag: String, function: String = #function, file: String = #file, line: Int = #line, args: CVarArg...) -> String?
    {
        if .fatal >= logLevel {
            return log(.fatal, tag: tag, function: function, file: file, line: line, format: format, args: args)
        }
        return nil
    }
}

// MARK: - control Log Info
extension RBLogger {
    /// Whether should show date & time field, ture for showing, false for hidding.
    @discardableResult
    public func setShowDate(_ prop: Bool) -> RBLogger {
        showDateTime = prop
        return self
    }
    
    /// Whether should show log level field, ture for showing, false for hidding.
    @discardableResult
    public func setShowLogLevel(_ prop: Bool) -> RBLogger {
        showLogLevel = prop
        return self
    }
    /// Whether should show file name field, ture for showing, false for hidding.
    @discardableResult
    public func setShowFileName(_ prop: Bool) -> RBLogger {
        showFileName = prop
        return self
    }
    /// Whether should show line number field, ture for showing, false for hidding.
    @discardableResult
    public func setShowLineNumber(_ prop: Bool) -> RBLogger {
        showLineNumber = prop
        return self
    }
    /// Whether should show function name field, ture for showing, false for hidding.
    @discardableResult
    public func setShowFunctionName(_ prop: Bool) -> RBLogger {
        showFunctionName = prop
        return self
    }
    /// Whether should show Tag field, ture for showing, false for hidding.
    @discardableResult
    public func setShowTagInfo(_ prop: Bool) -> RBLogger {
        showTagInfo = prop
        return self
    }
}

