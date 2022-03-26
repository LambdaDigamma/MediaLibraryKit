//
//  MediaImageViewRepresentable.swift
//  
//
//  Created by Lennart Fischer on 11.04.21.
//

#if canImport(UIKit)

import UIKit
import SwiftUI

struct MediaImageViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        
//        let label = UILabel()
//        label.text = "fasfjalksfd"
//        return label
        
        let imageView = UIImageView(image: UIImage(named: "placeholder"))
//        imageView.image = UIImage(named: "placeholder")
        imageView.backgroundColor = .blue
//        imageView.translatesAutoresizingMaskIntoConstraints = false

//        imageView.
        
//        imageView.setContentHuggingPriority(.required, for: .horizontal)
//        imageView.setContentHuggingPriority(., for: <#T##NSLayoutConstraint.Axis#>)
        
        let constraints = [
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1),
//            imageView.widthAnchor.constraint(equalToConstant: 100)
        ]

        NSLayoutConstraint.activate(constraints)

//        imageView
//        imageView.
//        let label = UILabel()
//        label.text = "kfladskfjlasdf"
//        return label

        return imageView
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}

struct MediaImageViewRepresentable_Previews: PreviewProvider {
    
    static var previews: some View {
        MediaImageViewRepresentable()
//            .frame(maxWidth: .infinity, maxHeight: 100)
    }
    
}

#endif
