//
//  RemoteImage.swift
//  
//
//  Created by Lennart Fischer on 06.02.21.
//

import SwiftUI
import FetchImage
import Nuke

public struct RemoteImage: View {
    
    @ObservedObject var fetchImage: FetchImage
    
    public init(request: ImageRequestConvertible) {
        fetchImage = FetchImage(request: request.asImageRequest())
    }
    
    public var body: some View {
        fetchImage.view?
            .resizable()
            // Cancel and restart the request during scrolling
            // If the view is still on screen, use `cancel()` instead of `reset()`.
            .onAppear(perform: fetchImage.fetch)
            .onDisappear(perform: fetchImage.reset)
            .animation(.default) // (Optional) Animate image appearance
    }
    
}
