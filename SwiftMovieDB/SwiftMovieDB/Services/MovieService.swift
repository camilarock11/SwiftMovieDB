import Foundation

class MovieService {
    private let apiKey = "Sua chave de API aqui"
    private let baseURL = "https://api.themoviedb.org/3"

    func fetchMovies(query: String, completion: @escaping ([Movie]) -> Void) {
        guard !query.isEmpty else {
            completion([])
            return
        }

        let urlString = "\(baseURL)/search/movie?api_key=\(apiKey)&query=\(query)&language=pt-BR"
        guard let url = URL(string: urlString) else {
            completion([])
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion([])
                return
            }
            do {
                let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(response.results)
                }
            } catch {
                print("Erro ao decodificar: ", error)
                completion([])
            }
        }.resume()
    }

    func fetchTopRatedMovies(completion: @escaping ([Movie]) -> Void) {
        let urlString = "\(baseURL)/movie/top_rated?api_key=\(apiKey)&language=pt-BR"
        guard let url = URL(string: urlString) else {
            completion([])
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion([])
                return
            }
            do {
                let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(response.results)
                }
            } catch {
                print("Erro ao decodificar: ", error)
                completion([])
            }
        }.resume()
    }

}
