

import Foundation
import SwiftUI

struct PokemonGame {
    
    var PokemonEmUso = 0
    var VidaPokemon = 100
    var PokemonInimigo = 0
    var VidaInimigo = 100
    var EndBatlle = 0
    
    
    
    var PokemonC:Array<PokemonCapturados>
    struct PokemonCapturados:Identifiable{
        var id=UUID()
        var Nome:String         //Nome do Pokémon
        var Lvl:Int             //Nível do Pokémon
        var Exp:Int             //Exp do Pokémon
        var Attack:Int          //1º Ataque do Pokémon
        var Attack1:Int         //2º Ataque do Pokémon
        var Attack2:Int         //3º Ataque do Pokémon
        var Attack3:Int         //4º Ataque do Pokémon
        var PodexNumber:Int     //Número do Pokémon na Pokedex
    }
    
    init() {
        PokemonC=Array<PokemonCapturados>()
    }
    
    let Pokedex:[(Nome:String, Env:String ,Lvl:Int,Env1:String,Lvl1:Int,Tipo:String,Defense:Int,Force:Int, Attack:Int, Attack1:Int, Attack2:Int, Attack3:Int)]=[
        (Nome:"Bulbasaur", Env: "Ivysaur" , Lvl: 3 , Env1: "Venusaur" , Lvl1: 5 , Tipo: "Grass", Defense:20 ,Force:20 , Attack: 1, Attack1: 6, Attack2: 1, Attack3: 6 ),
        (Nome:"Charmander", Env: "Charmeleon" , Lvl: 3 , Env1: "Charizard" , Lvl1: 5, Tipo: "Fire", Defense:10 ,Force:40, Attack: 1, Attack1: 4, Attack2: 2, Attack3: 7 ),
        (Nome:"Squirtle", Env: "Squirtle" , Lvl: 3 , Env1: "Squirtle" , Lvl1: 5, Tipo: "Water", Defense:40 ,Force:10, Attack: 1, Attack1: 2, Attack2: 6, Attack3: 3 )
        //(Nome:"", Env: "" , Lvl:  , Env1: "" , Lvl1: , Tipo: "", Attack: , Attack1: , Attack2: , Attack3:  )
    ]
    
    let AttackList: [(Name: String, Description: String, type: String, Power: Int)] = [
        //(Name: "" , Description: "" , type: "" , Power: ),
        (Name: "", Description: "", type: "", Power: 0),
        //Normal Attack
        (Name: "Growl", Description: "May cause flinching.", type: "Normal", Power: 15),
        
        //Water Attack
        (Name: "Bubble" , Description: "May lower opponent's Speed." , type: "Water" , Power: 35),
        (Name: "Surf" , Description: "May lower opponent's Speed." , type: "Water", Power: 60),
        
        //Fire Attack
        (Name: "Ember", Description: "May burn opponent." , type: "Fire" , Power: 35),
        (Name: "Flamethrower" , Description: "May burn opponent." , type: "Fire" , Power: 60),
        
        //Grass Attack
        (Name: "Razor Leaf" , Description: "User recovers half the HP inflicted on opponent." , type: "Grass" , Power:35 ),
        (Name: "Solar Beam", Description: "User recovers half the HP inflicted on opponent.", type: "Grass", Power:60)
        
    ]
    //MARK: - Funcoes do PokemonC
    
    mutating func PokeAdd (nome:String,lvl:Int,exp:Int,attack:Int,attack1:Int,attack2:Int,attack3:Int,Podex:Int){
        PokemonC.append(PokemonCapturados(Nome: nome, Lvl: lvl, Exp: exp, Attack: attack, Attack1: attack1, Attack2: attack2, Attack3: attack3, PodexNumber: Podex))
    }
    func GetPokemon(numero:Int) -> String {
        return PokemonC[numero].Nome
    }
    mutating func AlterarPokemon(numero:Int, nome:String, lvl:Int,exp:Int ) {
        PokemonC[numero].Nome = nome
        PokemonC[numero].Exp = exp
        PokemonC[numero].Lvl = lvl
    }
    

    //MARK: - Batalha
    
    mutating func GerarInimigo(){
        PokemonInimigo = Int.random(in: 0...Pokedex.count-1)
    }
    
    mutating func Attack(Number:Int){
        switch Number {
        case 0:
            VidaInimigo -= AttackList[PokemonC[PokemonEmUso].Attack].Power
            VidaPokemon -= AttackList[Pokedex[PokemonInimigo].Attack].Power
            EstouMorto()
        case 1:
            VidaInimigo -= AttackList[PokemonC[PokemonEmUso].Attack1].Power
            VidaPokemon -= AttackList[Pokedex[PokemonInimigo].Attack1].Power
            EstouMorto()
        case 5:
            CapturarPokemon()
        default:
            print("ERRO no Ataque")
        }
        if VidaInimigo <= 0 {
            EndBatlle = 2
            PokemonC[PokemonEmUso].Exp+=1
            if PokemonC[PokemonEmUso].Lvl == PokemonC[PokemonEmUso].Exp {
                PokemonC[PokemonEmUso].Lvl += 1
                PokemonC[PokemonEmUso].Exp = 0
            }
        }
    }
    
    mutating func BatalhaComecou()   {
        VidaInimigo=100
        VidaPokemon=100
        EndBatlle = 0
        
    }
    mutating func EstouMorto(){
        if VidaPokemon<=0 {
            EndBatlle = 1
        }
    }

            
    mutating func CapturarPokemon(){
        let Apanhado = Int.random(in: 0...100)
        if (Apanhado>VidaInimigo) {
            PokemonC.append(PokemonCapturados(Nome: Pokedex[PokemonEmUso].Nome, Lvl: PokemonC[PokemonEmUso].Lvl, Exp: 0, Attack: Pokedex[PokemonEmUso].Attack, Attack1: Pokedex[PokemonEmUso].Attack1, Attack2: Pokedex[PokemonEmUso].Attack2, Attack3: Pokedex[PokemonEmUso].Attack3, PodexNumber: PokemonInimigo))
            EndBatlle = 3
        }


    }
    }
