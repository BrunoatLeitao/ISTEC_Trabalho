
import SwiftUI

class PokemonVM: ObservableObject{
//                      CAMPOS
    var model:PokemonGame=PokemonGame()
    @Published var round = 0
    @Published var BattleText:String = " "
//----------------------- Alterar Struct
    func PokeAdd(nome:String,lvl:Int,exp:Int,attack:Int,attack1:Int,attack2:Int,attack3:Int,PodexNumber:Int){
        model.PokeAdd(nome: nome, lvl: lvl, exp: exp, attack: attack, attack1: attack1, attack2: attack2, attack3: attack3, Podex: PodexNumber)
    }
    
    func GetPokemonName(Numero:Int) -> String {
        model.PokemonC[Numero].Nome
    }
    func NumberOfPokemon() -> Int {
        model.PokemonC.count
    }
//------------------- Infos
    func PokemonType(PokedexNumber: Int) -> Color {
        if model.Pokedex[PokedexNumber].Tipo == "Fire"{
            return Color.red
        }else if model.Pokedex[PokedexNumber].Tipo == "Water" {
            return Color.blue
        } else {
            return Color.blue
        }
    }
    func PokedexInfo(Number: Int) -> (String,Int,Int,Color) {
        return(model.PokemonC[Number].Nome,model.PokemonC[Number].Lvl,model.PokemonC[Number].Exp,PokemonType(PokedexNumber: model.PokemonC[Number].PodexNumber))
    }
//------------------- Batalhas
    func GetInimigo() -> (String, Int) {
        var NomePokemon:String
        if(model.PokemonC[model.PokemonEmUso].Lvl < 2){
            NomePokemon = model.Pokedex[model.PokemonInimigo].Nome
        }else if (model.PokemonC[model.PokemonEmUso].Lvl < 5){
            NomePokemon = model.Pokedex[model.PokemonInimigo].Env
        }else{
            NomePokemon = model.Pokedex[model.PokemonInimigo].Env1
        }
        return (NomePokemon , model.VidaInimigo)
        
    }
    func GetPokemonForBattle() -> (String, Int, String, String, String, String){
        return (model.PokemonC[model.PokemonEmUso].Nome,
                model.VidaPokemon,
                model.AttackList[model.PokemonC[model.PokemonEmUso].Attack].Name,
                model.AttackList[model.PokemonC[model.PokemonEmUso].Attack1].Name,
                model.AttackList[model.PokemonC[model.PokemonEmUso].Attack2].Name,
                model.AttackList[model.PokemonC[model.PokemonEmUso].Attack3].Name)
    }
    func AbilityText() -> (String, String, String, String){
       return( model.AttackList[model.PokemonC[model.PokemonEmUso].Attack].Description,
        model.AttackList[model.PokemonC[model.PokemonEmUso].Attack1].Description,
        model.AttackList[model.PokemonC[model.PokemonEmUso].Attack2].Description,
        model.AttackList[model.PokemonC[model.PokemonEmUso].Attack3].Description)
    }
    func AttackButton(ButtonNumber:Int){
        model.Attack(Number: ButtonNumber)
        if model.EndBatlle != 0 {
        Text(Number: model.EndBatlle)
        }
    }
    func InicioBatalha() {
        model.BatalhaComecou()
        model.GerarInimigo()
        BattleText = " "
        round=0
    }
    
    func Text(Number:Int) {
        switch Number {
        case 1:
          BattleText = "Morreste"
            print("Morri")
        case 2:
           BattleText = "Ganhaste"
            print(BattleText)
            
            
        case 3:
           BattleText = "Pokemon Capturado"
        default:
            print("ERRO na escrita de texto do final da batalha")
        }
    }
}
