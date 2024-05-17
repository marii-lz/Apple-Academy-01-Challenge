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
    
    @Binding var colors: [Color]
    
    var body: some View {
        
        VStack {
            Text("Eu já tenho algo igual ou similar?")
                .multilineTextAlignment(.center)
                .foregroundStyle(.verdeEscuro)
                .font(.system(size: 22))
                .bold()
                .padding(.leading, 36.0)
                .padding(.trailing, 36.0)
                .padding(.bottom, 20.0)
                .padding(.top, 72)

            HStack {
                
                Button (action: {
                    botaoSim = !botaoSim
                    
                    if apertou <= 5 {
                        colors[apertou-1] = .gray
                        colors[apertou] = .black
                        apertou += 1
                    }
                    
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
                    
                    if apertou <= 5 {
                        colors[apertou-1] = .gray
                        colors[apertou] = .black
                        apertou += 1
                    }
                    
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
            
            PageControl(apertou: $apertou, colors: $colors)
                .padding(.bottom, 48)
            
//            Image(ImageResource.pageControl1)
//
            
        }.ignoresSafeArea()
            //.frame(width: 345, height: 562)
            
        
    }
}
#Preview {
    Pergunta1(apertou: .constant(1), colors: .constant([.black, .gray, .gray, .gray, .gray]))
}
