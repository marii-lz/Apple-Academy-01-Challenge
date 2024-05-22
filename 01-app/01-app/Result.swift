//
//  Result.swift
//  01-app
//
//  Created by Marília Luz dos Santos on 17/05/24.
//

import SwiftUI

struct Result : View {
    
    @Binding var apertou: Int
    @State var aprovar = false
    @State var refazer = false
    
    @Binding var botao: [Int]
    
    @Binding var isActive3: Bool
    
    @Binding var resultado: Double
    
    var tocouRefazer: () -> Void
    
    var body: some View {
        
        VStack {
            Text("A sua compra tem")
                .multilineTextAlignment(.center)
                .foregroundStyle(.pretoAzul)
                .font(.regular4)
                .padding(.leading, 32.0)
                .padding(.trailing, 32.0)
                .padding(.top, 48)
            
            Text("um custo-benefício de:")
                .multilineTextAlignment(.center)
                .foregroundStyle(.pretoAzul)
                .font(.regular4)
                .padding(.leading, 32.0)
                .padding(.trailing, 32.0)
                .padding(.bottom, 1)
               
            
            Text((String(format: "%.1f", resultado)+"%"))
                .multilineTextAlignment(.center)
                .foregroundStyle(.pretoAzul)
                .font(.semibold3)
                .padding(.bottom, 88.0)

            HStack {
                
                Button (action: {
                    apertou = 0
                    tocouRefazer()
                    
                }, label: {
                    HStack{
                        if refazer {
                            Image(ImageResource.refazerBtVerde)
                        } else {
                            Image(ImageResource.refazerBt)
                        }
                    }
                })
                
                Button (action: {
                    isActive3 = true
                }, label: {
                    HStack{
                        if aprovar {
                            Image(ImageResource.aprovarVerde)
                            
                        } else {
                            Image(ImageResource.aprovarBt)
                        }
                    }
                })
                
                .padding(.leading, 8)
            
            }
            Spacer()
            
        }.ignoresSafeArea()
            //.frame(width: 345, height: 562)
            
     
    }
}
#Preview {
    Result(apertou: .constant(1), botao: .constant([0,0,0,0,0,0,0,0]), isActive3: .constant(true), resultado: .constant(0.0), tocouRefazer: {})
}
