//
//  oObject.swift
//  OrcLib
//
//  Created by roy on 11/2/17.
//  Copyright © 2017 YungShin. All rights reserved.
//

import Foundation

class oObject<FieldT>
{
    /// Field Desc
    //--------------------------------------------------------------------------
    struct FieldDesc
    {
        var field: FieldT
        var valueType: ValueType
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
