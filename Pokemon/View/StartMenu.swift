

import SwiftUI

struct StartMenu: View {
    @EnvironmentObject var VM:PokemonVM
    var body: some View {
        NavigationView{
        ZStack{
            VStack{
                HStack{
                    
                    Spacer()}
                Spacer()

                Spacer()
                teste()
            }
        }.background(Image("Inicial").resizable().scaledToFill())
                .edgesIgnoringSafeArea([.top,.bottom])
        }
    }
}


struct teste: View {
    @EnvironmentObject var VM:PokemonVM
    var body: some View {
                
        VStack{
            NavigationLink(destination: ChooseInitial().navigationBarHidden(true)){
                Text("PRESS START").fontWeight(.black)
                    .foregroundColor(Color.white).padding()
        }
            
    }
}

}




         

