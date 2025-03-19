//
//  GenericMediaView.swift
//  
//
//  Created by Lennart Fischer on 12.10.21.
//

import SwiftUI
import Nuke
import NukeUI

public extension URL {
    
    init?(string: String?) {
        if let string {
            self.init(string: string)
        } else {
            return nil
        }
    }
    
}

public enum ImageResizingMode {
    case aspectFit
    case aspectFill
}

public struct GenericMediaView: View {
    
    private let origin: Origin
    private var remoteSource: ImageRequest?
    private var localImage: SwiftUI.Image?
    private var resizingMode: ImageResizingMode
    private var label: String?
    
    public init(
        source: ImageRequest?,
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
        self.remoteSource = ImageRequest(stringLiteral: media?.fullURL ?? "")
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
            
            LazyImage(request: remoteSource) { (state: any LazyImageState) in
                
                if let image = state.image {
                    
                    image
                    #if os(iOS)
                        .resizable()
                        .aspectRatio(contentMode: resizingMode == .aspectFit ? .fit : .fill)
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
            .frame(minWidth: 200)
            .padding()
            .onAppear {
                print("Error loading image", text, String(describing: remoteSource))
            }
        
    }
    
    private enum Origin {
        case local
        case remote
    }
    
}
