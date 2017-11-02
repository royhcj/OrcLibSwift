//
//  oUtil.swift
//  oObject
//
//  Created by roy on 10/21/17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation

public func printOverrideWarning(_ functionName: String = "")
{
    print("Warning! Override this method: " + functionName)
}

public func printIncompleteFieldError()
{
    print("Error! Incomplete field.")
}

//------------------------------------------------------------------
public enum ValueType: Int
{
    case bool
    case int
    case double
    case string
    case date
    case standardDateString
    case unixTime
    case custom
}

//------------------------------------------------------------------
open class oUtil
{
    /// MARK: - Date Tools
    //------------------------------------------------------------------
    open static var standardDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.xxxz"
        return formatter
    }()
    
    //------------------------------------------------------------------
    open static func date(fromStandard dateString: String) -> Date?
    {
        return oUtil.standardDateFormatter.date(from: dateString)
    }
    
    //------------------------------------------------------------------
    open static func standardDateString(from date: Date) -> String?
    {
        return oUtil.standardDateFormatter.string(from: date)
    }
    
    /// MARK: - Value Conversion
    //------------------------------------------------------------------
    open class func convert(_ value: Any?, from: ValueType, to: ValueType) -> Any?
    {
        guard let value = value else { return nil }
        
        switch (from, to)
        {
            // from .bool
            case (.bool, .bool):
                return value
            case (.bool, .int):
                return (value as! Bool) ? 1: 0
            case (.bool, .double):
                return nil
            case (.bool, .string):
                return (value as! Bool) ? "true": "false"
            case (.bool, .date):
                return nil
            case (.bool, .standardDateString):
                return nil
            case (.bool, .unixTime):
                return nil
            case (.bool, .custom):
                return nil
            // from .int
            case (.int, .bool):
                return (value as! Int) != 0
            case (.int, .int):
                return value
            case (.int, .double):
                return Double(value as! Int)
            case (.int, .string):
                return String(value as! Int)
            case (.int, .date):
                return nil
            case (.int, .standardDateString):
                return nil
            case (.int, .unixTime):
                return Double(value as! Int)
            case (.int, .custom):
                return nil
            // from .double
            case (.double, .bool):
                return nil
            case (.double, .int):
                return Int(value as! Double)
            case (.double, .double):
                return value
            case (.double, .string):
                return String(value as! Double)
            case (.double, .date):
                return nil
            case (.double, .standardDateString):
                return nil
            case (.double, .unixTime):
                return value
            case (.double, .custom):
                return nil
            // from .string
            case (.string, .bool):
                return (value as! String) == "true"
            case (.string, .int):
                return Int(value as! String)
            case (.string, .double):
                return Double(value as! String)
            case (.string, .string):
                return value
            case (.string, .date):
                return nil // maybe auto guess?
            case (.string, .standardDateString):
                return date(fromStandard: value as! String)
            case (.string, .unixTime):
                return Double(value as! String)
            case (.string, .custom):
                return nil
            // from .date
            case (.date, .bool):
                return nil
            case (.date, .int):
                return nil
            case (.date, .double):
                return nil
            case (.date, .string):
                return nil // think about it?
            case (.date, .date):
                return value
            case (.date, .standardDateString):
                return oUtil.standardDateString(from: value as! Date)
            case (.date, .unixTime):
                return (value as! Date).timeIntervalSince1970
            case (.date, .custom):
                return nil
            // from .standardDateString
            case (.standardDateString, .bool):
                return nil
            case (.standardDateString, .int):
                return nil
            case (.standardDateString, .double):
                return nil
            case (.standardDateString, .string):
                return value
            case (.standardDateString, .date):
                return oUtil.date(fromStandard: value as! String)
            case (.standardDateString, .standardDateString):
                return value
            case (.standardDateString, .unixTime):
                return oUtil.date(fromStandard: value as! String)?.timeIntervalSince1970
            case (.standardDateString, .custom):
                return nil
            // from .unixTime
            case (.unixTime, .bool):
                return nil
            case (.unixTime, .int):
                return nil
            case (.unixTime, .double):
                return value
            case (.unixTime, .string):
                return String(value as! TimeInterval)
            case (.unixTime, .date):
                return Date(timeIntervalSince1970: value as! TimeInterval)
            case (.unixTime, .standardDateString):
                return oUtil.standardDateString(from: Date(timeIntervalSince1970: value as! TimeInterval))
            case (.unixTime, .unixTime):
                return value
            case (.unixTime, .custom):
                return nil
            // from .custom
            case (.custom, _):
                return nil
        }
        
    }
    
    //------------------------------------------------------------------
    
    //------------------------------------------------------------------
    
    //------------------------------------------------------------------
}
