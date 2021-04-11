//
//  MediaImageView.swift
//  
//
//  Created by Lennart Fischer on 15.01.21.
//

import SwiftUI
import Nuke

/// *Option 1*: Load image only when view appeared so that we only load it if the final width is known.
/// *Option 2*: Filter out all non layout values (`10`) via "binding".

/// We need to know the frame -> at least the width!
///

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
            .accessibilityLabel(Text(displayable.accessibilityLabel() ?? ""))
        
//        SingleAxisGeometryReader { width in
//
////            return Text("\(width)")
////                .onAppear {
////
//////                    print(width)
////                }
//
//            image(width: width)
//                .accessibilityLabel(Text(displayable.accessibilityLabel() ?? ""))
//                .onAppear { print(width) }
//
//
//
//        }
    }
    
    @ViewBuilder
    private func image(width: CGFloat) -> some View {
        
        Text("\(width)")
            .onAppear {
                print(width)
            }
        
        // Use this weird fix to only load the image when the geometry reader read the right width.
//        if width != 10 {
//
//            Text("\(width)")
//                .onAppear {
//                    print(width)
//                }
//
//        } else {
//            EmptyView()
//        }
        
    }
    
    @ViewBuilder
    private var imageView: some View {
        
//            Text("Test")
        
//        SingleAxisGeometryReader(
        
        
//            switch displayable.data(width: width,
//                                    height: geo.size.height) {
                
        let width: CGFloat = 100 //geo.size.width
        let height: CGFloat = 100 // sizingMode.calculateHeight(with: geo.size.width)
        
         
                switch displayable.data(width: 100) {

                case MediaImageDataType.local(let image):

                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .conditionalModifier(
                            sizingMode == SizingMode.original,
                            ifTrue: {
                                $0.aspectRatio(sizingMode.imageRatio, contentMode: .fit)
                            },
                            ifFalse: { $0 })
                        .frame(
                            width: width,
                            height: height,
                            alignment: .center)
                        .clipped()

                case MediaImageDataType.remote(let request):

                    RemoteImage(request: request)
                        .scaledToFill()
                        .conditionalModifier(
                            sizingMode == SizingMode.original,
                            ifTrue: {
                                $0.aspectRatio(sizingMode.imageRatio, contentMode: .fit)
                            },
                            ifFalse: { $0 })
                        .frame(
                            width: width,
                            height: height,
                            alignment: .center)
                        .clipped()

            }
            
    }
        
}

public extension MediaImageView {
    
    enum SizingMode: Equatable {
        
        case original
        case aspectRatio(width: CGFloat, height: CGFloat)
        
        public var imageRatio: CGFloat? {
            switch self {
                case .original:
                    return nil
                case .aspectRatio(let width, let height):
                    return height / width
            }
        }
        
        public func calculateHeight(with width: CGFloat) -> CGFloat? {
            if let ratio = self.imageRatio {
                return width * ratio
            } else {
                return nil
            }
//            PlatformImage().
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
                MediaImageView(displayable: localImage,
                               sizingMode: .aspectRatio(width: 2, height: 1))
                    .padding()
                Text("Test")
            }
            .previewDisplayName("Local Image Aspect Ratio")
            
            VStack {
                MediaImageView(displayable: localImage,
                               sizingMode: .original)
                    .padding()
                
                Text("Test")
            }
            .previewDisplayName("Local Image Original")
            
        }
        
    }
    
}
