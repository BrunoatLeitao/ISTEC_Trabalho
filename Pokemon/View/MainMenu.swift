

import SwiftUI

struct MainMenu: View {
    @EnvironmentObject var VM:PokemonVM
    var body: some View {
        NavigationView{
        ZStack{
            VStack{
                HStack{
                    
                    Spacer()}
                Spacer()

                Spacer()
                Footer()
            }
        }.background(Image("BackGround2").resizable().scaledToFill())
                .edgesIgnoringSafeArea([.top,.bottom])
        }
    }
}
        

struct Footer: View {
    @EnvironmentObject var VM:PokemonVM
    var body: some View {
        HStack{Spacer()
            NavigationLink(destination: Luta().navigationBarHidden(true).onAppear(perform: VM.InicioBatalha)){
                Image("Luta").resizable()
                        .frame(width: 75.0, height: 75.0)
                }.padding([.bottom, .trailing])
        
        Spacer()
        NavigationLink(destination: ChooseInitial().navigationBarHidden(true)){
               Image("MainMenu").resizable()
                    .frame(width: 75.0, height: 75.0)
        }.padding([.bottom, .trailing])
        Spacer()
        NavigationLink(destination: Pokedex().navigationBarHidden(true)){
               Image("PokeBola").resizable()
                    .frame(width: 75.0, height: 75.0)
        }.padding([.bottom, .trailing])
            Spacer()
        }
        HStack{
            Spacer()
            Text("FIGHT").fontWeight(.black)
                .foregroundColor(Color.black)
            Spacer()
            Text("MENÚ").fontWeight(.black)
                .foregroundColor(Color.black)
            Spacer()
            Text("POKEDEX").fontWeight(.black)
                .foregroundColor(Color.black)
            Spacer()}.padding(.bottom)
        
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}

