//
//  GenericMediaView.swift
//  
//
//  Created by Lennart Fischer on 12.10.21.
//

import SwiftUI
import Nuke
import NukeUI

public struct GenericMediaView: View {
    
    private let origin: Origin
    private var remoteSource: ImageRequestConvertible?
    private var localImage: SwiftUI.Image?
    private var resizingMode: ImageResizingMode
    private var label: String?
    
    public init(
        source: ImageRequestConvertible?,
        label: String? = nil,
        resizingMode: ImageResizingMode = .aspectFit
    ) {
        self.origin = .remote
        self.remoteSource = source
        self.localImage = nil
        self.label = label
        self.resizingMode = resizingMode
    }
    
    public init(
        media: Media?,
        resizingMode: ImageResizingMode = .aspectFit
    ) {
        self.origin = .remote
        self.remoteSource = media?.fullURL
        self.localImage = nil
        self.resizingMode = resizingMode
        self.label = media?.alt
    }
    
    public init(
        image: SwiftUI.Image
    ) {
        self.origin = .local
        self.remoteSource = nil
        self.localImage = image
        self.resizingMode = .aspectFill
        self.label = nil
    }
    
//    public init(
//        displayable: MediaImageDisplayable,
//        resizingMode: ImageResizingMode = .aspectFit,
//        width: CGFloat = 600
//    ) {
//        let image = displayable.data(width: width)
//        
//        switch image {
//            case .local(let image):
//                self.origin = .local
//                self.localImage = Image(uiImage: image)
//            case .remote(let request):
//                self.origin = .remote
//                self.remoteSource = request
//        }
//        
//        self.resizingMode = resizingMode
//    }
    
    public var body: some View {
        
        if let localImage = localImage {
            
            if resizingMode == .aspectFit {
                
                localImage
                    .resizable()
                    .scaledToFit()
                
            } else {
                
                localImage
                    .resizable()
                    .scaledToFill()
                
            }
            
        } else {
            
            LazyImage(source: remoteSource) { (state: LazyImageState) in
                
                if let image = state.image {
                    
                    image
                    #if os(iOS)
                        .resizingMode(resizingMode)
                    #endif
                        .accessibilityLabel(label ?? "")
                        .accessibilityHidden(label == nil)
                    
                } else if let error = state.error {
                    
                    if let error = error as? Nuke.ImagePipeline.Error {
                        errorLabel(text: error.description)
                    } else {
                        errorLabel(text: error.localizedDescription)
                    }
                    
                } else {
                    
                    loadingIndicator()
                    
                }
                
            }
            .pipeline(.shared)
            
        }
        
    }
    
    @ViewBuilder
    func loadingIndicator() -> some View {
        
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
        
    }
    
    @ViewBuilder
    func errorLabel(text: String) -> some View {
        
        Text(text)
            .multilineTextAlignment(.center)
            .font(.footnote)
            .frame(maxWidth: 250)
        
    }
    
    private enum Origin {
        case local
        case remote
    }
    
}
