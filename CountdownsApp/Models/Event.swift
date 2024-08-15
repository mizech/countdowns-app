import Foundation
import SwiftUI

struct Event: Comparable, Identifiable {
    var id = UUID()
    var title: String
    var date: Date
    var textColor: Color
    
    static func < (lhs: Event, rhs: Event) -> Bool {
        lhs.date < rhs.date
    }
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.title == rhs.title && lhs.date == rhs.date
    }
}
