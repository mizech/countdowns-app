import SwiftUI

struct EventForm: View {
    @Environment(EventsViewModel.self) var eventsVM
    @State var event = Event(title: "", date: .now, textColor: .gray)
    var index: Int
    
    var body: some View {
        Form {
            TextField("Title", text: $event.title)
            DatePicker("Date", selection: $event.date, displayedComponents: [.date, .hourAndMinute])
            ColorPicker("Color", selection: $event.textColor)
        }
        .navigationTitle("Add Event")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    guard event.title.isEmpty == false else {
                        return
                    }
                    
                    eventsVM.events[index] = event
                }, label: {
                    Label("Submit", systemImage: "pencil")
                })
            }
        }
        .onAppear {
            self.event = eventsVM.events[index]
        }
    }
}

#Preview {
    EventForm(event: Event(title: "", date: Date.now, textColor: .black), index: 3)
}
