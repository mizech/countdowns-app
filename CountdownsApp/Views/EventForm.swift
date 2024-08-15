import SwiftUI

struct EventForm: View {
    @Environment(\.dismiss) var dismiss
    @Environment(EventsViewModel.self) var eventsVM
    
    @State var event = Event(title: "", date: .now, textColor: .gray)
    var title: String
    var index: Int? = nil
    
    var body: some View {
        Form {
            TextField("Title", text: $event.title)
            DatePicker("Date", selection: $event.date, displayedComponents: [.date, .hourAndMinute])
            ColorPicker("Color", selection: $event.textColor)
        }
        .navigationTitle("\(title)")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    onSave()
                }, label: {
                    Label("Submit", systemImage: "checkmark")
                })
            }
        }
        .onAppear {
            if let index = index {
                self.event = eventsVM.events[index]
            }
        }
    }
    
    func onSave() {
        guard event.title.isEmpty == false else {
            return
        }
        
        if title == "Edit" {
            if let index = index {
                eventsVM.events[index] = event
            }
        } else {
            eventsVM.appendEvent(event: event)
        }
        
        dismiss()
    }
}

#Preview {
    EventForm(title: "Edit")
}
