//
//  CreateViewModel.swift
//  Noonalu
//
//  Created by Peter Kos on 6/19/22.
//

import SwiftUI

// TODO: Make models for this instead of putting here :)

enum TimeSlot {
    case Full
    case FirstHalf
    case SecondHalf
    case Empty
}

// TODO: i18n 😭
enum DayOfWeek {
    case Sun, Mon, Tue, Wed, Thu, Fri, Sat
}

extension Int {
    func toDayOfWeek() -> DayOfWeek? {
        switch self {
        case 0: return .Sun
        case 1: return .Mon
        case 2: return .Tue
        case 3: return .Wed
        case 4: return .Thu
        case 5: return .Fri
        case 6: return .Sat
        default: return nil
        }
    }
}

struct DateTimePair: Hashable {
    var dayOfWeek: DayOfWeek
    var hour: Int
    var timeSlot: TimeSlot
        
    // TODO: Cleanup if not needed
    func hash(into hasher: inout Hasher) {
        hasher.combine(dayOfWeek)
        hasher.combine(hour)
    }
}

class CreateViewModel: ObservableObject {

    var selectedPairs = [DateTimePair]()
    var testData: [[DateTimePair?]] = Array(repeating: Array(repeating: nil, count: 8), count: 2)

    func selectTime(dayIndex: Int, hourIndex: Int, timeSlot: TimeSlot) {
        
        guard let dayIndexConverted = dayIndex.toDayOfWeek() else {
            print("Unable to convert day index \(dayIndex) to date. Out of range!")
            return
        }
        
        let selectedTime = DateTimePair(dayOfWeek: dayIndexConverted, hour: hourIndex, timeSlot: timeSlot)
        
        if let curData = testData[dayIndex][hourIndex] {
            // Overwite only if time slot diffeers
            // (Sanity check, really)
            if curData.timeSlot != timeSlot {
                testData[dayIndex][hourIndex] = selectedTime
            }
        } else {
            testData[dayIndex][hourIndex] = selectedTime
        }
        
        print("Latest data model: \(testData)")
    }

}
