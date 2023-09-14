//
//  APIService.swift
//  mvvmStudy
//
//  Created by zeze kim on 2023/09/13.
//

import Foundation

func fetchLottoAPI(drwNo : Int) {
    
    
    
}


class LottoAPIService {
    
    static let shared = LottoAPIService()
    
    func callRequest ( completionHandler:@escaping(Lotto?)->Void) {

       guard let url = URL(string:  "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1000") else {return}


        let request = URLRequest(url:url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print(error)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...500).contains(response.statusCode) else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Lotto.self, from: data!)
                completionHandler(result)
                
            } catch {
                print(error)
            }

        }.resume()
    }
    
}


struct Lotto : Codable {
    let totSellamnt: Int
    let returnValue, drwNoDate: String
    let firstWinamnt, drwtNo6, drwtNo4, firstPrzwnerCo: Int
    let drwtNo5, bnusNo, firstAccumamnt, drwNo: Int
    let drwtNo2, drwtNo3, drwtNo1: Int
}
