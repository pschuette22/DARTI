//
//  ConfiguredTypeResolver.swift
//  DARTI
//
//  Created by Peter Schuette on 3/31/24.
//

import Foundation

struct ConfiguredTypeResolver<C: TypeConfiguration>: TypeResolver {
    var resolve: (C, Initializer) -> Any

    // swift-format-ignore
    init<Concrete>(
        _ resolve: @escaping (C, Initializer) -> Concrete
    ) {
        self.resolve = resolve
    }
}
