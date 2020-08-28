//
//  Sample.swift
//  wcdbTest
//
//  Created by LongMa on 2019/5/30.
//  Copyright © 2019 hautu. All rights reserved.
//

import WCDBSwift
import Foundation

@objcMembers
class Sample: NSObject, WCDBSwift.TableCodable {
    //Your own properties
    var newName: String?
    var age: Int? // Optional if it would be nil in some WCDB selection
    var weight: Double? // Optional if it would be nil in some WCDB selection
    var score: Int? = nil
    
    enum CodingKeys: String, CodingTableKey {
        typealias Root = Sample
        
        //List the properties which should be bound to table
        case newName = "custom_name"
        case age
        case weight
        case score
        
        static let objectRelationalMapping = TableBinding(CodingKeys.self)
        
        //Column constraints for primary key, unique, not null, default value and so on. It is optional.
        //static var columnConstraintBindings: [CodingKeys: ColumnConstraintBinding]? {
        //    return [
        //        .variable: ColumnConstraintBinding(isPrimary: true, isAutoIncrement: true),
        //        .variable2: ColumnConstraintBinding(isUnique: true)
        //    ]
        //}
        
        //Index bindings. It is optional.
        //static var indexBindings: [IndexBinding.Subfix: IndexBinding]? {
        //    return [
        //        "_index": IndexBinding(indexesBy: CodingKeys.variable2)
        //    ]
        //}
        
        //Table constraints for multi-primary, multi-unique and so on. It is optional.
        //static var tableConstraintBindings: [TableConstraintBinding.Name: TableConstraintBinding]? {
        //    return [
        //        "MultiPrimaryConstraint": MultiPrimaryBinding(indexesBy: variable2.asIndex(orderBy: .descending), variable3.primaryKeyPart2)
        //    ]
        //}
        
        //Virtual table binding for FTS and so on. It is optional.
        //static var virtualTableBinding: VirtualTableBinding? {
        //    return VirtualTableBinding(with: .fts3, and: ModuleArgument(with: .WCDB))
        //}
    }
    
    //Properties below are needed only the primary key is auto-incremental
    //var isAutoIncrement: Bool = false
    //var lastInsertedRowID: Int64 = 0
    
}
