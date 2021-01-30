//
//  IsOpenView.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/28/21.
//

import SwiftUI

struct IsOpenView: View {
    
    let model: TobaccoShopModel
    
    var body: some View {
        if model.isOpen {
            Text("Nyitva")
        } else {
            Text("Zárva")
            if let todayIndex = Date().indexOfTodayInWeek(),
               let nextOpening = model.nextOpenDate(afterDayIndex: todayIndex),
               let diaplayDayString = nextOpening.dayName,
               let displayHourString = nextOpening.prettyOpenTime {
                Text("Legközelebb nyitva: \(diaplayDayString) \(displayHourString)")
            }
//            Text("Legközelebb nyitva: \(Date.dayNameForInexInWeek(Date().indexOfTodayInWeek()+1))")
        }
    }
}

//struct IsOpenView_Previews: PreviewProvider {
//    static var previews: some View {
//        IsOpenView()
//    }
//}
