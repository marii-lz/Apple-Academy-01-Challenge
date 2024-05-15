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
    
    @State private var showingSheet = false
    
    @State var isActive: Bool = false
    
    @ObservedObject private var currencyManagerBR =  CurrencyManager(
        amount: 0,
        maximum: 999_999.99,
        locale: .init(identifier: "pt_BR")
    )
    
    @ObservedObject private var currencyManagerBR2 =  CurrencyManager(
        amount: 0,
        maximum: 999_999.99,
        locale: .init(identifier: "pt_BR")
    )
    
    var body: some View {
        ZStack {
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
                                .font(.system(size: 18))
                                .foregroundStyle(.white)
                                .bold()
                                .padding(.bottom, 5)
                        }.offset(y:-28)
                        
                        ZStack(alignment: .leading) {
                            Image(ImageResource.retanguloCaixa)
                            Text(currencyManagerBR.string)
                                    .foregroundColor(.verdeEscuro)
                                    .font(.system(size: 24))
                                    .padding(.leading, 28)
                            
                        }.offset(y: -50)
                    }
                    Spacer()
                    
                    VStack(alignment: .center) {
                        Text("Quanto você tem disponível para gastar?")
                            .font(.system(size: 20))
                            .foregroundColor(.verdeEscuro)
                            .multilineTextAlignment(.center)
                            .padding(.leading, 48.0).padding(.trailing, 48.0)
                            .bold()
                        
                        HStack(alignment: .center) {
                            TextField(currencyManagerBR.string, text: $currencyManagerBR.string)
                                .keyboardType(.numberPad)
                                .onChange(of: currencyManagerBR.string, perform: currencyManagerBR.valueChanged)
                            
                            .padding(.vertical, 12)
                            .padding(.leading, 12)
                            .background(Color.verdeBranco)
                            .clipShape(.rect(cornerRadius: 8))

                            .keyboardType(
                                .numberPad)
                            .font(.system(size: 24))
                            .foregroundColor(.verdeTranslucido)
                            .padding(.leading, 72.0)
                            
                        
                            Image(ImageResource.infoBt)
                                .onTapGesture {
                                    isActive = true
                                }
                                
                            
                            //.onTapGesture {
                            //self.showingSheet = true
                            //}
                            //.sheet(isPresented: $showingSheet) {
                            //CustomPopup(isPresented: self.$showingSheet)
                            //}
                                .padding(.trailing, 48.0)
                            
                        }
                        Spacer()
                        
                        Text("Quanto custa o produto que você quer comprar?")
                            .font(.system(size: 20))
                            .foregroundColor(.verdeEscuro)
                            .multilineTextAlignment(.center)
                            .padding(.leading, 64.0).padding(.trailing, 64.0)
                            .bold()
                        
                        HStack(alignment: .center) {
                            TextField(currencyManagerBR2.string, text: $currencyManagerBR2.string)
                                .keyboardType(.numberPad)
                                .onChange(of: currencyManagerBR2.string, perform: currencyManagerBR2.valueChanged)
                            
                            .padding(.vertical, 12)
                            .padding(.leading, 12)
                            .background(Color.verdeBranco)
                            .clipShape(.rect(cornerRadius: 8))
                            
                            .keyboardType(
                                .numberPad)
                            .font(.system(size: 24))
                            .foregroundColor(.verdeTranslucido)
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
            CustomDialog(isActive: $isActive, title: "Quanto você vai guardar no porquinho?", message: "Para usar esse aplicativo, é preciso calcular previamente o valor que você tem disponível para gastar, no momento.",message2: "Então lembre-se de descontar os gastos fixos (água, luz, impostos, etc.), qualquer possível dívida (esperamos que nenhuma) e separe aquela parte investir (sugerimos pelo menos 25%) da sua renda. Daí agora sim, tá na hora de usar o app.")
        }
    }
    
    }


//struct CustomPopup: View {
//    @Binding var isPresented: Bool
//    
//    var body: some View {
//        ZStack {
//            Color.blue //Color(.clear)
//            VStack {
//                Text("Este é o pop-up personalizado.")
//                    .padding()
//                Button("Fechar") {
//                    self.isPresented = false
//                }
//                .padding()
//            }
//           
//            .background(Color.white)
//            .cornerRadius(10)
//            .padding()
//            .frame(width: 300, height: 200)
//        .shadow(radius: 10)
//        }
//        .compositingGroup()
//        .opacity(0.8)
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

#Preview {
    ContentView()
}
