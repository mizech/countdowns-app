import SwiftUI

struct EventRow: View {
    @Environment(EventsViewModel.self) var eventsVM
    var index: Int
    
    @State public var event = Event(title: "", date: .now, textColor: .gray)
    @State var currDate = Date.now
    
    let formatter = RelativeDateTimeFormatter()
    private var timer = Timer.publish(every: 15, on: .main, in: .common).autoconnect()
    
    public init(index: Int) {
        self.index = index
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.title)
                .font(.headline)
                .foregroundStyle(event.textColor)
            Text(formatter.localizedString(for: event.date, relativeTo: currDate))
        }
        .onReceive(timer, perform: { input in
            currDate = input
        })
        .onAppear {
            self.event = eventsVM.events[index]
        }
    }
}

#Preview {
    EventRow(index: 1)
}
