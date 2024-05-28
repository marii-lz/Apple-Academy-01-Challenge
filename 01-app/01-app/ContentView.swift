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
    
    @State var colors: [Color] = [.pretoAzul, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro, .cinzaClaro]
    
    @ObservedObject private var currencyManagerBR = CurrencyManager.initial
    
    @ObservedObject private var currencyManagerBR2 =  CurrencyManager.initial
    
    @State var caixa: Double = 0
    @State var preco: Double = 0

    @State var botoes: [Int] = [0,0,0,0,0,0,0,0]
    
    @State var resultado: Double = 0.0
    
    let limitAlert = "O preço do produto não pode ser maior do quanto você tem disponível para gastar!"
    @State var limitInput = false
    
    let zeroAlert = "Preencha todos os campos para continuar!"
    @State var zeroInput = false
    
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
                        
                        if screen < 10 {
                            Image(ImageResource.pig).offset(y:-106)
                            ZStack(alignment: .bottom){
                                Rectangle()
                                    .foregroundColor(.verdeEscuro)
                                    .cornerRadius(24)
                                    .frame(width: 130, height: 57)
                                Text("caixa")
                                    .font(.semibold1)
                                    .foregroundStyle(.white)
                                    .padding(.bottom, 5)
                            }.offset(y:-28)
                            
                            ZStack(alignment: .leading) {
                                Image(ImageResource.retanguloCaixa)
                                Text(currencyManagerBR.string)
                                    .foregroundColor(.verdeEscuro)
                                    .font(.regular1)
                                    .padding(.leading, 28)
                                
                            }.offset(y: -50)
                        } else {
                            ZStack(alignment: .bottom){
                                
                                if screen == 10 {
                                    Rectangle()
                                        .foregroundColor(.caixaVermelho)
                                        .cornerRadius(24)
                                        .frame(width: 130, height: 57)
                                } else if screen == 11 {
                                    Rectangle()
                                        .foregroundColor(.caixaLaranja)
                                        .cornerRadius(24)
                                        .frame(width: 130, height: 57)
                                } else if screen == 12 {
                                    Rectangle()
                                        .foregroundColor(.caixaVerde)
                                        .cornerRadius(24)
                                        .frame(width: 130, height: 57)
                                }
                                
                                Text("caixa")
                                    .font(.semibold1)
                                    .foregroundStyle(.white)
                                    .padding(.bottom, 5)
                            }.offset(y:-28)
                            
                            ZStack(alignment: .leading) {
                                Image(ImageResource.retanguloCaixa)
                                //("- R$" + String(format: "%.2f", preco))
                                Text("R$ " + String(format: "%.2f", caixa-preco))
                                    .foregroundColor(.verdeEscuro)
                                    .font(.regular1)
                                    .padding(.leading, 28)
                                
                            }.offset(y: -50)
                        }
                    }
