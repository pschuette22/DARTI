//
//  TypeRegistry.swift
//  DARTI
//
//  Created by Peter Schuette on 3/31/24.
//

import Foundation

@resultBuilder
public enum RegistryMerger {
    public static func buildBlock(
        _ components: TypeRegistry...
    ) -> [TypeRegistry] {
        components
    }
}

public struct TypeRegistry {
    let registrations: [Registration]
    public init(@RegistrationsBuilder _ content: () -> [Registration]) {
        registrations = content()
    }

    public init(@RegistryMerger _ content: () -> [TypeRegistry]) {
        registrations = content().reduce(into: [Registration]()) { partialResult, registry in
            // TODO: validate against overwriting.
            partialResult.append(contentsOf: registry.registrations)
        }
    }
}
