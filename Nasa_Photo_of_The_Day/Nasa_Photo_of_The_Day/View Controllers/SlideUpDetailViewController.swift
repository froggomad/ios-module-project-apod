//
//  ABrandNewViewController.swift
//  Nasa_Photo_of_The_Day
//
//  Created by Kenny on 6/18/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import UIKit

class SlideUpDetailViewController: UIViewController {

    // MARK: - View Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()

        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(SlideUpDetailViewController.panGesture))
        view.addGestureRecognizer(gesture)
        createViews()
    }

    func createViews() {
        let frame = self.view.frame
        let imageWidth = frame.width / 2.5
        let imageHeight = frame.height / 50 // 10% of the visible portion

        let imageViewBackgroundColor = UIColor.systemGray4
        let mainBackgroundColor = UIColor.darkGray

        let imageView = UIImageView(frame: CGRect(x: frame.midX - imageHeight, y: 0, width: imageWidth / 5, height: imageHeight))
        imageView.image = UIImage(systemName: "chevron.up")
        imageView.backgroundColor = imageViewBackgroundColor
        //create the background strip at the top
        let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: imageHeight * 2))
        backgroundView.backgroundColor = mainBackgroundColor
        backgroundView.layer.zPosition = imageView.layer.zPosition - 1
        backgroundView.layer.cornerRadius = 16
        //remove the bottom cornerRadius ;)
        let separatorView = UIView(frame: CGRect(x: 0, y: backgroundView.frame.midY + 3, width: frame.width, height: backgroundView.frame.height / 2))
        separatorView.backgroundColor = mainBackgroundColor

        view.addSubview(imageView)
        view.addSubview(backgroundView)
        view.addSubview(separatorView)

        let pullViewHeight = backgroundView.frame.height - 3
        let contentView = UIView(frame: CGRect(x: 0, y: separatorView.frame.maxY, width: view.frame.width, height: view.frame.height - pullViewHeight))
        contentView.backgroundColor = .white

        let leadingInset: CGFloat = 20
        let widthRespectingInsets: CGFloat = view.frame.width - leadingInset*2
        let verticalInset: CGFloat = 12
        let labelHeight: CGFloat = 20


        let titleLabel = UILabel(frame: CGRect(x: leadingInset, y: separatorView.frame.maxY + verticalInset, width: widthRespectingInsets, height: labelHeight))
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center

        let textView = UITextView(frame: CGRect(x: leadingInset, y: titleLabel.frame.maxY + verticalInset, width: widthRespectingInsets, height: frame.height - pullViewHeight - 100))
        textView.layer.zPosition += 1
        #warning("DEV")
        textView.text = "Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. Lorem Ipsum Solem Dolar Amet. "
        titleLabel.text = "Test Text"



        view.addSubview(textView)
        view.addSubview(contentView)
        view.addSubview(titleLabel)
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
