//
//  Resultado3.swift
//  01-app
//
//  Created by Marília Luz dos Santos on 20/05/24.
//

import SwiftUI

struct Resultado3 : View {
    
    @Binding var apertou: Int
    
    @State var botaoInicio3 = false
    
    var tocouRefazer: () -> Void
    
    var body: some View {
        
        VStack {
            Image(ImageResource.bomPig)
            
            Text("Parabéns! Você sabe mesmo economizar!")
                .multilineTextAlignment(.center)
                .foregroundStyle(.verdeEscuro)
                .font(.system(size: 18))
                .bold()
                .padding(.leading, 48.0)
                .padding(.trailing, 48.0)
                .padding(.bottom, 20.0)
                .padding(.top, 48)
            
            Button (action: {
                apertou = 0
                tocouRefazer()

            }, label: {
                VStack{
                    if botaoInicio3 {
                        Image(ImageResource.inicioBtVerde)
                    } else {
                        Image(ImageResource.inicioBt)
                    }
                }
            })
            
        }
    }
}
#Preview{
    Resultado3(apertou: .constant(1), tocouRefazer: {})
}
