//
//  RegistrationsBuilder.swift
//  DARTI
//
//  Created by Peter Schuette on 3/31/24.
//

import Foundation

@resultBuilder
public enum RegistrationsBuilder {
    public static func buildBlock(
        _ components: Registration...
    ) -> [Registration] {
        components
    }
}
