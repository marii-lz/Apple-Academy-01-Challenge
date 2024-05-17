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
    
    @Binding var isActive3: Bool
    
    var body: some View {
        
        VStack {
            Text("A sua compra tem")
                .multilineTextAlignment(.center)
                .foregroundStyle(.pretoAzul)
                .font(.system(size: 20))
                .padding(.leading, 32.0)
                .padding(.trailing, 32.0)
                .padding(.top, 48)
            
            Text("um custo-benefício de:")
                .multilineTextAlignment(.center)
                .foregroundStyle(.pretoAzul)
                .font(.system(size: 20))
                .padding(.leading, 32.0)
                .padding(.trailing, 32.0)
                .padding(.bottom, 1)
               
            
            Text("0,00%")
                .multilineTextAlignment(.center)
                .foregroundStyle(.pretoAzul)
                .bold()
                .font(.system(size: 92))
                .padding(.bottom, 88.0)

            HStack {
                
                Button (action: {
                    apertou = 0
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
    Result(apertou: .constant(1), isActive3: .constant(true))
}
