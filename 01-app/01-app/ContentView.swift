//
//  ContentView.swift
//  01-app
//
//  Created by Marília Luz dos Santos on 13/05/24.
//

import SwiftUI


struct ContentView: View {
    
    
    @State var screen: Int = 0
    
    @State var isActive: Bool = false
    @State var isActive2: Bool = false
    @State var isActive3: Bool = false
    
    @State var colors: [Color] = [.pretoAzul, .gray, .gray, .gray, .gray, .gray]
    
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
    
    @State var caixa: Double = 0
    @State var preco: Double = 0
    
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
                    
                    switch screen {
                    case 0:
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
                                
                              //  var preco = currencyManagerBR2
                                
                                Image(ImageResource.infoBt)
                                    .onTapGesture {
                                        isActive2 = true
                                    }
                                    .padding(.trailing, 48.0)
                            }
                            
                            Spacer()
                            Button(action: {
                                screen = 1
                                if currencyManagerBR.doubleValue != nil {
                                    caixa = currencyManagerBR.doubleValue!
                                }
                                
                                if currencyManagerBR2.doubleValue != nil {
                                    preco = currencyManagerBR2.doubleValue!
                                }
                                
                            }, label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 24).foregroundColor(Color.verdeClaro).frame(width: 160, height: 40)
                                    Text("COMEÇAR")
                                        .foregroundColor(Color.white)
                                        .bold()
                                }
                            })
                            Spacer()
                        }
                    case 1:
                        Pergunta1(apertou: $screen, colors: $colors)
                    case 2:
                        Pergunta2(apertou: $screen, colors: $colors)
                        
                    case 3:
                        Pergunta3(apertou: $screen, colors: $colors)
                        
                    case 4:
                        Pergunta4(apertou: $screen, colors: $colors)
                        
                    case 5:
                        Pergunta5(apertou: $screen, colors: $colors)
                        
                    case 6:
                        Result(apertou: $screen, isActive3: $isActive3)
                        
                    default:
                        Text("teste")
                    }
                    
                    
                }
            }
            CustomDialog(isActive: $isActive, title: "Quanto você vai guardar no porquinho?", message: "Para usar esse aplicativo, é preciso calcular previamente o valor que você tem disponível para gastar, no momento.",message2: "Então lembre-se de descontar os gastos fixos (água, luz, impostos, etc.), qualquer possível dívida (esperamos que nenhuma) e separe aquela parte investir (sugerimos pelo menos 25%) da sua renda. Daí agora sim, tá na hora de usar o app.")
            
            CustomDialogCusto(isActive2: $isActive2, title: "Já procurou o melhor preço né?", message: "Antes de inserir o preço do produto que você deseja comprar, recomendamos fazer uma pesquisa antes, para garantir que está no melhor preço disponível.",message2: "Confira se existem opções mais em conta ou se há algum desconto. Depois disso, é só digitar o valor aqui.")
            
            CustomDialogAprova(apertou: .constant(1), preco: $preco, caixa: $caixa, isActive3: $isActive3, message: "Ao aprovar a compra, serão descontados do seu caixa:")
        }
    }
    
    }

#Preview {
    ContentView()
}
