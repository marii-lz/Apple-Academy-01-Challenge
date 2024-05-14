//
//  ContentView.swift
//  01-app
//
//  Created by Marília Luz dos Santos on 13/05/24.
//

import SwiftUI


struct ContentView: View {
    @State var caixa: Double? = nil
    @State var preco: Double? = nil
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.clear
            VStack(spacing: 0) {
                Rectangle()
                    .foregroundColor(.verdeEscuro)
                    .ignoresSafeArea(.all)
                    .frame(maxWidth: .infinity)
                    .frame(height: 164)
                
                
                
                ZStack {
                    Image(ImageResource.pig).offset(y:-106)
                    ZStack(alignment: .bottom){
                        Rectangle()
                            .foregroundColor(.verdeEscuro)
                            .cornerRadius(24)
                            .frame(width: 130, height: 57)
                        Text("caixa")
                            .foregroundStyle(.white)
                            .bold()
                            .padding(.bottom, 5)
                    }.offset(y:-30)
                    
                    ZStack(alignment: .leading) {
                        Image(ImageResource.retanguloCaixa)
                        if let caixa {
                            Text("R$"+String(format: " %.2f",caixa))
                                .padding(.leading, 40)
                        } else {
                            Text("R$ 0,00")
                                .padding(.leading, 40)
                        } //como colocar vírgula no textfield
                        
                    }.offset(y: -50)
                }
                Spacer()
                
                VStack(alignment: .center) {
                    Text("Quanto você tem disponível para gastar?")
                        .foregroundColor(.verdeEscuro)
                        .multilineTextAlignment(.center)
                        .padding(.leading, 48.0).padding(.trailing, 48.0)
                        .bold()
                    
                    HStack(alignment: .center) {
                        TextField (
                            "R$",
                            value: $caixa,
                            format: .number
                        )
                        .padding(.vertical, 12)
                        .padding(.leading, 12)
                        .background(Color.verdeBranco)
                        .clipShape(.rect(cornerRadius: 8))

                        .keyboardType(
                            .numberPad)
                    .padding(.leading, 72.0)
                        
                        Image(ImageResource.infoBt)
                            .padding(.trailing, 48.0)
                    }
                    Spacer()
                    
                    Text("Quanto custa o produto que você quer comprar?")
                        .foregroundColor(.verdeEscuro)
                        .multilineTextAlignment(.center)
                        .padding(.leading, 72.0).padding(.trailing, 72.0)
                        .bold()
                    
                    HStack(alignment: .center) {
                        TextField (
                            "R$",
                            value: $preco,
                            format: .number
                        )
                        .padding(.vertical, 12)
                        .padding(.leading, 12)
                        .background(Color.verdeBranco)
                        .clipShape(.rect(cornerRadius: 8))
                        
                        .keyboardType(
                            .numberPad)
                    .padding(.leading, 72.0)
                        
                        Image(ImageResource.infoBt)
                            .padding(.trailing, 48.0)
                    }
                    
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 24).foregroundColor(Color.verdeClaro).frame(width: 160, height: 40)
                            Text("COMEÇAR")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    })
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
