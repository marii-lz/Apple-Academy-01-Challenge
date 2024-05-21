//
//  Pergunta6.swift
//  01-app
//
//  Created by Marília Luz dos Santos on 21/05/24.
//

import SwiftUI

struct Pergunta6 : View {
    @Binding var apertou: Int
    @Binding var botao: [Int]
    
    @Binding var colors: [Color]
    
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
                .padding(.top, 72)

            HStack {
                
                Button (action: {
                    if (botao[5] != 1) {
                        botao[5] = 1
                    } else {
                        botao[5] = 0
                    }
                    
                    withAnimation{
                        if apertou <= 8 {
                            colors[apertou-1] = .cinzaClaro
                            colors[apertou] = .black
                            apertou += 1
                        }
                    }
                    
                }) {
                    
                    HStack{
                        if botao[5] == 1 {
                            Image(ImageResource.simBtVerde)
                            
                        } else {
                            Image(ImageResource.simBt)
                        }
                    }
                }
                
                Button (action: {
                    if (botao[5] != 2) {
                        botao[5] = 2
                    } else {
                        botao[5] = 0
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
                        if botao[5] == 2 {
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
                        colors[apertou-1] = .cinzaClaro
                        colors[apertou-2] = .black
                        apertou -= 1
                        botao[4] = 0
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
    Pergunta6(apertou: .constant(1), botao: .constant([0,0,0,0,0,0,0,0]), colors: .constant([.black, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro]))
}
