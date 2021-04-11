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
    
    @StateObject var fetchImage = FetchImage()
    
    let request: ImageRequestConvertible
    
    public init(request: ImageRequestConvertible) {
        self.request = request
//        fetchImage = FetchImage(request: request.asImageRequest())
    }
    
    public var body: some View {
        ZStack {
            Rectangle().fill(Color.gray)
            Image("placeholder")
            fetchImage.view?
                .resizable()
//                .aspectRatio(contentMode: .fill)
                // Cancel and restart the request during scrolling
                // If the view is still on screen, use `cancel()` instead of `reset()`.
                .onAppear {
//                    withoutAnimation {
                        fetchImage.load(request.asImageRequest())
//                    }
                }
//                .onDisappear {
//                    fetchImage.reset()
//                }
                .animation(.default) // (Optional) Animate image appearance
        }
        
    }
    
    private func withoutAnimation(_ closure: () -> Void) {
        var transaction = Transaction(animation: nil)
        transaction.disablesAnimations = true
        withTransaction(transaction, closure)
    }
    
}

struct RemoteImage_Previews: PreviewProvider {
    
    static var previews: some View {
        
        VStack {
            
            Text("Needs to be run.")
            
            if let url = URL(string: "https://moers-festival.de/media/c1b3af14a07376c852933cd8bc8c94f5/festival21.jpg") {
                
//                Text("Fdaskfdas")
                
                RemoteImage(request: url)
                    .frame(maxWidth: .infinity, maxHeight: 400, alignment: .leading)
                
            } else {
                EmptyView()
            }
            
        }
        
        
        
    }
    
}
