//
//  ResultadoViewController.swift
//  jogo_da_forca
//
//  Created by IFPB on 06/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import UIKit

class ResultadoViewController: UIViewController {

    @IBOutlet weak var lbResultado: UILabel!
    var resultado: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.lbResultado.text = self.resultado
    }
    
    @IBAction func voltar(_ sender: Any) {
        let mvc = self.storyboard?.instantiateViewController(identifier: "view_main") as! MainViewController
        mvc.viewDidLoad()
        self.dismiss(animated: true, completion: nil)
    }
}
    


