//
//  Forca.swift
//  jogo_da_forca
//
//  Created by IFPB on 06/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import Foundation

class Forca {
    var palavra: Array<Character>
    var status: Array<Character>
    var dica: String
    var tentativas: Int
    var letrasJogadas: Array<Character>
    
    init(palavra: String, dica: String) {
        self.palavra = Array(palavra)
        self.dica = dica
        self.tentativas = 0
        self.letrasJogadas = Array()
        self.status = Array(repeating: "_", count: self.palavra.count)
    }
    
    func jogadaValida(letra: Character) -> Bool {
        return !self.letrasJogadas.contains(letra) && self.palavra.contains(letra) && self.tentativas < 10
    }
    
    func jogar(letra: Character){
        if (self.jogadaValida(letra: letra)){
            self.letrasJogadas.append(letra)
            for i in 0..<self.palavra.count{
                if (self.palavra[i] ==  letra){
                    self.status[i] = letra
                }
            }
        }else{
            self.tentativas += 1
        }
    }
    
    func terminou() -> Bool {
        return self.palavra == self.status || self.tentativas >= 10
    }
    
    func resultado() -> String {
        if (self.terminou()){
            if (self.palavra == self.status){
                return "Ganhou"
            }else{
                return "Perdeu"
            }
        }else{
            return "Jogo não terminou"
        }
    }
}
