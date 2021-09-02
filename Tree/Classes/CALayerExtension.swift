//
//  CALayerExtension.swift
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


/// Appends the layer to the layer’s list of sublayers.
/// - Parameters:
///   - superlayer: The superlayer.
///   - sublayer: The layer to be added.
/// - Returns: The superlayer.
@discardableResult
public func <-(superlayer: CALayer, sublayer: AnyObject?) -> CALayer {
  return addSublayer(sublayer as Any, to: superlayer)
}

/// Appends the layer to the layer’s list of sublayers.
/// - Parameters:
///   - superlayer: The superlayer.
///   - sublayer: The layer to be added.
/// - Returns: The superlayer.
@discardableResult
public func <-(superlayer: CALayer, sublayer: (AnyObject?, Int)) -> CALayer {
  return addSublayer(sublayer, to: superlayer)
}

/// Appends the layer to the layer’s list of sublayers.
/// - Parameters:
///   - superlayer: The superlayer.
///   - sublayers: The layers to be added.
/// - Returns: The superlayer.
@discardableResult
public func <-(superlayer: CALayer, sublayers: [Any?]) -> CALayer {
  for sublayer in sublayers {
    addSublayer(sublayer, to: superlayer)
  }
  return superlayer
}

public extension CALayer {
  /// Appends the layer to the layer’s list of sublayers.
  /// - Parameter sublayers: The layers to be added.
  func addSublayers(_ sublayers: [CALayer?]) {
    sublayers
      .compactMap { $0 }
      .forEach { addSublayer($0) }
  }

  /// Detaches the layers from their parent layer.
  func removeAllSublayers() {
    sublayers?.forEach { $0.removeFromSuperlayer() }
  }
}

@discardableResult
fileprivate func addSublayer(_ sublayer: Any?, to superlayer: CALayer) -> CALayer {
  if case Optional<Any>.none = sublayer {
    return superlayer
  }

  if let layer = sublayer as? CALayer {
    superlayer.addSublayer(layer)
  } else if let (layer, index) = sublayer as? (CALayer, Int) {
    superlayer.insertSublayer(layer, at: UInt32(index))
  } else {
    fatalError("WARNING: invalid sublayer: \(String(describing: superlayer))")
  }
  return superlayer
}
