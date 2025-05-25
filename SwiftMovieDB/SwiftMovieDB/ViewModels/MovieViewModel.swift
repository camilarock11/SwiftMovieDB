import Combine

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    private let service = MovieService()
    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchTopRated()
    }

    func fetchTopRated() {
        service.fetchTopRatedMovies { [weak self] movies in
            self?.movies = movies
        }
    }

    func searchMovies(query: String) {
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedQuery.isEmpty {
            fetchTopRated()
        } else {
            service.fetchMovies(query: trimmedQuery) { [weak self] movies in
                self?.movies = movies
            }
        }
    }
}
