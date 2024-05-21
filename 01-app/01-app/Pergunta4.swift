//
//  Pergunta4.swift
//  01-app
//
//  Created by Marília Luz dos Santos on 17/05/24.
//

import SwiftUI

struct Pergunta4 : View {
    @Binding var apertou: Int
    @State var botaoSim4 = false
    @State var botaoNao4 = false
    
    @Binding var colors: [Color]
    
    var body: some View {
        
        VStack {
            Text("Eu já conferi o histórico")
                .multilineTextAlignment(.center)
                .foregroundStyle(.verdeEscuro)
                .font(.system(size: 22))
                .bold()
                .padding(.top, 48)
            Text("de preços, e agora é o melhor momento para comprar?")
                .multilineTextAlignment(.center)
                .foregroundStyle(.verdeEscuro)
                .font(.system(size: 22))
                .bold()
                .padding(.leading, 32.0)
                .padding(.trailing, 32.0)
                .padding(.bottom, 20.0)

            HStack {
                
                Button (action: {
                    botaoSim4 = !botaoSim4
                    
                    withAnimation{
                        if apertou <= 8 {
                            colors[apertou-1] = .gray
                            colors[apertou] = .black
                            apertou += 1
                        }
                    }
                    
                }) {
                    
                    HStack{
                        if botaoSim4 {
                            Image(ImageResource.simBtVerde)
                            
                        } else {
                            Image(ImageResource.simBt)
                        }
                    }
                }
                
                Button (action: {
                    botaoNao4 = !botaoNao4
                    
                    withAnimation{
                        if apertou <= 8 {
                            colors[apertou-1] = .gray
                            colors[apertou] = .black
                            apertou += 1
                        }
                    }
                    
                }, label: {
                    
                    HStack{
                        if botaoNao4 {
                            Image(ImageResource.naoBtVerde)
                        } else {
                            Image(ImageResource.naoBt)
                        }
                    }
                }).padding(.leading, 12)
            }
            
            Spacer()
            
            Button (action: {
                
                withAnimation{
                    if apertou > 1 && apertou <= 8 {
                        colors[apertou-1] = .gray
                        colors[apertou-2] = .black
                        apertou -= 1
                    }
                }
                
            }, label: {
                Text("DESFAZER")
                    .foregroundStyle(.pretoAzul)
                    .font(.system(size: 16))
                    .bold()
                    .padding(.top, 64)
                    .padding(.bottom, 16)
            })
            
            PageControl(apertou: $apertou, colors: $colors)
                .padding(.bottom, 48)
            
            //Image(ImageResource.pageControl1)
              //  .padding(.bottom, 48)
            
        }.ignoresSafeArea()
            //.frame(width: 345, height: 562)
            
        
    }
}
#Preview {
    Pergunta4(apertou: .constant(1), colors: .constant([.black, .gray, .gray, .gray, .gray, .gray, .gray, .gray, .gray]))
}
