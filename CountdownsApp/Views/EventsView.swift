import SwiftUI

struct EventsView: View {
    @Environment(EventsViewModel.self) var eventsVM
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<eventsVM.events.count, id: \.self) { index in
                    NavigationLink(value: index) {
                        EventRow(index: index)
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        eventsVM.events.remove(at: index)
                    }
                }
            }
            .navigationDestination(for: Int.self, destination: { index in
                EventForm(mode: Mode.edit, index: index)
            })
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
