//
//  Resultado2.swift
//  01-app
//
//  Created by Marília Luz dos Santos on 20/05/24.
//

import SwiftUI

struct Resultado2 : View {
    
    @Binding var apertou: Int
    
    @State var botaoInicio2 = false
    var tocouRefazer: () -> Void
    
    var body: some View {
        
        VStack {
            Image(ImageResource.medioPig)
            
            Text("Não foi uma escolha tão ruim... mas poderia ter sido melhor...")
                .multilineTextAlignment(.center)
                .foregroundStyle(.verdeEscuro)
                .font(.semibold1)
                .padding(.leading, 42.0)
                .padding(.trailing, 42.0)
                .padding(.bottom, 48.0)
                .padding(.top, 20)
            
            Button (action: {
                apertou = 0
                tocouRefazer()

            }, label: {
                VStack{
                    if botaoInicio2 {
                        Image(ImageResource.inicioBtVerde)
                    } else {
                        Image(ImageResource.inicioBt)
                    }
                }
            })
            
            Spacer()
            
        }.ignoresSafeArea()
    }
}
#Preview{
    Resultado2(apertou: .constant(1), tocouRefazer: {})
}
