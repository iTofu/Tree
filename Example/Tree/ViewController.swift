//
//  ViewController.swift
//  Tree
//
//  Created by iTofu on 03/24/2021.
//  Copyright (c) 2021 iTofu. All rights reserved.
//

import UIKit
import Tree

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    testView()
    testLayer()
    testStackView()
  }

  private func testView() {
    let aView = UIView()
    aView.frame = CGRect(x: 50, y: 100, width: 80, height: 30)
    aView.backgroundColor = .orange

    let bView = UIView()
    bView.frame = CGRect(x: 100, y: 200, width: 50, height: 70)
    bView.backgroundColor = .red

    let cView = UIView()
    cView.frame = CGRect(x: 10, y: 20, width: 30, height: 40)
    bView.backgroundColor = .purple

    view <- [
      aView,
      bView <- [
        cView,
      ],
    ]
  }

  private func testLayer() {
    let aLayer = CALayer()
    aLayer.frame = CGRect(x: 180, y: 300, width: 100, height: 80)
    aLayer.backgroundColor = UIColor.yellow.cgColor

    let bLayer = CALayer()
    bLayer.frame = CGRect(x: 120, y: 400, width: 60, height: 60)
    bLayer.backgroundColor = UIColor.cyan.cgColor

    view.layer <- [
      aLayer,
      bLayer,
    ]
  }

  private func testStackView() {
    guard #available(iOS 9.0, *) else { return }

    let stackView = UIStackView()
    stackView.frame = CGRect(x: 150, y: 500, width: 200, height: 200)
    stackView.distribution = .fillEqually

    let aView = UIView()
    aView.backgroundColor = .green

    let bView = UIView()
    bView.backgroundColor = .blue

    view <- [
      stackView <- [
        aView,
        bView,
      ],
    ]
  }
}
