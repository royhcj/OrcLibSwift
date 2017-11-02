//
//  oObject.swift
//  OrcLib
//
//  Created by roy on 11/2/17.
//  Copyright © 2017 YungShin. All rights reserved.
//

import Foundation

open class oObject<FieldT>
{
    /// Field Desc
    //--------------------------------------------------------------------------
    public struct FieldDesc
    {
        var field: FieldT
        var valueType: ValueType
        
        public init(field: FieldT, valueType: ValueType) {
            self.field = field
            self.valueType = valueType
        }
    }
    
    /// MARK: - Static
    //--------------------------------------------------------------------------
    class func fieldDesc(for field: FieldT) -> FieldDesc {
        printOverrideWarning()
        exit(0)
    }

    /// MARK: - Initializers
    //--------------------------------------------------------------------------
    init() {
        
    }
    
    /// MARK: - Values
    //--------------------------------------------------------------------------
    func value(for field: FieldT) -> Any? {
        printOverrideWarning()
        return false
    }
    
    //--------------------------------------------------------------------------
    func assign(_ field: FieldT, value: Any?) {
        printOverrideWarning()
    }
    
    //--------------------------------------------------------------------------
    func assign(_ field: FieldT, value: (Any?, ValueType)) {
        var convertedValue: Any? = value.0
        
        let desc = type(of: self).fieldDesc(for: field)
        if desc.valueType != value.1 {
            convertedValue = oUtil.convert(convertedValue,
                                           from: value.1, to: desc.valueType)
        }
        assign(field, value: convertedValue)
    }
    
    //--------------------------------------------------------------------------
    func assign(_ field: FieldT, object: oObject) {
        printOverrideWarning()
    }
    
    //--------------------------------------------------------------------------
    func assign(_ fields: [FieldT], object: oObject) {
        for field in fields {
            assign(field, object: object)
        }
    }
}
