//
//  EmojiVersion.swift
//  EmojiKit
//
//  Created by Daniel Saidi on 2023-11-01.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUI

/// This enum defines all supported Emoji versions, that are
/// currently available to macOS.
///
/// The static ``EmojiVersion/all`` property will return all
/// versions while ``EmojiVersion/allAvailable`` will return
/// all versions available to the current runtime. This will
/// be used to let ``EmojiCategory`` just return emojis that
/// are available to the current runtime.
public struct EmojiVersion: Equatable {
    
    init(
        version: Double,
        emojis: String,
        iOS: Double,
        macOS: Double,
        tvOS: Double,
        watchOS: Double,
        comment: String = ""
    ) {
        let allEmojis = emojis.map(String.init).flatMap {
            let emoji = Emoji($0)
            let skintones = emoji.skinToneVariants
            let emojis = emoji.hasSkinToneVariants ? skintones : [emoji]
            return emojis.contains(emoji) ? emojis : [emoji] + emojis
        }
        self.emojis = allEmojis
        self.version = version
        self.iOS = iOS
        self.macOS = macOS
        self.tvOS = tvOS
        self.watchOS = watchOS
        self.comment = comment
    }
    
    init?(
        lastIn list: [Self]
    ) {
        guard let version = list.last else { return nil }
        self = version
    }
    
    /// The latest version for a certain iOS version.
    public init?(
        iOS version: Double
    ) {
        self.init(lastIn: Self.allAvailableIn(iOS: version))
    }
    
    /// The latest version for a certain macOS version.
    public init?(
        macOS version: Double
    ) {
        self.init(lastIn: Self.allAvailableIn(macOS: version))
    }
    
    /// The latest version for a certain tvOS version.
    public init?(
        tvOS version: Double
    ) {
        self.init(lastIn: Self.allAvailableIn(tvOS: version))
    }
    
    /// The latest version for a certain watchOS version.
    public init?(
        watchOS version: Double
    ) {
        self.init(lastIn: Self.allAvailableIn(watchOS: version))
    }
    
    /// The emojis to include in the information.
    public var emojis: [Emoji]
    
    /// The emoji version in which emojis became available.
    public let version: Double
    
    /// The iOS version in which emojis became available.
    public let iOS: Double
    
    /// The macOS version in which emojis became available.
    public let macOS: Double
    
    /// The tvOS version in which emojis became available.
    public let tvOS: Double

    /// The watchOS version in which emojis became available.
    public let watchOS: Double

    /// An optional comment, which can be used to discuss if
    /// the version made any changes that isn't reflected in
    /// the emojis it provides.
    public let comment: String?
}


// MARK: - Public functions

public extension EmojiVersion {

    static var v15_1: Self {
        .init(
            version: 15.1,
            emojis: "🙂‍↕️🙂‍↔️👩‍🦽‍➡️🧑‍🦽‍➡️👨‍🦽‍➡️👩‍🦼‍➡️🧑‍🦼‍➡️👨‍🦼‍➡️🚶‍♀️‍➡️🚶‍➡️🚶‍♂️‍➡️👩‍🦯‍➡️🧑‍🦯‍➡️👨‍🦯‍➡️🧎‍♀️‍➡️🧎‍➡️🧎‍♂️‍➡️🏃‍♀️‍➡️🏃‍➡️🏃‍♂️‍➡️🐦‍🔥🍋‍🟩🍄‍🟫⛓️‍💥",
            iOS: 17.4,
            macOS: 14.4,
            tvOS: 17.4,
            watchOS: 10.4,
            comment: "In this version, Apple removed the illustrated family emojis. Since they can't be rendered from this version and forward, the raw family badges have been added to their new location in the symbols category."
        )
    }

    static var v15: Self {
        .init(
            version: 15.0,
            emojis: "🫨🫸🫷🪿🫎🪼🫏🪽🪻🫛🫚🪇🪈🪮🪭🩷🩵🩶🪯🛜",
            iOS: 16.4,
            macOS: 13.3,
            tvOS: 16.4,
            watchOS: 9.4
        )
    }

