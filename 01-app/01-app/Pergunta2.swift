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
    
    @Binding var colors: [Color]
    
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
                .padding(.top, 72)

            HStack {
                
                Button (action: {botaoSim2 = !botaoSim2
                    
                    
                    if apertou <= 5 {
                        colors[apertou-1] = .gray
                        colors[apertou] = .black
                        apertou += 1
                    }
                    
                }, label: {
                    
                    HStack{
                        if botaoSim2 {
                            Image(ImageResource.simBtVerde)
                            
                        } else {
                            Image(ImageResource.simBt)
                        }
                    }
                })
                
                Button (action: {botaoNao2 = !botaoNao2
                    
                    if apertou <= 5 {
                        colors[apertou-1] = .gray
                        colors[apertou] = .black
                        apertou += 1
                    }
                    
                }, label: {
                    
                    HStack{
                        if botaoNao2 {
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
            
//            Image(ImageResource.pageControl1)
               // .padding(.bottom, 48)
            
        }.ignoresSafeArea()
            //.frame(width: 345, height: 562)
        
    }
}
#Preview {
    Pergunta2(apertou: .constant(1), colors: .constant([.black, .gray, .gray, .gray, .gray]))
}

