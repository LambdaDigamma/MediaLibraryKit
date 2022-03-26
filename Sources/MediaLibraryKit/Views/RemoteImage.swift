//
//  RemoteImage.swift
//  
//
//  Created by Lennart Fischer on 06.02.21.
//

import SwiftUI
import Nuke

public struct RemoteImage: View {
    
    @ObservedObject var fetchImage = Nuke.FetchImage()
    
    let request: ImageRequestConvertible
    
    public init(request: ImageRequestConvertible) {
        self.request = request
//        fetchImage = FetchImage(request: request.asImageRequest())
    }
    
    public var body: some View {
        
        
//        Image("placeholder", bundle: .module)
//            .resizable()
//            .aspectRatio(contentMode: .fill)

        fetchImage.view?
//            .frame(width: 100, height: 100)
//            .resizable()
//            .aspectRatio(contentMode: .fill)
            // Cancel and restart the request during scrolling
            // If the view is still on screen, use `cancel()` instead of `reset()`.
//            .onAppear {
//                print("jkfasdjklf")
////                    withoutAnimation {
//                fetchImage.load(request.asImageRequest())
////                    }
//            }
//                .onDisappear {
//                    fetchImage.reset()
//                }
            .animation(.default) // (Optional) Animate image appearance
        
        
//        ZStack {
//            Rectangle().fill(Color.gray)
            
                
//            fetchImage.view?
//                .resizable()
////                .aspectRatio(contentMode: .fill)
//                // Cancel and restart the request during scrolling
//                // If the view is still on screen, use `cancel()` instead of `reset()`.
//                .onAppear {
////                    withoutAnimation {
//                        fetchImage.load(request.asImageRequest())
////                    }
//                }
////                .onDisappear {
////                    fetchImage.reset()
////                }
//                .animation(.default) // (Optional) Animate image appearance
//        }
        
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
                    .frame(maxWidth: 400, minHeight: 400, alignment: .center)
                    .background(Color.red)
                
            } else {
                EmptyView()
            }
            
        }
        
        
        
    }
    
}
