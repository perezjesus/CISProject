class Home

    def self.get_authors_by_average_rating(average_rating, review_count)
        #  query = "SELECT authors.name FROM authors WHERE authors.average_rating = :ave_rat AND text_reviews_count = :rev_count FETCH FIRST 5 ROWS ONLY"
        # ActiveRecord::Base.connection.exec_query(
        #     ApplicationRecord.sanitize_sql([query, {ave_rat: average_rating.to_f, rev_count: review_count}])
        # ).to_a
        query = "SELECT authors.name FROM authors WHERE authors.average_rating > #{average_rating} AND text_reviews_count = #{review_count} FETCH FIRST 5 ROWS ONLY"
        ActiveRecord::Base.connection.exec_query(query).to_a
    end

    def self.query1(genre, year_lower, year_upper)
         query = "SELECT publication_year, AVG(average_rating) FROM Books NATURAL JOIN Genres WHERE #{genre} = 'true' AND publication_year != 0 AND publication_year BETWEEN #{year_lower} AND #{year_upper} GROUP BY publication_year ORDER BY publication_year ASC FETCH FIRST 100 ROWS ONLY"
        result = ActiveRecord::Base.connection.exec_query(query)
        chartData = "["
        result.each do |row|
            chartData << ('[' + row['publication_year'].to_s + ', ' + row['avg(average_rating)'].to_s + '], ')
        end
        real = chartData.chop.chop
        real << ']' 
        return JSON.parse(real)
    end

    def self.getTupleCount()
        query = "SELECT COUNT(authors.author_id), COUNT(books.book_id), COUNT(writes.book_id), COUNT(genres.book_id) FROM authors, books, writes, genres"
        return result = ActiveRecord::Base.connection.exec_query(query)
    end
  end