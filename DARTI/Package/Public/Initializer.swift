//
//  Initializer.swift
//  DARTI
//
//  Created by Peter Schuette on 3/31/24.
//

import Foundation

public final class Initializer {
    fileprivate var registrations = [RawTypeKey: any TypeResolver]()
    public init(_ types: TypeRegistry) {
        register(types: types)
    }

    func register(types: TypeRegistry) {
        for registration in types.registrations {
            // TODO: Type check for overlap
            registrations[registration.key.rawValue] = registration.resolver
        }
    }
}

public extension Initializer {
    func initType<T>(
        of typeKey: SimpleTypeKey<T>,
        file: StaticString = #file,
        line: UInt = #line
    ) -> T {
        guard let typeResolver = registrations[typeKey.rawValue] as? SimpleTypeResolver else {
            // TODO: fill out info on missing type
            // TODO: Compile step for symbol evaluation
            fatalError("Registration missing!", file: file, line: line)
        }
        return typeResolver.resolve() as! T
    }

    func initType<T, C: TypeConfiguration>(
        of typeKey: ConfiguredTypeKey<T, C>,
        configuration: C,
        file: StaticString = #file,
        line: UInt = #line
    ) -> T {
        guard let typeResolver = registrations[typeKey.rawValue] as? ConfiguredTypeResolver<C> else {
            // TODO: fill out info on missing type
            //  TODO: Compile step for symbol evaluation
            fatalError("Registration missing!", file: file, line: line)
        }
        return typeResolver.resolve(configuration) as! T
    }
}
