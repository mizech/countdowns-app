import SwiftUI

struct EventForm: View {
    @Environment(\.dismiss) var dismiss
    @Environment(EventsViewModel.self) var eventsVM
    
    @State var event = Event(title: "", date: .now, textColor: .gray)
    var mode: Mode
    var index: Int? = nil
    
    var body: some View {
        Form {
            TextField("Title", text: $event.title)
            DatePicker("Date", selection: $event.date, displayedComponents: [.date, .hourAndMinute])
            ColorPicker("Color", selection: $event.textColor)
        }
        .navigationTitle("\(mode.rawValue)")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    onSave(event: self.event)
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
    
    func onSave(event: Event) {
        guard event.title.isEmpty == false else {
            return
        }
        
        switch mode {
            case .edit:
                if let index = index {
                    eventsVM.events[index] = event
                }
            default:
                eventsVM.appendEvent(event: event)
        }
        
        dismiss()
    }
}

#Preview {
    EventForm(mode: Mode.add)
}
