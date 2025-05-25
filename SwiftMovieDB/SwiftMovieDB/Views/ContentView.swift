import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MovieViewModel()
    @State private var searchText = ""
    @State private var selectedMovie: Movie? = nil
    @State private var isDetailActive = false

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)

                if viewModel.movies.isEmpty {
                    Spacer()
                    Text(searchText.isEmpty ? "Carregando filmes mais bem avaliados..." : "Nenhum filme encontrado")
                        .foregroundColor(.gray)
                    Spacer()
                } else {
                    List(viewModel.movies) { movie in
                        Button {
                            selectedMovie = movie
                            searchText = ""
                            isDetailActive = true
                        } label: {
                            MovieRow(movie: movie)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .listStyle(PlainListStyle())
                }

                NavigationLink(
                    destination: Group {
                        if let movie = selectedMovie {
                            MovieDetailView(movie: movie)
                        } else {
                            EmptyView()
                        }
                    },
                    isActive: $isDetailActive,
                    label: { EmptyView() }
                )
            }
            .navigationTitle("Filmes")
            .onChange(of: searchText) { newValue in
                viewModel.searchMovies(query: newValue)
            }
        }
    }
}