    static var v14: Self {
        .init(
            version: 14.0,
            emojis: "🫠🫢🫣🫡🫥🫤🥹🫱🫲🫳🫴🫰🫵🫶🫦🫅🫃🫄🧌🪸🪷🪹🪺🫘🫗🫙🛝🛞🛟🪬🪩🪫🩼🩻🫧🪪🟰🫱🏻🫲🏻🫳🏻🫴🏻🫰🏻🫵🏻🫶🏻🤝🏻🫅🏻🫃🏻🫄🏻",
            iOS: 15.4,
            macOS: 12.3,
            tvOS: 15.4,
            watchOS: 8.5
        )
    }
            
    static var v13_1: Self {
        .init(
            version: 13.1,
            emojis: "😶‍🌫️😮‍💨😵‍💫❤️‍🔥❤️‍🩹🧔‍♂️🧔‍♀️💏🏻👩🏻‍❤️‍💋‍👨🏻👨🏻‍❤️‍💋‍👨🏻👩🏻‍❤️‍💋‍👩🏻💑🏻👩🏻‍❤️‍👨🏻👨🏻‍❤️‍👨🏻👩🏻‍❤️‍👩🏻",
            iOS: 14.5,
            macOS: 11.3,
            tvOS: 14.5,
            watchOS: 7.4
        )
    }
    
    static var v13: Self {
        .init(
            version: 13.0,
            emojis: "🥲🥸🤌🫀🫁🥷🫂🦬🦣🦫🦤🪶🦭🪲🪳🪰🪱🪴🫐🫒🫑🫓🫔🫕🫖🧋🪨🪵🛖🛻🛼🪄🪅🪆🪡🪢🩴🪖🪗🪘🪙🪃🪚🪛🪝🪜🛗🪞🪟🪠🪤🪣🪥🪦🪧⚧️🤌🏻🥷🏻🤵‍♂️🤵‍♀️👰‍♂️👰‍♀️👩‍🍼👨‍🍼🧑‍🍼🧑‍🎄🐈‍⬛🐻‍❄️🏳️‍⚧️",
            iOS: 14.2,
            macOS: 11.1,
            tvOS: 14.2,
            watchOS: 7.1
        )
    }

    static var v12_1: Self {
        .init(
            version: 12.1,
            emojis: "🧑‍🦰🧑‍🦱🧑‍🦳🧑‍🦲🧑‍⚕️🧑‍🎓🧑‍🏫🧑‍⚖️🧑‍🌾🧑‍🍳🧑‍🔧🧑‍🏭🧑‍💼🧑‍🔬🧑‍💻🧑‍🎤🧑‍🎨🧑‍✈️🧑‍🚀🧑‍🚒🧑‍🦯🧑‍🦼🧑‍🦽🧑🏻‍🤝‍🧑🏼👩🏻‍🤝‍👩🏼👨🏻‍🤝‍👨🏼",
            iOS: 12.1,
            macOS: 10.14,
            tvOS: 12.1,
            watchOS: 5.1
        )
    }
    
    static var v12: Self {
        .init(
            version: 12.0,
            emojis: "🥱🤎🤍🤏🦾🦿🦻🧏🧍🧎🦧🦮🦥🦦🦨🦩🧄🧅🧇🧆🧈🦪🧃🧉🧊🛕🦽🦼🛺🪂🪐🤿🪀🪁🦺🥻🩱🩲🩳🩰🪕🪔🪓🦯🩸🩹🩺🪑🪒🟠🟡🟢🟣🟤🟥🟧🟨🟩🟦🟪🟫🤏🏻🦻🏻🧏🏻🧏‍♂️🧏‍♀️🧍🏻🧍‍♂️🧍‍♀️🧎🏻🧎‍♂️🧎‍♀️👨‍🦯👩‍🦯👨‍🦼👩‍🦼👨‍🦽👩‍🦽🧑‍🤝‍🧑👭🏻👫🏻👬🏻🐕‍🦺",
            iOS: 12.1,
            macOS: 10.14,
            tvOS: 12.1,
            watchOS: 5.1
        )
    }

