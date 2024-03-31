//
//  ConfiguredTypeKey.swift
//  DARTI
//
//  Created by Peter Schuette on 3/31/24.
//

import Foundation

public struct ConfiguredTypeKey<Abstract, Configuration>: TypeKey {
    private let type: Abstract.Type
    private let typeConfig: Configuration.Type
    public var typeDescription: String { String(describing: type) }
    public let identifier: String?

    public init(
        _ type: Abstract.Type,
        _ typeConfig: Configuration.Type,
        identifier: String? = nil
    ) {
        self.type = type
        self.typeConfig = typeConfig
        self.identifier = identifier
    }

    public var rawValue: RawTypeKey {
        ["RegistrationKey", identifier, typeDescription, String(describing: typeConfig)]
            .compactMap { $0 }
            .joined(separator: ".")
    }

    public static func == (lhs: ConfiguredTypeKey<Abstract, Configuration>, rhs: ConfiguredTypeKey<Abstract, Configuration>) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
}
