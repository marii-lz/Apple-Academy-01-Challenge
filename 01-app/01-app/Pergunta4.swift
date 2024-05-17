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
            Text("Trará retorno financeiro/produtivo/satisfação pessoal?")
                .multilineTextAlignment(.center)
                .foregroundStyle(.verdeEscuro)
                .font(.system(size: 22))
                .bold()
                .padding(.leading, 28.0)
                .padding(.trailing, 28.0)
                .padding(.bottom, 20.0)
                .padding(.top, 72)

            HStack {
                
                Button (action: {
                    botaoSim4 = !botaoSim4
                    
                    if apertou <= 5 {
                        colors[apertou-1] = .gray
                        colors[apertou] = .black
                        apertou += 1
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
                    if apertou <= 5 {
                        colors[apertou-1] = .gray
                        colors[apertou] = .black
                        apertou += 1
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
                if apertou > 1 && apertou <= 5 {
                    colors[apertou-1] = .gray
                    colors[apertou-2] = .black
                    apertou -= 1
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
    Pergunta4(apertou: .constant(1), colors: .constant([.black, .gray, .gray, .gray, .gray]))
}
