//
//  Lotto.swift
//  Media
//
//  Created by 홍정민 on 6/5/24.
//

import UIKit

struct Lotto : Decodable {
    static let latestDrwNo: Int = {
        let startDateComponent = DateComponents(year: 2002, month: 12, day: 07)
        let startDate = Calendar.current.date(from: startDateComponent)!
        let cmpDate = Calendar.current.dateComponents([.weekday], from: startDate, to: Date())
        return (cmpDate.weekday! / 7) + 1
    }()
    
    let totSellamnt: Int
    let drwNoDate: String
    let firstWinamnt: Int
    let firstPrzwnerCo: Int
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
}
