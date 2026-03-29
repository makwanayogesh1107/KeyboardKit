//
//  KeyboardInputViewController+Host.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2023-03-27.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(visionOS)
import SwiftUI
import UIKit

public extension KeyboardInputViewController {
    
    /// The bundle ID of the host application, if any, or if the view
    /// is instantiated directly within a host app, the bundle id
    /// of the main bundle.
    ///
    /// The property uses technologies that may stop working
    /// in any future iOS version. Do not rely solely on the
    /// function, and design the app to be able to work even
    /// if this feature suddenly stops working.
    var hostApplicationBundleId: String? {
        if Bundle.main.isExtension {
           return nil
        } else {
            return Bundle.main.bundleIdentifier
        }
    }
    
    @available(*, deprecated, renamed: "hostApplicationBundleId")
    var hostBundleId: String? {
        hostApplicationBundleId
    }
}

private extension KeyboardInputViewController {
    
    var hostBundleIdValueBefore16: String? {
        let value = parent?.value(forKey: "_hostBundleID") as? String
        return value != "<null>" ? value: nil
    }
    
    var hostBundleIdValueFor16: String? {
        return nil
    }
}
#endif
