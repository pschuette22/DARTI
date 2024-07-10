//
//  ConfiguredType.swift
//  DARTI
//
//  Created by Peter Schuette on 3/31/24.
//

import Foundation

/// An abtract type used to configure a concretion
/// This should always be a primative / value types
public protocol TypeConfiguration: Hashable {}

/// The interface of a type that can be configured
public protocol ConfiguredType<Configuration> {
    associatedtype Configuration: TypeConfiguration
}
