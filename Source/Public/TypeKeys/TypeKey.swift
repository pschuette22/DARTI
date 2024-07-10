//
//  TypeKey.swift
//  DARTI
//
//  Created by Peter Schuette on 3/31/24.
//

import Foundation

public typealias RawTypeKey = String

public enum TypeKeys { /* Empty for extension */ }

public protocol TypeKey: Equatable, CustomStringConvertible {
    associatedtype Abstract

    var rawValue: RawTypeKey { get }
    var typeDescription: String { get }
}

// MARK: - CustomStringConvertible

public extension TypeKey {
    var description: String {
        String(describing: type(of: self)) + "<" + typeDescription + ">"
    }
}
