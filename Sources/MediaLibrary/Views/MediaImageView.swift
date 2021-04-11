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
    
    @State var test: [String] = []
    
    public init(displayable: MediaImageDisplayable,
                sizingMode: SizingMode = .original) {
        self.displayable = displayable
        self.sizingMode = sizingMode
    }
    
    public var body: some View {
        
        SingleAxisGeometryReader { width in
            image(width: width)
                .accessibilityLabel(Text(displayable.accessibilityLabel() ?? ""))
        }
        
    }
    
    @ViewBuilder
    private func image(width: CGFloat) -> some View {
        
        switch displayable.data(width: width) {

            case MediaImageDataType.local(let image):

                Image(uiImage: image)
                    .resizable()
                    .conditionalModifier(
                        sizingMode == SizingMode.original,
                        ifTrue: {
                            $0
                                .aspectRatio(contentMode: .fit)
                        },
                        ifFalse: {
                            $0
                                .scaledToFill()
                                .frame(maxWidth: width, maxHeight: sizingMode.calculateHeight(with: width))
//                                .aspectRatio(1, contentMode: .fill)
                                
                        })
                    
                    //                .scaledToFill()
                    //                .conditionalModifier(
                    //                    sizingMode == SizingMode.original,
                    //                    ifTrue: {
                    //                        $0.aspectRatio(sizingMode.imageRatio, contentMode: .fit)
                    //                    },
                    //                    ifFalse: { $0 })

                    //                .frame(
                    //                    width: width,
                    //                    height: height,
                    //                    alignment: .center)
                    .clipped()
                    .onAppear {
                        test.append("\(width)")
                    }

            case MediaImageDataType.remote(let request):

                ImageView(request: request)
            //                        .conditionalModifier(
            //                            sizingMode == SizingMode.original,
            //                            ifTrue: {
            //                                $0
            //                            },
            //                            ifFalse: {
            //                                $0.aspectRatio(sizingMode.imageRatio, contentMode: .fit)
            //                                    .s
            //                            })

            //                    RemoteImage(request: request)
            //                        .scaledToFill()
            //                        .conditionalModifier(
            //                            sizingMode == SizingMode.original,
            //                            ifTrue: {
            //                                $0.aspectRatio(sizingMode.imageRatio, contentMode: .fit)
            //                            },
            //                            ifFalse: { $0 })
            //                        .frame(
            //                            width: width,
            //                            height: height,
            //                            alignment: .center)
            //                        .clipped()

        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        Text("\(test.joined(separator: ", "))")
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
        
        let remoteImage = RemoteMediaImage(
            request: URL(string: "https://images.unsplash.com/photo-1548335599-8ed902028f3f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80")!.asImageRequest(),
            label: "Placeholder"
        )
        
        return Group {
            
            VStack {
                MediaImageView(displayable: localImage,
                               sizingMode: .aspectRatio(width: 16, height: 9))
                    .padding()
            }
            .previewDisplayName("Local Image Aspect Ratio")
            
//            VStack {
//                MediaImageView(displayable: localImage,
//                               sizingMode: .original)
//                    .padding()
//
//                Text("Test")
//            }
//            .previewDisplayName("Local Image Original")
//
//            VStack {
//
//                MediaImageView(displayable: remoteImage)
//
//            }.previewDisplayName("Remote Image Original")
//
//            VStack {
//
//                MediaImageView(displayable: remoteImage, sizingMode: .aspectRatio(width: 2, height: 1))
//
//            }.previewDisplayName("Remote Image Aspect Ratio")
            
        }
        
    }
    
}
