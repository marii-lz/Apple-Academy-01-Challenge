//
//  Pergunta3.swift
//  01-app
//
//  Created by Marília Luz dos Santos on 16/05/24.
//

import SwiftUI

struct Pergunta3 : View {
    @Binding var apertou: Int
    @State var botaoSim3 = false
    @State var botaoNao3 = false
    
    var body: some View {
        
        VStack {
            Text("Esse produto resolve uma necessidade minha?")
                .multilineTextAlignment(.center)
                .foregroundStyle(.verdeEscuro)
                .font(.system(size: 22))
                .bold()
                .padding(.leading, 32.0)
                .padding(.trailing, 32.0)
                .padding(.bottom, 20.0)

            HStack {
                
                Button (action: {botaoSim3 = !botaoSim3
                    apertou += 1}, label: {
                    
                    HStack{
                        if botaoSim3 {
                            Image(ImageResource.simBtVerde)
                            
                        } else {
                            Image(ImageResource.simBt)
                        }
                    }
                })
                
                Button (action: {botaoNao3 = !botaoNao3}, label: {
                    
                    HStack{
                        if botaoNao3 {
                            Image(ImageResource.naoBtVerde)
                        } else {
                            Image(ImageResource.naoBt)
                        }
                    }
                }).padding(.leading, 12)
            }
            
        }.frame(width: 345, height: 562)
        
    }
}
//#Preview {
//    Pergunta3()
//}
//

