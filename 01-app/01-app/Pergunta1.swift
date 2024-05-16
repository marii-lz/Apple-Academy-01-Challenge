//
//  Pergunta1.swift
//  01-app
//
//  Created by Marília Luz dos Santos on 16/05/24.
//

import SwiftUI

struct Pergunta1 : View {
    @Binding var apertou: Int
    @State var botaoSim = false
    @State var botaoNao = false
    
    var body: some View {
        
        VStack {
            Text("Eu já tenho algo igual ou similar?")
                .multilineTextAlignment(.center)
                .foregroundStyle(.verdeEscuro)
                .font(.system(size: 22))
                .bold()
                .padding(.leading, 32.0)
                .padding(.trailing, 32.0)
                .padding(.bottom, 20.0)
                .padding(.top, 72)

            HStack {
                
                Button (action: {
                    botaoSim = !botaoSim
                    apertou += 1
                }, label: {
                    
                    HStack{
                        if botaoSim {
                            Image(ImageResource.simBtVerde)
                            
                        } else {
                            Image(ImageResource.simBt)
                        }
                    }
                })
                
                Button (action: {
                    botaoNao = !botaoNao
                    apertou += 1
                }, label: {
                    
                    HStack{
                        if botaoNao {
                            Image(ImageResource.naoBtVerde)
                        } else {
                            Image(ImageResource.naoBt)
                        }
                    }
                }).padding(.leading, 12)
            }
            
            Spacer()
            
            Button (action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("DESFAZER")
                    .foregroundStyle(.pretoAzul)
                    .font(.system(size: 16))
                    .bold()
                    .padding(.top, 64)
            })
            
            Image(ImageResource.pageControl1)
                .padding(.bottom, 48)
            
        }.frame(width: 345, height: 562)
        
    }
}
#Preview {
    Pergunta1(apertou: .constant(1))
}
