//
//  LottoViewModel.swift
//  mvvmStudy
//
//  Created by zeze kim on 2023/09/13.
//

import Foundation

class LottoViewModel {
    var number1 = observable(1)
    var number2 = observable(2)
    var number3 = observable(3)
    var number4 = observable(4)
    var number5 = observable(5)
    var number6 = observable(6)
    var number7 = observable(7)
    var lottoMoney = observable("당첨금")
    
    func format(for number : Int) ->String {
        let numberFormat = NumberFormatter()
        numberFormat.numberStyle = .decimal
        return numberFormat.string(from: number as NSNumber)!
        
    }
    func fetchLottoAPI(drwNo:Int) {
        LottoAPIService.shared.callRequest {
            num in
            guard let num = num else {return}
            self.number1.value = num.drwtNo1
            self.number2.value = num.drwtNo2
            self.number3.value = num.drwtNo3
            self.number4.value = num.drwtNo4
            self.number5.value = num.drwtNo5
            self.number6.value = num.drwtNo6
            self.number7.value = num.bnusNo
            self.lottoMoney.value = self.format(for: num.totSellamnt)
        }
    }
    
    
    
}