    static var v11: Self {
        .init(
            version: 11.0,
            emojis: "🥰🥵🥶🥴🥳🥺🦵🦶🦷🦴🦸🦹🦝🦙🦛🦘🦡🦢🦚🦜🦟🦠🥭🥬🥯🧂🥮🦞🧁🧭🧱🛹🧳🧨🧧🥎🥏🥍🧿🧩🧸♟️🧵🧶🥽🥼🥾🥿🧮🧾🧰🧲🧪🧫🧬🧴🧷🧹🧺🧻🧼🧽🧯♾️🦵🏻🦶🏻👨‍🦰👨‍🦱👨‍🦳👨‍🦲👩‍🦰👩‍🦱👩‍🦳👩‍🦲🦸🏻🦸‍♂️🦸‍♀️🦹🏻🦹‍♂️🦹‍♀️🏴‍☠️",
            iOS: 11.1,
            macOS: 10.13,
            tvOS: 11.1,
            watchOS: 4.1
        )
    }
    
    /// The ``EmojiVersion`` that is used by the current OS.
    static var current: Self {
        if #available(iOS 17.4, macOS 14.4, tvOS 17.4, watchOS 10.4, *) {
            return .v15_1
        }
        if #available(iOS 16.4, macOS 13.3, tvOS 16.4, watchOS 9.4, *) {
            return .v15
        } 
        if #available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 8.5, *) {
            return .v14
        }
        return .v13_1
    }
    
    /// All currently unavailable emojis.
    static let currentUnavailableEmojis: [Emoji] = {
        current.unavailableEmojis
    }()
    
    /// All currently unavailable emojis, performance cached.
    static let currentUnavailableEmojisDictionary: [String: Emoji] = {
        let emojis = currentUnavailableEmojis
        let values = emojis.map { ($0.char, $0) }
        let dict = Dictionary(uniqueKeysWithValues: values)
        return dict
    }()

    /// All emoji versions that are defined in the library.
    static var all: [Self] {
        [.v11, .v12, .v12_1, .v13, .v13_1, .v14, .v15, .v15_1]
    }
    
    /// All emoji versions that are available to the runtime.
    static var allAvailable: [Self] {
        allAvailableIn()
    }
    
    /// All emoji versions that are available for a runtime.
    static func allAvailableIn(
        _ version: Double = 1_000,
        iOS: Double = 1_000,
        macOS: Double = 1_000,
        tvOS: Double = 1_000,
        watchOS: Double = 1_000
    ) -> [Self] {
        all.filter {
            $0.version <= version &&
            $0.iOS <= iOS &&
            $0.macOS <= macOS &&
            $0.tvOS <= tvOS &&
            $0.watchOS <= watchOS
        }
    }
    
    /// Get all earlier Emoji versions for this version.
    var earlierVersions: [Self] {
        Self.all.filter { $0.version < version }
    }
    
    /// Get all later Emoji versions for this version.
    var laterVersions: [Self] {
        Self.all.filter { $0.version > version }
    }

    /// Get all older Emoji versions specified by this type.
    var olderVersions: [Self] {
        Self.all.filter { $0.version < version }
    }

    /// Get all emojis that are unavailable in this version.
    var unavailableEmojis: [Emoji] {
        laterVersions.flatMap { $0.emojis }
    }
}

public extension Emoji {
    
    /// If the emoji is available in the current runtime.
    var isAvailableInCurrentRuntime: Bool {
        !isUnavailableInCurrentRuntime
    }
    
    /// If the emoji is unavailable in the current runtime.
    var isUnavailableInCurrentRuntime: Bool {
        EmojiVersion.currentUnavailableEmojisDictionary[char] != nil
    }
}

#Preview {
    ZStack {
        Color.black.opacity(0.1).ignoresSafeArea()

        VStack(alignment: .leading) {
            Text("Emoji 15.1")
                .font(.title.bold())
            EmojiGrid(
                emojis: EmojiVersion.v15_1.emojis,
                section: { $0.view },
                item: { $0.view }
            )
            .padding()
            .background(Color.white)
            .clipShape(.rect(cornerRadius: 10))
        }
        .padding()
    }
}
