import SwiftUI

extension TextView {
  /// Specify a placeholder text
  /// - Parameter placeholder: The placeholder text
  public func placeholder(_ placeholder: String) -> TextView {
    self.placeholder(placeholder) { $0 }
  }

  /// Specify a placeholder with the specified configuration
  ///
  /// Example:
  ///
  ///     TextView($text)
  ///         .placeholder("placeholder") { view in
  ///             view.foregroundColor(.red)
  ///         }
  public func placeholder(_ placeholder: String, _ configure: (Text) -> some View) -> TextView {
    var view = self
    let text = Text(placeholder)
    view.placeholderView = AnyView(configure(text))
    view.placeholderText = placeholder
    return view
  }

  /// Specify a custom placeholder view
  public func placeholder(_ placeholder: some View) -> TextView {
    var view = self
    view.placeholderView = AnyView(placeholder)
    return view
  }

  public func setKeyboardType(_ keyboardType: UIKeyboardType) -> TextView {
    var view = self
    view.keyboard = keyboardType
    return view
  }
}
