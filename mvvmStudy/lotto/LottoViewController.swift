//
//  LottoViewController.swift
//  mvvmStudy
//
//  Created by zeze kim on 2023/09/13.
//

import UIKit

class LottoViewController: UIViewController {

    @IBOutlet var numLabel1: UILabel!
    @IBOutlet var numLabel2: UILabel!
    @IBOutlet var numLabel3: UILabel!
    @IBOutlet var numLabel4: UILabel!
    @IBOutlet var numLabel5: UILabel!
    @IBOutlet var numLabel6: UILabel!
    @IBOutlet var numLabel7: UILabel!
    
    @IBOutlet var resultLabel: UILabel!
    var viewModel = LottoViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }

  

    @IBAction func resultButtonClicked(_ sender: UIButton) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            self.viewModel.fetchLottoAPI(drwNo: 1000)
        }
     
        bindNum()
        
    }
    func bindNum () {
        viewModel.number1.bind{
            value in
            self.numLabel1.text = "\(value)"
        }
        viewModel.number2.bind{
            value in
            self.numLabel2.text = "\(value)"
        }
        viewModel.number3.bind{
            value in
            self.numLabel3.text = "\(value)"
        }
        viewModel.number4.bind{
            value in
            self.numLabel4.text = "\(value)"
        }
        viewModel.number5.bind{
            value in
            self.numLabel5.text = "\(value)"
        }
        viewModel.number6.bind{
            value in
            self.numLabel6.text = "\(value)"
        }
        viewModel.number7.bind{
            value in
            self.numLabel7.text = "\(value)"
        }
        viewModel.lottoMoney.bind{
            result in
            self.resultLabel.text = result
        }
    }
}
