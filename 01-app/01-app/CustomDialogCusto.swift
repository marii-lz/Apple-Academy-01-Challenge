//
//  CustomDialogCusto.swift
//  01-app
//
//  Created by Marília Luz dos Santos on 16/05/24.
//

import SwiftUI

struct CustomDialogCusto: View {
    
    @Binding var isActive2: Bool
    
    let title: String
    let message: String
    let message2: String

    @State private var offset2: CGFloat = 1000
    
    var body: some View {
        
        if isActive2 {
            ZStack {
                Color(.black)
                    .opacity(0.5)
                    .onTapGesture {
                        close()
                    }
                
                VStack (alignment: .center) {
                    
                    Spacer()
                    
                    Text(title)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.pretoAzul)
                        .font(.bold1)
                        .bold()
                        .padding(.leading, 48.0)
                        .padding(.trailing, 48.0)
                        .padding(.top, 24)
                        .padding(.bottom, 20)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                    Text(message)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.pretoAzul)
                        .font(.regular2)
                        .padding(.leading, 28.0)
                        .padding(.trailing, 28.0)
                        .padding(.bottom, 8)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                    Text(message2)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.pretoAzul)
                        .font(.regular2)
                        .padding(.leading, 28.0)
                        .padding(.trailing, 28.0)
                        .padding(.bottom, 24)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                    
                }
                
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .overlay {
                    HStack {
                        Spacer()
                        
                        VStack {
                            Button {
                                close()
                            } label: {
                                Image(systemName: "xmark")
                                    .font(.title2)
                                    .fontWeight(.medium)
                            }
                            .tint(.black)
                            
                            Spacer()
                        }
                        .padding()
                    }
                    
                }
                .shadow(radius: 20)
                .padding(40)
                .offset(x: 0, y: offset2)
                .onAppear{
                    withAnimation(.default) {
                        offset2 = 0
                    }
                }
            }
            .ignoresSafeArea()
        } else {
            EmptyView()
        }
    }
        
    
    func close() {
       // withAnimation(.default) {
            offset2 = 1000
            isActive2 = false
      //  }
    }
        
}

#Preview {
    CustomDialogCusto(isActive2: .constant(true), title: "Já procurou o melhor preço né?", message: "Antes de inserir o preço do produto que você deseja comprar, recomendamos fazer uma pesquisa antes, para garantir que está no melhor preço disponível.",message2: "Confira se existem opções mais em conta ou se há algum desconto. Depois disso, é só digitar o valor aqui.")
}

 
