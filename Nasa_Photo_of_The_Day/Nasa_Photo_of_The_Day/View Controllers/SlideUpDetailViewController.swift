//
//  ABrandNewViewController.swift
//  Nasa_Photo_of_The_Day
//
//  Created by Kenny on 6/18/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import UIKit

class SlideUpDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(SlideUpDetailViewController.panGesture))
        view.addGestureRecognizer(gesture)
    }

    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            //move the view's frame up by 20% of the screen's bounds
            let frame = self.view.frame
            let yValue = UIScreen.main.bounds.height - UIScreen.main.bounds.height / 5

            self.view.frame = CGRect(x: 0, y: yValue, width: frame.width, height: frame.height)
        }
    }

    ///pan the view in the y direction when the user grabs and pulls in the y direction
    @objc func panGesture(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        let y = self.view.frame.minY
        self.view.frame = CGRect(x: 0, y: y + translation.y, width: view.frame.width, height: view.frame.height)
        recognizer.setTranslation(.zero, in: self.view)
    }

}
