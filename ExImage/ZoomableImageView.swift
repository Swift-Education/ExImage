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
        
        registToZoomHandler()
    }
    
    init(zoomHandler: ImageZoomHandler = .init(), image: UIImage?) {
        self.zoomHandler = zoomHandler
        super.init(image: image)
        
        registToZoomHandler()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func registToZoomHandler() {
        zoomHandler.regist(with: self)
    }
}
