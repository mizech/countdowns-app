import SwiftUI

struct EventsView: View {
    @Environment(EventsViewModel.self) var eventsVM
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<eventsVM.events.count, id: \.self) { index in
                    NavigationLink {
                        EventForm(title: "Edit", index: index)
                    } label: {
                        EventRow(event: eventsVM.events[index])
                    }
                }
            }
            .toolbar { 
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        EventForm(title: "Add")
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Events")
            .listStyle(.plain)
        }
    }
}

#Preview {
    EventsView()
}
