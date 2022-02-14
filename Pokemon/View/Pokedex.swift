

import SwiftUI

struct Pokedex: View {
    @EnvironmentObject var VM:PokemonVM
    var body: some View {
        NavigationView{
        ZStack{
        VStack{
        HStack{Spacer()}
            Spacer()
            VStack{
                ForEach(0..<VM.NumberOfPokemon()){ index in
                    
                    Button(action: {
                        print(index)
                        print("clicado")
                    }){
                        Image(VM.GetPokemonName(Numero: index)).resizable().aspectRatio( contentMode: .fit).frame(width: 250)
                        
                        
                    }
                    Text(VM.GetPokemonName(Numero: index)).fontWeight(.black)
                        .foregroundColor(Color.white)
                    
                }
                
            }
            Spacer()
            Footer()
            }
        }.background(Image("BackGround2").resizable().scaledToFill())
        .edgesIgnoringSafeArea([.top,.bottom])
        }
    }
}

struct Pokedex_Previews: PreviewProvider {
    static var previews: some View {
        Pokedex()
    }
}
