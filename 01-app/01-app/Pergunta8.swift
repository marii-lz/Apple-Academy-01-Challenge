//
//  Pergunta8.swift
//  01-app
//
//  Created by Marília Luz dos Santos on 21/05/24.
//

import SwiftUI

struct Pergunta8 : View {
    @Binding var apertou: Int
    
    @Binding var botao: [Int]
    
    @Binding var colors: [Color]
    
    @Binding var resultado: Double
    
    var body: some View {
        
        VStack {
            Text("Trará retorno financeiro/produtivo/satisfação pessoal?")
                .multilineTextAlignment(.center)
                .foregroundStyle(.verdeEscuro)
                .font(.system(size: 22))
                .bold()
                .padding(.leading, 32.0)
                .padding(.trailing, 32.0)
                .padding(.bottom, 20.0)
                .padding(.top, 72)
            
            HStack {
                
                Button (action: {  //SIM
                    if (botao[7] != 1) {
                        botao[7] = 1
                    } else {
                        botao[7] = 0
                    }
                    
                    pontuar()
                    
                    withAnimation{
                        if apertou <= 8 {
                            colors[apertou-1] = .cinzaClaro
                            colors[apertou] = .black
                            apertou += 1
                        }
                    }
                    
                    //lógica de pontuação
                    
                    
                    
                }) {
                    
                    HStack{
                        if botao[7] == 1 {
                            Image(ImageResource.simBtVerde)
                            
                        } else {
                            Image(ImageResource.simBt)
                        }
                    }
                }
                
                Button (action: {  //NAO
                    if (botao[7] != 2) {
                        botao[7] = 2
                    } else {
                        botao[7] = 0
                    }
                    
                    pontuar()
                    
                    withAnimation{
                        if apertou <= 8 {
                            colors[apertou-1] = .cinzaClaro
                            colors[apertou] = .black
                            apertou += 1
                        }
                    }
                    
                }, label: {
                    
                    HStack{
                        if botao[7] == 2 {
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
                        botao[6] = 0
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
    
    func pontuar() {
        
        
        if botao[0] == 1 {
            resultado += 1.5
        } else {
            resultado += 12.5
        }
        
        if botao[1] == 1 {
            resultado += 12.5
        } else {
            resultado += 1.5
        }
        
        if botao[2] == 1 {
            resultado += 1.5
        } else {
            resultado += 12.5
        }
        
        if botao[3] == 1 {
            resultado += 12.5
        } else {
            resultado += 3.5
        }
        
        if botao[4] == 1 {
            resultado += 1.5
        } else if botao[4] == 2 {
            resultado += 6.5
        } else {
            resultado += 12.5
        }
        
        if botao[5] == 1 {
            resultado += 12.5
        } else {
            resultado += 0.5
        }
        
        if botao[6] == 2 {
            resultado += 12.5
        }
        
        if botao[7] == 1 {
            resultado += 12.5
            
        }
    }
}
#Preview {
    Pergunta8(apertou: .constant(1), botao: .constant([0,0,0,0,0,0,0,0]), colors: .constant([.black, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro]), resultado: .constant(0.0))
}
