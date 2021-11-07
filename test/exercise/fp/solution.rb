module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        ratings = array.reject { |film| film['rating_kinopoisk'].nil? || film['rating_kinopoisk'].to_f.zero? }
                       .reject { |film| film['country'].nil? || film['country'].split(',').size < 2 }
                       .map { |film| film['rating_kinopoisk'].to_f }
        result = ratings.reduce(:+)
        result / ratings.size
      end

      def chars_count(films, threshold)
        films.filter { |film| film['rating_kinopoisk'].to_f.nil? || film['rating_kinopoisk'].to_f >= threshold }
             .map { |film| film['name'] }
             .reduce(0) { |acc, film| acc + film.count('и') }
      end
    end
  end
end
