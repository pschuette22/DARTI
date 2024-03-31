//
//  SimpleTypeResolver.swift
//  DARTI
//
//  Created by Peter Schuette on 3/31/24.
//

import Foundation

struct SimpleTypeResolver: TypeResolver {
    var resolve: () -> Any

    // swift-format-ignore
    init<Concrete>(
        _ resolve: @escaping () -> Concrete
    ) {
        self.resolve = resolve
    }
}
