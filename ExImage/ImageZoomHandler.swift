//
//  ImageZoomHandler.swift
//  ExImage
//
//  Created by 강동영 on 4/23/25.
//

import UIKit

@MainActor
class ImageZoomHandler {
    
    nonisolated init() {}
    
    func regist(with view: UIView) {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinched(_:)))
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTapped(_:)))
        tapGesture.numberOfTapsRequired = 2
        view.addGestureRecognizer(tapGesture)
        view.addGestureRecognizer(pinchGesture)
        
        
        view.isUserInteractionEnabled = true
    }
    
    @objc func pinched(_ recognizer: UIPinchGestureRecognizer) {
        guard let view = recognizer.view else { return }
        
        switch recognizer.state {
        case .ended, .cancelled, .failed:
            guard view.transform.a < 1.0 else { return }
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseInOut]) {
                view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
            
        default:
            Task {
                view.transform = CGAffineTransform(scaleX: recognizer.scale, y: recognizer.scale)
            }
        }
    }
    
    @objc func doubleTapped(_ recognizer: UITapGestureRecognizer) {
        guard let view = recognizer.view else { return }
        print(#function)
       
        let scale: CGFloat = view.transform.a == 1.0 ? 2.0 : 1.0
        UIView.animate(withDuration: 0.3) {
            view.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
}
