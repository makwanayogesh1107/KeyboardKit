import SwiftUI

@available(*, deprecated, renamed: "KeyboardStatus")
public typealias KeyboardState = KeyboardStatus

@available(*, deprecated, renamed: "KeyboardStatus")
public typealias KeyboardStateContext = KeyboardStatusContext

@available(*, deprecated, renamed: "KeyboardStatusInspector")
public typealias KeyboardStateInspectorContext = KeyboardStatusInspector

@available(*, deprecated, renamed: "KeyboardStatus.Label")
public typealias KeyboardStateLabel = KeyboardStatus.Label

@available(*, deprecated, renamed: "KeyboardStatus.LabelStyle")
public typealias KeyboardStateLabelStyle = KeyboardStatus.LabelStyle

public extension View {

    @available(*, deprecated, renamed: "keyboardStatusLabelStyle(_:)")
    func keyboardStateLabelStyle(
        _ style: KeyboardStatus.LabelStyle
    ) -> some View {
        self.environment(\.keyboardStatusLabelStyle, style)
    }
}
