//
//  SingleAxisGeometryReader.swift
//  
//
//  Created by Lennart Fischer on 07.02.21.
//

import SwiftUI

struct SingleAxisGeometryReader<Content: View>: View
{
    private struct SizeKey: PreferenceKey
    {
        static var defaultValue: CGFloat { 10 }
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat)
        {
            value = max(value, nextValue())
        }
    }
    
    @State private var size: CGFloat = SizeKey.defaultValue
    
    var axis: Axis = .horizontal
    var alignment: Alignment = .center
    let content: (CGFloat) -> Content
    
    var body: some View {
        content(size)
            .frame(maxWidth:  axis == .horizontal ? .infinity : nil,
                   maxHeight: axis == .vertical   ? .infinity : nil,
                   alignment: alignment)
            .background(GeometryReader { proxy in
                Color.clear.preference(key: SizeKey.self,
                                       value: axis == .horizontal
                                        ? proxy.size.width
                                        : proxy.size.height)
            })
            .onPreferenceChange(SizeKey.self) { size = $0 }
    }
}
