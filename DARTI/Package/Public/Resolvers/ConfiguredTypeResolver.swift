//
//  ConfiguredTypeResolver.swift
//  DARTI
//
//  Created by Peter Schuette on 3/31/24.
//

import Foundation

struct ConfiguredTypeResolver<C: TypeConfiguration> {
    var resolve: (C) -> Any

    // swift-format-ignore
    init<Concrete>(
        _ resolve: @escaping (C) -> Concrete
    ) {
        self.resolve = resolve
    }
}
