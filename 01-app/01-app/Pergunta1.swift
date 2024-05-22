//
//  Pergunta1.swift
//  01-app
//
//  Created by Marília Luz dos Santos on 16/05/24.
//

import SwiftUI

struct Pergunta1 : View {
    
    @Binding var apertou: Int
    
    // botao = 0 -> dois desativados
    // botao = 1 -> sim ativado
    // botao = 2 -> nao ativado
    @Binding var botao: [Int]
    
    @Binding var colors: [Color]
    
    var body: some View {
        
        VStack {
            Text("Eu já tenho algo igual ou similar?")
                .multilineTextAlignment(.center)
                .foregroundStyle(.verdeEscuro)
                .font(.medium3)
                .padding(.leading, 36.0)
                .padding(.trailing, 36.0)
                .padding(.bottom, 20.0)
                .padding(.top, 72)

            HStack {
                
                Button (action: {
                    if (botao[0] != 1) {
                        botao[0] = 1
                    } else {
                        botao[0] = 0
                    }
                    
                    withAnimation{
                        if apertou <= 8 {
                            colors[apertou-1] = .cinzaClaro
                            colors[apertou] = .black
                            apertou += 1
                        }
                    }
                
                    
                    
                }, label: {
                    
                    HStack{
                        if botao[0] == 1 {
                            Image(ImageResource.simBtVerde)
                            
                        } else {
                            Image(ImageResource.simBt)
                        }
                    }
                })
                
                Button (action: {
                    if (botao[0] != 2) {
                        botao[0] = 2
                    } else {
                        botao[0] = 0
                    }
                    
                    withAnimation{
                        if apertou <= 8 {
                            colors[apertou-1] = .cinzaClaro
                            colors[apertou] = .black
                            apertou += 1
                        }
                    }
                
                    
                }, label: {
                    
                    HStack{
                        if botao[0] == 2 {
                            Image(ImageResource.naoBtVerde)
                        } else {
                            Image(ImageResource.naoBt)
                        }
                    }
                }).padding(.leading, 12)
            }
            
            Spacer()
            
            Button (action: {
                
                apertou = 0
                
            }, label: {
                Text("VOLTAR")
                    .foregroundStyle(.pretoAzul)
                    .font(.semibold2)
                    .padding(.top, 64)
                    .padding(.bottom, 16)
            })
            
            PageControl(apertou: $apertou, colors: $colors)
                .padding(.bottom, 48)
            
//            Image(ImageResource.pageControl1)
//
            
        }.ignoresSafeArea()
            //.frame(width: 345, height: 562)
            
        
    }
}
#Preview {
    Pergunta1(apertou: .constant(1), botao: .constant([0,0,0,0,0,0,0,0]), colors: .constant([.black, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro]))
}
