//
//  Pergunta5.swift
//  01-app
//
//  Created by Marília Luz dos Santos on 17/05/24.
//

import SwiftUI

struct Pergunta5 : View {
    @Binding var apertou: Int
    @State var botaoDias = false
    @State var botaoMeses = false
    @State var botaoAnos = false
    
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
                    botaoDias = !botaoDias
                    apertou += 1
                }, label: {
                    
                    HStack{
                        if botaoDias {
                            Image(ImageResource.diasBtVerde)
                            
                        } else {
                            Image(ImageResource.diasBt)
                        }
                    }
                })
                
                Button (action: {
                    botaoMeses = !botaoMeses
                    
                    if apertou <= 5 {
                        colors[apertou-1] = .gray
                        colors[apertou] = .black
                        apertou += 1
                    }
                }) {
                    
                    HStack{
                        if botaoMeses {
                            Image(ImageResource.mesesBtVerde)
                        } else {
                            Image(ImageResource.mesesBt)
                        }
                    }
                }.padding(.leading, 8)
                
                Button (action: {
                    botaoAnos = !botaoAnos
                    if apertou <= 5 {
                        colors[apertou-1] = .gray
                        colors[apertou] = .black
                        apertou += 1
                    }
                }, label: {
                    
                    HStack{
                        if botaoAnos {
                            Image(ImageResource.anosBtVerde)
                            
                        } else {
                            Image(ImageResource.anosBt)
                        }
                    }
                }).padding(.leading, 8)
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
    Pergunta5(apertou: .constant(1), colors: .constant([.black, .gray, .gray, .gray, .gray]))
}

