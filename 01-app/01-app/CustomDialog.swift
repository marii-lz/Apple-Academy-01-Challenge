//
//  CustomDialog.swift
//  01-app
//
//  Created by Marília Luz dos Santos on 15/05/24.
//

import SwiftUI

struct CustomDialog: View {
    
    @Binding var isActive: Bool
    
    let title: String
    let message: String
    let message2: String

    @State private var offset: CGFloat = 1000
    
    var body: some View {
        
        if isActive {
            ZStack {
                Color(.black)
                    .opacity(0.5)
                    .onTapGesture {
                        close()
                    }
                
                VStack (alignment: .center, spacing: 12) {
                    Text(title)
                        .multilineTextAlignment(.center)
                        .bold()
                        .padding()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                    Text(message)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                    Text(message2)
                        .multilineTextAlignment(.center)
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
                .offset(x: 0, y: offset)
                .onAppear{
                    withAnimation(.default) {
                        offset = 0
                    }
                }
            }
            .ignoresSafeArea()
        } else {
            EmptyView()
        }
    }
        
    
    func close() {
        withAnimation(.default) {
            offset = 1000
            isActive = false
        }
    }
        
}

#Preview {
    CustomDialog(isActive: .constant(true), title: "Quanto você vai guardar no porquinho?", message: "Para usar esse aplicativo, é preciso calcular previamente o valor que você tem disponível para gastar, no momento.",message2: "Então lembre-se de descontar os gastos fixos (água, luz, impostos, etc.), qualquer possível dívida (esperamos que nenhuma) e separe aquela parte investir (sugerimos pelo menos 25%) da sua renda. Daí agora sim, tá na hora de usar o app.")
}
