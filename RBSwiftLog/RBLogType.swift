//
//  RBLogType.swift
//  RBTestNSLog
//
//  Created by AP1-01 on 2025/8/15.
//

public enum LogLevel: Int {
    case all        = 0
    case verbose    = 1
    case debug      = 2
    case info       = 3
    case warning    = 4
    case error      = 5
    case fatal      = 6
    case off        = 7
    
    /**
    Get string description for log level.
    - parameter logLevel: A LogLevel
    - returns: A string.
    */
    static public func descritionForLogLevel(_ logLevel: LogLevel) -> String {
        switch logLevel {
        case .verbose: return "VERBOSE"
        case .debug:   return "DEBUG"
        case .info:    return "INFO"
        case .warning: return "WARNING"
        case .error:   return "ERROR"
        case .fatal:   return "FATAL"
        default: assertionFailure("Invalid level")
        return "Null"
        }
    }
    
    /// Defualt log level
    /// Be sure to set the "DEBUG" symbol.
    /// Set it in the "Swift Compiler - Custom Flags" section, "Other Swift Flags" line. Add "-D DEBUG" entry.
#if DEBUG
    static public let defaultLevel = LogLevel.all
#else
    static public let defaultLevel = LogLevel.warning
#endif
}

// MARK: - Comparable
extension LogLevel: Comparable {}

public func <(lhs: LogLevel, rhs: LogLevel) -> Bool {
    return lhs.rawValue < rhs.rawValue
}

public func <=(lhs: LogLevel, rhs: LogLevel) -> Bool {
    return lhs.rawValue <= rhs.rawValue
}

public func >=(lhs: LogLevel, rhs: LogLevel) -> Bool {
    return lhs.rawValue >= rhs.rawValue
}

/**
*  Color logging support for Loggerithm logger.
*/
struct LoggerSingal {
    
    /// Singal for verbose log strings.
    static var verboseSingal: String {
        get {
            return verboseSignalTuple
        }
        set {
            verboseSignalTuple = newValue
        }
    }
    
    /// Singal for debug log strings.
    static var debugSingal: String {
        get {
            return debugSignalTuple
        }
        set {
            debugSignalTuple = newValue
        }
    }
    
    /// Singal for info log strings.
    static var infoSignal: String {
        get {
            return infoSignalTuple
        }
        set {
            infoSignalTuple = newValue
        }
    }
    /// Singal for warning log strings.
    static var warningSignal: String {
        get {
            return warningSignalTuple
        }
        set {
            warningSignalTuple = newValue
        }
    }
    
    /// Singal for error log strings.
    static var errorSignal: String {
        get {
            return errorSignalTuple
        }
        set {
            errorSignalTuple = newValue
        }
    }
    
    /// Singal for fatal log strings.
    static var fatalSignal: String {
        get {
            return fatalSignalTuple
        }
        set {
            fatalSignalTuple =  newValue
        }
    }
    
    /// current log  level Signal
    static fileprivate var verboseSignalTuple = defaultVerboseSignalTuple
    static fileprivate var debugSignalTuple = defaultDebugSignalTuple
    static fileprivate var infoSignalTuple = defaultInfoSignalTuple
    static fileprivate var warningSignalTuple = defaultWarningSignalTuple
    static fileprivate var errorSignalTuple = defaultErrorSignalTuple
    static fileprivate var fatalSignalTuple = defaultFatalSignalTuple
    
    
    /// default  log level Signal
    static fileprivate let defaultVerboseSignalTuple = "🩵"
    static fileprivate let defaultDebugSignalTuple = "💙"
    static fileprivate let defaultInfoSignalTuple = "💚"
    static fileprivate let defaultWarningSignalTuple = "💛"
    static fileprivate let defaultErrorSignalTuple = "🧡"
    static fileprivate let defaultFatalSignalTuple = "❤️"
}

public func translateToLogString(level: LogLevel) -> String
{
    switch level {
    case .verbose: return LoggerSingal.verboseSingal
    case .debug:   return LoggerSingal.debugSingal
    case .info:    return LoggerSingal.infoSignal
    case .warning: return LoggerSingal.warningSignal
    case .error:   return LoggerSingal.errorSignal
    case .fatal:   return LoggerSingal.fatalSignal
    default: assertionFailure("Invalid level")
    return ""
    }
}


