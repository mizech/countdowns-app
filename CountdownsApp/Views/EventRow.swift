import SwiftUI

struct EventRow: View {
    var event: Event
    let formatter = RelativeDateTimeFormatter()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.title)
                .font(.headline)
                .foregroundStyle(event.textColor)
            Text(formatter.localizedString(for: event.date, relativeTo: Date.now))
        }
    }
}

#Preview {
    EventRow(event: Event(title: "Halloween", date: Date.now, textColor: .orange))
}
