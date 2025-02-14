//
//  KeyboardTheme+Settings.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2024-10-27.
//  Copyright © 2024-2025 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUI

public extension KeyboardTheme {

    /// This type is used for theme-related settings.
    ///
    /// Use the ``theme`` property to get the selected theme,
    /// and the ``themeValue`` to get any persisted data.
    ///
    /// > Important: Due to an observation issue that caused
    /// SwiftUI to not update when the ``theme`` was changed,
    /// use the context to change the theme instead.
    struct Settings {

        /// Create a custom settings instance.
        public init() {}

        /// The settings key prefix to use for the namespace.
        public static var settingsPrefix: String {
            Keyboard.Settings.storeKeyPrefix(for: "themes")
        }

        /// The current theme, if any.
        public var theme: KeyboardTheme? {
            themeValue.value
        }

        /// The current theme storage value, if any.
        @AppStorage("\(settingsPrefix)theme", store: .keyboardSettings)
        public var themeValue: Keyboard.StorageValue<KeyboardTheme?> = .init(value: nil)
    }
}
