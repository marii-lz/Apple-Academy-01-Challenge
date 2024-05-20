//
//  CustomDialogAprova.swift
//  01-app
//
//  Created by Marília Luz dos Santos on 17/05/24.
//

import SwiftUI

struct CustomDialogAprova: View {
    
    @Binding var apertou: Int
    
    @Binding var preco: Double
    @Binding var caixa: Double
    
    @Binding var isActive3: Bool

    let message: String

    @State private var offset3: CGFloat = 1000
    
    var body: some View {
        
        if isActive3 {
            ZStack {
                Color(.black)
                    .opacity(0.5)
                    .onTapGesture {
                        close()
                    }
                
                VStack (alignment: .center) {
                    
                    Spacer()
                    
                    Text(message)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.pretoAzul)
                        .font(.system(size: 14))
                        .padding(.leading, 20.0)
                        .padding(.trailing, 20.0)
                        .padding(.top, 16)
                        .padding(.bottom, 8)
                        .frame(maxWidth: .infinity)
                    
                    Text("- R$" + String(format: " %.2f", preco))
                        .bold()
                        .foregroundStyle(.pretoAzul)
                        .padding(.bottom, 8)
                    
                    Button (action: {
                        
                        var novoCaixa: Double = caixa - preco
                        
                        
                    }
                    , label: {
                        Image(ImageResource.continuarBt)
                    })
                    .padding(.bottom, 16)
                    
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
                .offset(x: 0, y: offset3)
                .onAppear{
                    withAnimation(.default) {
                        offset3 = 0
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
            offset3 = 1000
            isActive3 = false
      //  }
    }
        
}

#Preview {
    CustomDialogAprova(apertou: .constant(1), preco: .constant(0.0), caixa: .constant(0.0), isActive3: .constant(true), message: "Ao aprovar a compra, serão descontados do seu caixa:")
}

