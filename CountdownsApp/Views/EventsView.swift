import SwiftUI

struct EventsView: View {
    @Environment(EventsViewModel.self) var eventsVM
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<eventsVM.events.count, id: \.self) { index in
                    NavigationLink {
                        EventForm(mode: Mode.edit, index: index)
                    } label: {
                        EventRow(index: index)
                    }
                }
            }
            .toolbar { 
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        EventForm(mode: Mode.add)
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
