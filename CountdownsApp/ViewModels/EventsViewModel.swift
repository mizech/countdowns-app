import Foundation

@Observable
class EventsViewModel {
    var events = [Event]()
    
    func appendEvent(event: Event) {
        events.append(event)
    }
}
