//
//  File.swift
//  
//
//  Created by Vivienne Fosh on 01.10.2023.
//

import Foundation

public struct DragRestrictions: OptionSet {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let horizontal = DragRestrictions(rawValue: 1 << 0)
    public static let vertical = DragRestrictions(rawValue: 1 << 1)
    public static let left = DragRestrictions(rawValue: 1 << 2)
    public static let right = DragRestrictions(rawValue: 1 << 3)
    public static let up = DragRestrictions(rawValue: 1 << 4)
    public static let down = DragRestrictions(rawValue: 1 << 5)
    
    // Convenience groupings
    public static let all: DragRestrictions = [.horizontal, .vertical]
    public static let horizontalOnly: DragRestrictions = [.left, .right]
    public static let verticalOnly: DragRestrictions = [.up, .down]
}
