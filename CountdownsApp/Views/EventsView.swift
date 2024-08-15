import SwiftUI

struct EventsView: View {
    @State var eventVM = EventsViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(eventVM.events) { event in
                    NavigationLink {
                        EventForm()
                    } label: {
                        EventRow(event: event)
                    }
                }
            }
            .listStyle(.plain)
            .padding()
        }
    }
}

#Preview {
    EventsView()
}
