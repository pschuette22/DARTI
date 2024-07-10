//
//  Registration.swift
//  DARTI
//
//  Created by Peter Schuette on 3/31/24.
//

import Foundation

public struct Registration {
    let key: any TypeKey
    let resolver: any TypeResolver

    public init<Abstract>(_ key: SimpleTypeKey<Abstract>, _ resolve: @escaping (Initializer) -> Abstract) {
        self.key = key
        resolver = SimpleTypeResolver(resolve)
    }

    public init<Abstract, C: TypeConfiguration>(
        _ key: ConfiguredTypeKey<Abstract, C>,
        _ resolve: @escaping (C, Initializer) -> Abstract
    ) {
        self.key = key
        resolver = ConfiguredTypeResolver<C>(resolve)
    }
}
