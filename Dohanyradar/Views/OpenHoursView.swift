//
//  OpenHoursView.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/28/21.
//

import SwiftUI

struct OpenHoursView: View {
    
    var openHours: [OpenHourModel]
    
    var body: some View {
        VStack {
            Text("Nyitvatartás")
            Spacer(minLength: 20)
            ForEach(openHours) { openHour in
                HStack {
                    if let dayName = openHour.dayName {
                        Text(dayName)
                        Spacer()
                        Text("\(openHour.prettyOpenTime ?? "?") - \(openHour.prettyCloseTime ?? "?")")
                    }
                    
                }
            }
        }
    }
}

struct OpenHoursView_Previews: PreviewProvider {
    static var previews: some View {
        OpenHoursView(openHours: [])
    }
}