//                    .onTapGesture {
//                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//                    }
                    
                    Spacer()
                    
                    switch screen {
                    case 0:
                        VStack(alignment: .center) {
                            Text("Quanto você tem disponível para gastar?")
                                .font(.medium1)
                                .foregroundColor(.verdeEscuro)
                                .multilineTextAlignment(.center)
                                .padding(.leading, 48.0).padding(.trailing, 48.0)
                            
                            
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
                                    .font(.regular1)
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
                                .font(.medium1)
                                .foregroundColor(.verdeEscuro)
                                .multilineTextAlignment(.center)
                                .padding(.leading, 56.0).padding(.trailing, 56.0)
                            
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
                                    .font(.regular1)
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
                                
                                guard
                                    let caixa = currencyManagerBR.doubleValue,
                                    let preco = currencyManagerBR2.doubleValue,
                                    
                                        caixa > 0, preco > 0
                                else {
                                    zeroInput = true
                                    return
                                }
                                
                                // antes a variável era apenas uma propriedade, dentro do botão
                                self.caixa = caixa
                                self.preco = preco
                                
                                guard caixa - preco >= 0 else {
                                    limitInput = true
                                    return
                                }
                                
                                screen = 1
                                
                            }, label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 24).foregroundColor(Color.verdeClaro).frame(width: 160, height: 40)
                                    Text("COMEÇAR")
                                        .foregroundColor(Color.white)
                                        .font(.semibold2)
                                        .bold()
                                }
                                
                            })
                            
                            .alert(limitAlert, isPresented: $limitInput){
                                Button("OK", role: .cancel, action: {})
                            }
                            
                            .alert(zeroAlert, isPresented: $zeroInput){
                                Button("OK", role: .cancel, action: {})
                            }
                            
                            Spacer()
                        }
                    case 1:
                        Pergunta1(apertou: $screen, botao: $botoes, colors: $colors)
                        
                    case 2:
                        Pergunta2(apertou: $screen, botao: $botoes, colors: $colors)
                        
                    case 3:
                        Pergunta3(apertou: $screen, botao: $botoes, colors: $colors)
                        
                    case 4:
                        Pergunta4(apertou: $screen, botao: $botoes, colors: $colors)
                        
                    case 5:
                        Pergunta5(apertou: $screen, botao: $botoes, colors: $colors)
                        
                    case 6:
                        Pergunta6(apertou: $screen, botao: $botoes, colors: $colors)
                        
                    case 7:
                        Pergunta7(apertou: $screen, botao: $botoes, colors: $colors)
                        
                    case 8:
                        Pergunta8(apertou: $screen, botao: $botoes, colors: $colors, resultado: $resultado)
                        
                    case 9:
                        Result(apertou: $screen, botao: $botoes, isActive3: $isActive3, resultado: $resultado, tocouRefazer:{
                            clear()
                        })
                        
                    case 10:
                        Resultado1(apertou: $screen, tocouRefazer:{
                            clearNotAll()
                        })
                        
                    case 11:
                        Resultado2(apertou: $screen, tocouRefazer:{
                            clearNotAll()
                        })
                        
                    case 12:
                        Resultado3(apertou: $screen, tocouRefazer:{
                            clearNotAll()
                        })
                        
                    default:
                        Text("teste")
                    }
                    
                    
                }
            }
            CustomDialog(isActive: $isActive, title: "Quanto você vai guardar no porquinho?", message: "Para usar esse aplicativo, é preciso calcular previamente o valor que você tem disponível para gastar, no momento.",message2: "Então lembre-se de descontar os gastos fixos (água, luz, impostos, etc.), qualquer possível dívida (esperamos que nenhuma) e separe aquela parte para investir (sugerimos pelo menos 25%) da sua renda. Daí agora sim, tá na hora de usar o app.")
            
            CustomDialogCusto(isActive2: $isActive2, title: "Já procurou o melhor preço né?", message: "Antes de inserir o preço do produto que você deseja comprar, recomendamos fazer uma pesquisa antes, para garantir que está no melhor preço disponível.",message2: "Confira se existem opções mais em conta ou se há algum desconto. Depois disso, é só digitar o valor aqui.")
            
            CustomDialogAprova(apertou: $screen, preco: $preco, caixa: $caixa, isActive3: $isActive3, resultado: $resultado, message: "Ao aprovar a compra, serão descontados do seu caixa:")
        }
        
    }
        
    
    func clear() {
        currencyManagerBR.reset()
        currencyManagerBR2.reset()
        caixa = 0
        preco = 0
        resultado = 0
        botoes = [0,0,0,0,0,0,0,0]
    }
    
    func clearNotAll() {
        currencyManagerBR.reset(with: Decimal(caixa - preco))
        currencyManagerBR2.reset()
        caixa = caixa-preco
        preco = 0
        resultado = 0
        botoes = [0,0,0,0,0,0,0,0]
        zeroInput = false
    }
    
}

#Preview {
    ContentView()
}
