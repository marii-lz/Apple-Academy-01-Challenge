//
//  Resultado1.swift
//  01-app
//
//  Created by Marília Luz dos Santos on 20/05/24.
//

import SwiftUI

struct Resultado1 : View {
    
    @Binding var apertou: Int
    
    @State var botaoInicio = false
    
    var body: some View {
        
        VStack {
            Image(ImageResource.ruimPig)
            
            Text("Pouxa! Essa compra não valia a pena, mais atenção na próxima vez")
                .multilineTextAlignment(.center)
                .foregroundStyle(.verdeEscuro)
                .font(.system(size: 18))
                .bold()
                .padding(.leading, 32.0)
                .padding(.trailing, 32.0)
                .padding(.bottom, 20.0)
                .padding(.top, 48)
            
            Button (action: {
                apertou = 0
            }, label: {
                VStack{
                    if botaoInicio {
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
    Resultado1(apertou: .constant(1))
}
