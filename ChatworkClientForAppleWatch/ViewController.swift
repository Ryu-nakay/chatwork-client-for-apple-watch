//
//  ViewController.swift
//  ChatworkClientForAppleWatch
//
//  Created by cw-ryu.nakayama on 2023/07/01.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        embedSwiftUIView()
    }

    @IBOutlet weak var swiftUIView: UIView!
    
    // SwiftUIViewの埋め込み
    private func embedSwiftUIView() {
        let viewController: UIHostingController<TokenInputView> = UIHostingController(rootView: TokenInputView())
        addChild(viewController)

        swiftUIView.addSubview(viewController.view)

        viewController.didMove(toParent: self)

        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewController.view.widthAnchor.constraint(
                equalTo: swiftUIView.widthAnchor,
                multiplier: 1
            ),
            viewController.view.heightAnchor.constraint(
                equalTo: swiftUIView.heightAnchor,
                multiplier: 1
            ),
            viewController.view.centerXAnchor.constraint(
                equalTo: swiftUIView.centerXAnchor
            ),
            viewController.view.centerYAnchor.constraint(
                equalTo: swiftUIView.centerYAnchor
            )
        ])
    }
    
}

