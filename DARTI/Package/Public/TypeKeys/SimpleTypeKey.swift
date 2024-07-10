//
//  SimpleTypeKey.swift
//  DARTI
//
//  Created by Peter Schuette on 3/31/24.
//

import Foundation

public struct SimpleTypeKey<Abstract>: TypeKey {
    private let type: Abstract.Type
    public var typeDescription: String { String(describing: type) }
    public let identifier: String?

    public init(
        _ type: Abstract.Type,
        identifier: String? = nil
    ) {
        self.type = type
        self.identifier = identifier
    }

    public var rawValue: RawTypeKey {
        ["RegistrationKey", identifier, typeDescription]
            .compactMap { $0 }
            .joined(separator: ".")
    }

    public static func == (lhs: SimpleTypeKey<Abstract>, rhs: SimpleTypeKey<Abstract>) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
}
