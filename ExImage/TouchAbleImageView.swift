//
//  TouchAbleImageView.swift
//  ExImage
//
//  Created by 강동영 on 4/23/25.
//

import UIKit

@MainActor
class TouchAbleImageView: UIImageView {
    private let touchManager: TouchManager
    
    init(touchManager: TouchManager = .init(), frame: CGRect) {
        self.touchManager = touchManager
        super.init(frame: frame)
        
        defaultConfig()
    }
    
    init(touchManager: TouchManager = .init(), image: UIImage?) {
        self.touchManager = touchManager
        super.init(image: image)
        
        defaultConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func defaultConfig() {
        let pinchGesture = UIPinchGestureRecognizer(target: touchManager, action: #selector(touchManager.pinched(_:)))
        let tapGesture = UITapGestureRecognizer(target: touchManager, action: #selector(touchManager.doubleTapped(_:)))
        tapGesture.numberOfTapsRequired = 2
        addGestureRecognizer(tapGesture)
        addGestureRecognizer(pinchGesture)
        
        
        isUserInteractionEnabled = true
    }
}
