//
//  MediaImageView.swift
//  
//
//  Created by Lennart Fischer on 15.01.21.
//

import SwiftUI
import Nuke

public struct MediaImageView: View {
    
    public let displayable: MediaImageDisplayable
    
    public init(displayable: MediaImageDisplayable) {
        self.displayable = displayable
    }
    
    public var body: some View {
        
        imageView
            .aspectRatio(contentMode: .fill)
            .accessibilityLabel(Text(displayable.accessibilityLabel() ?? ""))
        
//        GeometryReader { geo in
            
//            ZStack {
//                Rectangle().fill(Color.gray)
//
            
//                fetchImage
//                    .view?
//                    imageView
//                    .aspectRatio(contentMode: .fill)
//                    .accessibilityLabel(Text(displayable.accessibilityLabel() ?? ""))
//            }
        
//        }
        
    }
    
    @ViewBuilder
    private var imageView: some View {
        
        switch displayable.data() {
            case MediaImageDataType.local(let image):
                Image(uiImage: image)
                    .resizable()
                    
            case MediaImageDataType.remote(let request):
                RemoteImage(request: request)
        }
        
    }
    
    
}

struct MediaImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let localImage = LocalImage(
            image: PlatformImage(
                named: "placeholder",
                in: .module,
                compatibleWith: nil
            )!
        )
        
        return Group {
            
            MediaImageView(displayable: localImage)
                .previewDisplayName("Local Image")
                .previewLayout(.fixed(width: 160 * 3, height: 90 * 3))
            
            
        }
        
        
        
//        let url = URL(string: "https://images.unsplash.com/photo-1612543827278-d19245d6a00d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=3200&q=80")!
        
        
//            .aspectRatio(CGSize(width: 16, height: 9), contentMode: .fit)
//            .frame(maxWidth: .infinity)
//            .frame(width: 80, height: 80)
//            .clipped()
    }
}
