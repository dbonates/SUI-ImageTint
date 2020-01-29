//
//  Image+.swift
//  SUI-ImageTint
//
//  Created by Daniel Bonates on 29/01/20.
//  Copyright © 2020 Daniel Bonates. All rights reserved.
//

import SwiftUI

extension Image {
    
    public init() {
       self.init("")
    }
    
    static func tinted(_ named: String, with color: UIColor)  -> Image {
        
        guard let uiImage = UIImage(named: named)?.tinted(with: color)
            else { fatalError("Unable to load logo image")}
        
        return Image(uiImage: uiImage.withRenderingMode(.alwaysOriginal))
    }
}


extension UIImage {

    public func tinted(with fillColor: UIColor) -> UIImage {

        guard let img = self.cgImage else {
            return UIImage()
        }

        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)

        let context = UIGraphicsGetCurrentContext()
        fillColor.setFill()

        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)

        context?.setBlendMode(CGBlendMode.colorBurn)
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context?.draw(img, in: rect)

        context?.setBlendMode(CGBlendMode.sourceIn)
        context?.addRect(rect)
        context?.drawPath(using: CGPathDrawingMode.fill)

        guard let imageFromContext = UIGraphicsGetImageFromCurrentImageContext() else {
            return UIImage()
        }
        let coloredImg: UIImage = imageFromContext
        UIGraphicsEndImageContext()

        return coloredImg
    }
}
