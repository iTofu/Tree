//
//  UIStackViewExtension.swift
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
///   - subview: The view to be added. After being added, this view appears on top of any other subviews.
/// - Returns: The superview.
@available(iOS 9.0, *)
@discardableResult
public func <-(superview: UIStackView, subview: AnyObject?) -> UIStackView {
  return addSubview(subview as Any, to: superview)
}

/// Adds a view to the end of the receiver’s list of subviews.
/// - Parameters:
///   - superview: The superview.
///   - subview: The view to be added. After being added, this view appears on top of any other subviews.
/// - Returns: The superview.
@available(iOS 9.0, *)
@discardableResult
public func <-(superview: UIStackView, subview: (AnyObject?, Int)) -> UIStackView {
  return addSubview(subview, to: superview)
}

/// Adds the views to the end of the receiver’s list of subviews.
/// - Parameters:
///   - superview: The superview.
///   - subviews: The views to be added. After being added, these views appear on top of any other subviews.
/// - Returns: The superview.
@available(iOS 9.0, *)
@discardableResult
public func <-(superview: UIStackView, subviews: [Any?]) -> UIStackView {
  for subview in subviews {
    addSubview(subview, to: superview)
  }
  return superview
}

@available(iOS 9.0, *)
public extension UIStackView {
  /// Adds the views to the end of the arrangedSubviews array
  /// - Parameter views: The views to be added to the array of views arranged by the stack.
  func addArrangedSubviews(_ views: [UIView?]) {
    views
      .compactMap { $0 }
      .forEach { addArrangedSubview($0) }
  }

  /// Removes the provided views from the stack’s array of arranged subviews, unlinks all subviews from their superview and their window, and removes these from the responder chain.
  func removeAllArrangedSubviews() {
    arrangedSubviews.forEach {
      removeArrangedSubview($0)
      $0.removeFromSuperview()
    }
  }
}

@available(iOS 9.0, *)
@discardableResult
fileprivate func addSubview(_ subview: Any?, to superview: UIStackView) -> UIStackView {
  if case Optional<Any>.none = subview {
    return superview
  }

  if let view = subview as? UIView {
    superview.addArrangedSubview(view)
  } else if let (view, index) = subview as? (UIView, Int) {
    superview.insertArrangedSubview(view, at: index)
  } else {
    fatalError("WARNING: invalid subview: \(String(describing: subview))")
  }
  return superview
}
