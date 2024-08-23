import SwiftUI

struct EventForm: View {
    @Environment(\.dismiss) var dismiss
    @Environment(EventsViewModel.self) var eventsVM
    
    @State var event = Event(title: "", date: .now, textColor: .gray)
    @State var givenTitle = ""
    var mode: Mode
    var index: Int? = nil
    let onSave: (Event) -> Void
    
    var body: some View {
        Form {
            TextField("Title", text: $event.title)
            DatePicker("Date", selection: $event.date, displayedComponents: [.date, .hourAndMinute])
            ColorPicker("Color", selection: $event.textColor)
        }
        .navigationTitle(givenTitle.isEmpty ? "Add" : givenTitle)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    guard event.title.isEmpty == false else {
                        return
                    }
                    
                    onSave(self.event)
                    dismiss()
                }, label: {
                    Label("Submit", systemImage: "checkmark")
                })
            }
        }
        .onAppear {
            if let index = index {
                self.event = eventsVM.events[index]
                self.givenTitle = "\(Mode.edit.rawValue) \(event.title)"
            }
        }
    }
}

#Preview {
    EventForm(mode: Mode.add, onSave: { _ in })
}
