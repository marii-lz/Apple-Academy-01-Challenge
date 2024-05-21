//
//  Pergunta5.swift
//  01-app
//
//  Created by Marília Luz dos Santos on 17/05/24.
//

import SwiftUI

struct Pergunta5 : View {
    @Binding var apertou: Int
    @Binding var botao: [Int]
    // botao = 0 -> 3 desativados
    // botao = 1 -> dias
    // botao = 2 -> meses
    // botao = 3 -> anos
    
    @Binding var colors: [Color]
    
    var body: some View {
        
        VStack {
            Text("Quanto tempo esse produto vai durar?")
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
                    if (botao[4] != 1) {
                        botao[4] = 1
                    } else {
                        botao[4] = 0
                    }
                    apertou += 1
                }, label: {
                    
                    HStack{
                        if botao[4] == 1 {
                            Image(ImageResource.diasBtVerde)
                            
                        } else {
                            Image(ImageResource.diasBt)
                        }
                    }
                })
                
                Button (action: {
                    if (botao[4] != 2) {
                        botao[4] = 2
                    } else {
                        botao[4] = 0
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
                        if botao[4] == 2 {
                            Image(ImageResource.mesesBtVerde)
                        } else {
                            Image(ImageResource.mesesBt)
                        }
                    }
                }.padding(.leading, 8)
                
                Button (action: {
                    if (botao[4] != 3) {
                        botao[4] = 3
                    } else {
                        botao[4] = 0
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
                        if botao[4] == 3 {
                            Image(ImageResource.anosBtVerde)
                            
                        } else {
                            Image(ImageResource.anosBt)
                        }
                    }
                }).padding(.leading, 8)
            }
            
            Spacer()
            
            Button (action: {
                
                withAnimation{
                    if apertou > 1 && apertou <= 8 {
                        colors[apertou-1] = .cinzaClaro
                        colors[apertou-2] = .black
                        apertou -= 1
                        botao[3] = 0
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
    Pergunta5(apertou: .constant(1), botao: .constant([0,0,0,0,0,0,0,0]), colors: .constant([.black, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro]))
}

