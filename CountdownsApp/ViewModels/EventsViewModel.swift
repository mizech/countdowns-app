import Foundation

@Observable
class EventsViewModel {
    var events = [Event]()
    
    init() {
        events.append(Event(title: "Title 01", date: Date.now, textColor: .blue))
        events.append(Event(title: "Title 02", date: Date.now, textColor: .blue))
        events.append(Event(title: "Title 03", date: Date.now, textColor: .blue))
        events.append(Event(title: "Title 04", date: Date.now, textColor: .blue))
    }
}
