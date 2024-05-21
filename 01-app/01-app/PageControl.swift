//
//  PageControl.swift
//  01-app
//
//  Created by Marília Luz dos Santos on 17/05/24.
//

import SwiftUI

struct PageControl: View {
    
    @Binding var apertou: Int
    @Binding var colors: [Color]
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 8)
                .foregroundStyle(colors[0])
                .animation(.easeInOut, value: apertou)
            Circle()
                .frame(width: 8)
                .foregroundStyle(colors[1])
                .animation(.easeInOut, value: apertou)
            Circle()
                .frame(width: 8)
                .foregroundStyle(colors[2])
                .animation(.easeInOut, value: apertou)
            Circle()
                .frame(width: 8)
                .foregroundStyle(colors[3])
                .animation(.easeInOut, value: apertou)
            Circle()
                .frame(width: 8)
                .foregroundStyle(colors[4])
                .animation(.easeInOut, value: apertou)
            Circle()
                .frame(width: 8)
                .foregroundStyle(colors[5])
                .animation(.easeInOut, value: apertou)
            Circle()
                .frame(width: 8)
                .foregroundStyle(colors[6])
                .animation(.easeInOut, value: apertou)
            Circle()
                .frame(width: 8)
                .foregroundStyle(colors[7])
                .animation(.easeInOut, value: apertou)
        }
    }
}





