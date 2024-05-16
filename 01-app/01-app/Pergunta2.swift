//
//  Pergunta2.swift
//  01-app
//
//  Created by Marília Luz dos Santos on 16/05/24.
//

import SwiftUI

struct Pergunta2 : View {
    @Binding var apertou: Int
    @State var botaoSim2 = false
    @State var botaoNao2 = false
    
    var body: some View {
        
        VStack {
            Text("Eu já avaliei as reviews do produto e da loja?")
                .multilineTextAlignment(.center)
                .foregroundStyle(.verdeEscuro)
                .font(.system(size: 22))
                .bold()
                .padding(.leading, 32.0)
                .padding(.trailing, 32.0)
                .padding(.bottom, 20.0)

            HStack {
                
                Button (action: {botaoSim2 = !botaoSim2
                    apertou += 1}, label: {
                    
                    HStack{
                        if botaoSim2 {
                            Image(ImageResource.simBtVerde)
                            
                        } else {
                            Image(ImageResource.simBt)
                        }
                    }
                })
                
                Button (action: {botaoNao2 = !botaoNao2
                    apertou += 1}, label: {
                    
                    HStack{
                        if botaoNao2 {
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
//    Pergunta2()
//}

