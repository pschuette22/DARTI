//
//  SimpleTypeResolver.swift
//  DARTI
//
//  Created by Peter Schuette on 3/31/24.
//

import Foundation

struct SimpleTypeResolver: TypeResolver {
    var resolve: (Initializer) -> Any

    // swift-format-ignore
    init<Concrete>(
        _ resolve: @escaping (Initializer) -> Concrete
    ) {
        self.resolve = resolve
    }
}
