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
    public let sizingMode: SizingMode
    
    public init(displayable: MediaImageDisplayable,
                sizingMode: SizingMode = .original) {
        self.displayable = displayable
        self.sizingMode = sizingMode
    }
    
    public var body: some View {
        
        imageView
//            .aspectRatio(contentMode: .fill)
            .accessibilityLabel(Text(displayable.accessibilityLabel() ?? ""))
        
//        GeometryReader { geo in
//            ZStack {
//                Rectangle().fill(Color.gray)
//
//                    .aspectRatio(contentMode: .fill)
//            }
//        }
        
    }
    
    @ViewBuilder
    private var imageView: some View {
        
        GeometryReader { geo in
            
            switch displayable.data(width: geo.size.width,
                                    height: geo.size.height) {
                case MediaImageDataType.local(let image):
                    
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
//                        .aspectRatio(contentMode: .fit)
                        
//                        .clipped()
                        .frame(width: geo.size.width, alignment: .center)
//                        .aspectRatio(sizingMode.imageRatio, contentMode: .fit)
                        .aspectRatio(sizingMode.imageRatio, contentMode: .fit)
                        .clipped()
                        
                        
                        
                    Text("\(sizingMode.imageRatio!)")
                    
//                        .frame(maxWidth: .infinity)
//                        .clipped()
                    
                case MediaImageDataType.remote(let request):
                    RemoteImage(request: request)
            }
            
        }
        
    }
    
}

public extension MediaImageView {
    
    enum SizingMode {
        
        case original
        case aspectRatio(width: CGFloat, height: CGFloat)
        
        public var imageRatio: CGFloat? {
            switch self {
                case .original:
                    return nil
                case .aspectRatio(let width, let height):
                    return width / height
            }
        }
        
    }
    
}

struct MediaImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let localImage = LocalMediaImage(
            image: PlatformImage(
                named: "placeholder",
                in: .module,
                compatibleWith: nil
            )!
        )
        
        return Group {
            
            VStack {
                MediaImageView(displayable: localImage, sizingMode: .aspectRatio(width: 2, height: 1))
                    .padding()
            }
            .previewDisplayName("Local Image")
//            .previewLayout(.fixed(width: 160 * 3, height: 90 * 6))
            
            
        }
        
        
        
//            .aspectRatio(CGSize(width: 16, height: 9), contentMode: .fit)
//            .frame(maxWidth: .infinity)
//            .frame(width: 80, height: 80)
//            .clipped()
    }
    
}
