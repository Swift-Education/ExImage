//
//  ZoomableImageView.swift
//  ExImage
//
//  Created by 강동영 on 4/23/25.
//

import UIKit

@MainActor
class ZoomableImageView: UIImageView {
    private let zoomHandler: ImageZoomHandler
    
    init(zoomHandler: ImageZoomHandler = .init(), frame: CGRect) {
        self.zoomHandler = zoomHandler
        super.init(frame: frame)
        
        defaultConfig()
    }
    
    init(zoomHandler: ImageZoomHandler = .init(), image: UIImage?) {
        self.zoomHandler = zoomHandler
        super.init(image: image)
        
        defaultConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func defaultConfig() {
        let pinchGesture = UIPinchGestureRecognizer(target: zoomHandler, action: #selector(zoomHandler.pinched(_:)))
        let tapGesture = UITapGestureRecognizer(target: zoomHandler, action: #selector(zoomHandler.doubleTapped(_:)))
        tapGesture.numberOfTapsRequired = 2
        addGestureRecognizer(tapGesture)
        addGestureRecognizer(pinchGesture)
        
        
        isUserInteractionEnabled = true
    }
}
