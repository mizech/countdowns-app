import SwiftUI

struct EventRow: View {
    var event: Event
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.title)
                .font(.headline)
                .foregroundStyle(event.textColor)
            Text("\(event.date)")
        }
    }
}

#Preview {
    EventRow(event: Event(title: "Halloween", date: Date.now, textColor: .orange))
}
