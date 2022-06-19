//
//  CreateViewModel.swift
//  Noonalu
//
//  Created by Peter Kos on 6/19/22.
//

import SwiftUI


// TODO: Make models for this
enum TimeSlot {
    case Full
    case FirstHalf
    case SecondHalf
}

// TODO: i18n
enum DayOfWeek {
    case Sun, Mon, Tue, Wed, Thu, Fri, Sat
}

struct DateTimePair {
    var dayOfWeek: DayOfWeek
    var time: TimeSlot
}

class CreateViewModel: ObservableObject {

    var selectedPairs = [DateTimePair]()


    func selectTime(dayIndex: Int, hourIndex: Int, timeSlot: TimeSlot) {

        // TODO: handle deselecting
        print("SELECTED: day: \(dayIndex), hour: \(hourIndex), timeSlot: \(timeSlot)")
//        self.selectedPairs.append(pair)
    }

}
