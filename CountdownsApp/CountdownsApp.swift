import SwiftUI

@main
struct CountdownsApp: App {
    var body: some Scene {
        @State var eventsVM = EventsViewModel()
        
        WindowGroup {
            EventsView()
                .environment(eventsVM)
        }
    }
}
