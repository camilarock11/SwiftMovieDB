import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")")) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .aspectRatio(contentMode: .fit)
                .cornerRadius(12)

                Text(movie.title)
                    .font(.largeTitle)
                    .bold()

                if let overview = movie.overview {
                    Text(overview)
                        .font(.body)
                }

                if let rating = movie.voteAverage {
                    Text("Avaliação: \(String(format: "%.1f", rating))/10")
                        .font(.headline)
                        .padding(.top)
                }

                Button(action: {
                    // implementar trailer depois
                }) {
                    Label("Assistir trailer", systemImage: "play.circle")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .navigationBarTitle(movie.title, displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.blue)
        })
    }
}
