//
//  ImageView.swift
//  
//
//  Created by Lennart Fischer on 11.04.21.
//

import SwiftUI
import Nuke

struct ImageView: View {
    
    let request: ImageRequestConvertible
    
    @StateObject private var image = Nuke.FetchImage()
    
    var body: some View {
        VStack {
            image.view?
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
        }
        .onAppear { image.load(request.asImageRequest()) }
        .onDisappear(perform: image.reset)
    }
}

struct ImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        ImageView(request: URL(string: "https://images.unsplash.com/photo-1548335599-8ed902028f3f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80")!)
    }
    
}
