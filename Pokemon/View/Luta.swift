

import SwiftUI

struct Luta: View {
@EnvironmentObject var VM:PokemonVM
var body: some View {
        NavigationView{
        ZStack{
        VStack{
            Spacer()
                
            HStack{
                Spacer()
                    
                VStack{
                   Text(VM.GetInimigo().0)
                    Text("Vida : \(VM.GetInimigo().1)")
                    Image(VM.GetInimigo().0)
                    
                    
                }
                .padding(.trailing, 25.0)

            }
            
            Spacer()
            HStack{
                
                VStack{
                    Text(VM.GetPokemonForBattle().0 )
                    Text("Vida : \(VM.GetPokemonForBattle().1 )")
                    Image(VM.GetPokemonForBattle().0)
                   
                }
            Spacer()
            }
            
            .padding(.bottom,70.0)

                HStack{
                    if VM.BattleText == " " {
                     
                    Spacer()
                    Text("Ataca").font(.title)
                    Spacer()
                VStack{
                    Button(action:{
                        VM.round+=1
                        VM.AttackButton(ButtonNumber: 0)
                    }, label: {
                        Text(VM.GetPokemonForBattle().2)
                        
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                })
                    
                    Button(action: {
                        VM.round+=1
                        VM.AttackButton(ButtonNumber: 1)
                    }, label: {
                    Text(VM.GetPokemonForBattle().3)
                        
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                })}
                        
                VStack{
                    Button(action: {
                        VM.round+=1
                        VM.AttackButton(ButtonNumber: 2)
                    }, label: {
                    Text(VM.GetPokemonForBattle().4)
                        
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                })
                    Button(action: {
                        VM.AttackButton(ButtonNumber: 3)
                    }, label: {
                    Text(VM.GetPokemonForBattle().5)
                        
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                })}
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .padding()
                    
                    }else{
                        Text(VM.BattleText)
                        NavigationLink(destination: Pokedex().navigationBarHidden(true)
          
                           ,label: {
                                   Text("Continuar").fontWeight(.black)
                                       .foregroundColor(Color.black)
  
                        })
                    }
                }
                Spacer()
            }
            
            }.background(Image("BackGroundBattle").resizable())
        .edgesIgnoringSafeArea([.top,.bottom])
            }
        }
    }



struct Luta_Previews: PreviewProvider {
    static var previews: some View {
        Luta()
    }
}
