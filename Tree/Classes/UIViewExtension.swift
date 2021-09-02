//
//  UIViewExtension.swift
//  Tree
//
//  Created by LΞO on 2021/3/24.
//
//  Copyright (c) 2021 Leo <leodaxia@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation
import UIKit


/// Adds a view to the end of the receiver’s list of subviews.
/// - Parameters:
///   - superview: The superview.
///   - subviewOrSublayer: The view or layer to be added. After being added, this view or layer appears on top of any other subviews.
/// - Returns: The superview.
@discardableResult
public func <-(superview: UIView, subviewOrSublayer: AnyObject?) -> UIView {
  return addSubviewOrSublayer(subviewOrSublayer as Any, to: superview)
}

/// Adds a view to the end of the receiver’s list of subviews.
/// - Parameters:
///   - superview: The superview.
///   - subviewOrSublayer: The view or layer to be added. After being added, this view or layer appears on top of any other subviews.
/// - Returns: The superview.
@discardableResult
public func <-(superview: UIView, subviewOrSublayer: (AnyObject?, Int)) -> UIView {
  return addSubviewOrSublayer(subviewOrSublayer, to: superview)
}

/// Adds the views to the end of the receiver’s list of subviews.
/// - Parameters:
///   - superview: The superview.
///   - subviewOrSublayers: The views or layers to be added. After being added, these views or layers appear on top of any other subviews.
/// - Returns: The superview.
@discardableResult
public func <-(superview: UIView, subviewOrSublayers: [Any?]) -> UIView {
  for subviewOrSublayer in subviewOrSublayers {
    addSubviewOrSublayer(subviewOrSublayer, to: superview)
  }
  return superview
}

public extension UIView {
  /// Adds the views to the end of the receiver’s list of subviews.
  /// - Parameter subviews: The views to be added. After being added, these views appear on top of any other subviews.
  func addSubviews(_ subviews: [UIView?]) {
    subviews
      .compactMap { $0 }
      .forEach { addSubview($0) }
  }

  /// Unlinks all subviews from their superview and their window, and removes these from the responder chain.
  func removeAllSubviews() {
    subviews.forEach { $0.removeFromSuperview() }
  }
}

@discardableResult
fileprivate func addSubviewOrSublayer(_ subviewOrSublayer: Any?, to superview: UIView) -> UIView {
  if case Optional<Any>.none = subviewOrSublayer {
    return superview
  }

  let contentView: UIView
  if let superview = superview as? UIVisualEffectView {
    contentView = superview.contentView
  } else {
    contentView = superview
  }
  if let view = subviewOrSublayer as? UIView {
    contentView.addSubview(view)
  } else if let layer = subviewOrSublayer as? CALayer {
    contentView.layer.addSublayer(layer)
  } else if let (view, index) = subviewOrSublayer as? (UIView, Int) {
    contentView.insertSubview(view, at: index)
  } else if let (layer, index) = subviewOrSublayer as? (CALayer, Int) {
    contentView.layer.insertSublayer(layer, at: UInt32(index))
  } else {
    fatalError("WARNING: invalid subviewOrSublayer: \(String(describing: subviewOrSublayer))")
  }
  return superview
}
