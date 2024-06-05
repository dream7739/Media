//
//  BoxOffice.swift
//  Media
//
//  Created by 홍정민 on 6/5/24.
//

import UIKit

struct BoxOfficeResult: Decodable {
    static let rangeDate = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let yesterDay = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        return formatter.string(from: yesterDay!)
    }()
    
    let boxOfficeResult: BoxOffice
}

struct BoxOffice : Decodable {
    let boxofficeType: String
    let showRange: String
    let dailyBoxOfficeList: [DailyBoxOffice]
}

struct DailyBoxOffice: Decodable {
    let rank: String
    let movieNm: String
    let openDt: String
}
