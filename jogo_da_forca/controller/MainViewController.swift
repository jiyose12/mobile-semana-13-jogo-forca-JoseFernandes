//
//  ViewController.swift
//  jogo_da_forca
//
//  Created by IFPB on 06/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var palavras = ["cachorro","coelho","tartaruga","sapo"]
    var dicas = ["melhor amigo do homem", "é rápido e dentuço", "anda lentamente","nao lava o pé"]
    
    @IBOutlet weak var imHangmanImage: UIImageView!
    @IBOutlet weak var lbDica: UILabel!
    @IBOutlet weak var lbQtdeLetras: UILabel!
    @IBOutlet weak var lbLetrasJogadas: UILabel!
    @IBOutlet weak var lbTentativasRestantes: UILabel!
    @IBOutlet weak var lbStatus: UILabel!
    @IBOutlet weak var tfLetra: UITextField!
    var forca: Forca!
    var aleatorio: Int?
    
    @IBAction func jogar(_ sender: Any) {
        let letra = Character(self.tfLetra.text!)
            self.forca.jogar(letra: letra)
            self.atualizar()
            if (self.forca.terminou()){
                let rvc = self.storyboard?.instantiateViewController(identifier: "view_resultado") as! ResultadoViewController
                rvc.resultado = self.forca.resultado()
               self.present(rvc, animated: true, completion: nil)
            }
    }
    
    func atualizar() {
        self.lbDica.text = self.forca.dica
        self.lbQtdeLetras.text = "Quantidade: \(self.forca.palavra.count) letras."
        self.lbLetrasJogadas.text = String(self.forca.letrasJogadas)
        self.lbTentativasRestantes.text = "Tentativas restantes: \(10 - self.forca.tentativas)"
        self.lbStatus.text = String(self.forca.status)
        self.imHangmanImage.image = UIImage(named: "\(10 - self.forca.tentativas)")
    }
    
    func gerarNumeroAleatorio() {
        self.aleatorio = Int.random(in: 0..<self.palavras.count)
    }

    override func viewDidLoad() {
        self.gerarNumeroAleatorio();
        print(self.aleatorio!)
        super.viewDidLoad()
        print("view did load")
        self.forca = Forca(palavra: palavras[self.aleatorio!], dica: dicas[self.aleatorio!])
    }
   
   override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
   }
   
   override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(true)
       self.atualizar()
   }
   
   override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(true)
   }
   
   override func viewDidDisappear(_ animated: Bool) {
       super.viewDidDisappear(true)
   }
}

