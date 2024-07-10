//
//  InitializerTests.swift
//  DARTITests
//
//  Created by Peter Schuette on 7/7/24.
//

import Foundation
@testable import DARTI
import XCTest

final class InitializerTests: XCTestCase {
    func test_initSimpleType() {
        let registry = TypeRegistry {
            Registration(TypeKeys.simpleObject) { _ in
                let instance = SomeSimpleType()
                instance.someInt = 123
                return instance
            }
        }
        
        let initializer = Initializer(registry)
        let simpleTypeInstance = initializer.initType(of: TypeKeys.simpleObject)
        XCTAssertEqual(simpleTypeInstance.someInt, 123)
    }
    
    func test_initConfiguredType() {
        let registry = TypeRegistry {
            Registration(TypeKeys.configuredObject) { configuration, _ in
                SomeConfiguredType(configuredInt: configuration.someInt, configuredString: configuration.someString)
            }
        }
        
        let initializer = Initializer(registry)
        let configuredTypeInstance = initializer.initType(of: TypeKeys.configuredObject, configuration: SomeTypeConfiguration(someInt: 123, someString: "some string"))
        XCTAssertEqual(configuredTypeInstance.configuredInt, 123)
        XCTAssertEqual(configuredTypeInstance.configuredString, "some string")
    }
}

extension TypeKeys {
    static let simpleObject = SimpleTypeKey(SomeSimpleTypeProtocol.self)
    static let configuredObject = ConfiguredTypeKey(SomeConfiguredTypeProtocol.self, SomeTypeConfiguration.self)
}


protocol SomeSimpleTypeProtocol {
    var someInt: Int { get }
}

final class SomeSimpleType: SomeSimpleTypeProtocol {
    var someInt: Int = -1
}


struct SomeTypeConfiguration: TypeConfiguration {
    let someInt: Int
    let someString: String
}

protocol SomeConfiguredTypeProtocol {
    var configuredInt: Int { get }
    var configuredString: String { get }
}

final class SomeConfiguredType: SomeConfiguredTypeProtocol {
    let configuredInt: Int
    let configuredString: String
    
    init(configuredInt: Int, configuredString: String) {
        self.configuredInt = configuredInt
        self.configuredString = configuredString
    }
}
