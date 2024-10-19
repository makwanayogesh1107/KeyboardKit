//
//  InputSetTests.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-03.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import XCTest

class InputSetTests: XCTestCase {

    func testQwertyDefinesValidCharactersForPhone() {
        let set = InputSet.qwerty
        let chars = set.characterStrings(for: .lowercased, device: .phone)
        XCTAssertEqual(chars, ["qwertyuiop", "asdfghjkl", "zxcvbnm"])
    }

    func testNumericDefinesValidCharactersForPhone() {
        let set = InputSet.numeric(currency: "$")
        let chars = set.characterStrings(for: .lowercased, device: .phone)
        XCTAssertEqual(chars, ["1234567890", "-/:;()$&@”", ".,?!’"])
    }

    func testSymbolicDefinesValidCharactersForPhone() {
        let set = InputSet.symbolic(currencies: "ABC".chars)
        let chars = set.characterStrings(for: .lowercased, device: .phone)
        XCTAssertEqual(chars, ["[]{}#%^*+=", "_\\|~<>abc•", ".,?!’"])
    }
}
