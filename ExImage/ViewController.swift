//
//  ViewController.swift
//  ExImage
//
//  Created by 강동영 on 12/31/24.
//

import UIKit

final class ViewController: UIViewController {
    private let imageView: ZoomableImageView = {
        let neuvilletteImage = UIImage.neuvillette
        let imageView: ZoomableImageView = .init(image: neuvilletteImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    private func layout() {
        view.addSubview(imageView)
        let verticalPadding: CGFloat = 80
        let horizontalPadding: CGFloat = 40
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: verticalPadding),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: horizontalPadding),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -horizontalPadding),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -verticalPadding),
        ])
    }
}

@available(iOS 17.0, *)
#Preview {
    ViewController()
}
