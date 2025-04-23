//
//  TouchManager.swift
//  ExImage
//
//  Created by 강동영 on 4/23/25.
//

import UIKit

@MainActor
class TouchManager {
    
    nonisolated init() {}
    
    @objc func pinched(_ recognizer: UIPinchGestureRecognizer) {
        guard let imageView = recognizer.view as? UIImageView else { return }
        
        switch recognizer.state {
        case .ended, .cancelled, .failed:
            guard imageView.transform.a < 1.0 else { return }
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseInOut]) {
                imageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
            
        default:
            Task {
                imageView.transform = CGAffineTransform(scaleX: recognizer.scale, y: recognizer.scale)
            }
        }
    }
    
    @objc func doubleTapped(_ recognizer: UITapGestureRecognizer) {
        guard let imageView = recognizer.view as? UIImageView else { return }
        print(#function)
       
        let scale: CGFloat = imageView.transform.a == 1.0 ? 2.0 : 1.0
        UIView.animate(withDuration: 0.3) {
            imageView.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
}
