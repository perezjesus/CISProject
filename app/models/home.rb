class Home

    def self.query1(genre, year_lower, year_upper)
        query = "SELECT publication_year, COUNT(book_id) 
                FROM Books NATURAL JOIN Genres 
                WHERE #{genre} = 'true' AND publication_year != 0
                AND publication_year BETWEEN #{year_lower} AND #{year_upper}
                AND book_id IN 
                     (SELECT book_id FROM Books WHERE is_ebook = 'true') 
                GROUP BY publication_year 
                ORDER BY publication_year ASC"
        
        result = ActiveRecord::Base.connection.exec_query(query)
        temp = "["
        result.each do |row|
            temp << ('[' + row['publication_year'].to_s + ', ' + row['count(book_id)'].to_s + '], ')
        end
        chartData = temp.chop.chop
        chartData << ']' 
        puts chartData
        return JSON.parse(chartData)
       
    end

    def self.query2(genre, year_lower, year_upper)
        query = "SELECT publication_year, COUNT(book_id) 
                FROM Books NATURAL JOIN Genres NATURAL JOIN Writes 
                WHERE #{genre} = 'true'
                AND publication_year BETWEEN #{year_lower} AND #{year_upper}  
                AND author_id IN 
                        (SELECT author_id 
                        FROM Authors NATURAL JOIN Writes
                        GROUP BY author_id 
                        HAVING COUNT(book_id) > 50) 
                GROUP BY publication_year 
                ORDER BY publication_year ASC"
        
        result = ActiveRecord::Base.connection.exec_query(query)
        temp = "["
        result.each do |row|
            temp << ('[' + row['publication_year'].to_s + ', ' + row['count(book_id)'].to_s + '], ')
        end
        chartData = temp.chop.chop
        chartData << ']' 
        return JSON.parse(chartData)
    end   

    def self.query3(genre, year_lower, year_upper, average_rating)
        query = "SELECT publication_year, COUNT(book_id) 
                FROM Books NATURAL JOIN Writes NATURAL JOIN Genres 
                WHERE author_id IN (SELECT author_id FROM Authors WHERE average_rating > #{average_rating}) 
                AND #{genre} = 'true' AND publication_year BETWEEN #{year_lower} AND #{year_upper}  
                GROUP BY publication_year 
                ORDER BY publication_year ASC"
        
        result = ActiveRecord::Base.connection.exec_query(query)
        temp = "["
        result.each do |row|
            temp << ('[' + row['publication_year'].to_s + ', ' + row['count(book_id)'].to_s + '], ')
        end
        chartData = temp.chop.chop
        chartData << ']' 
        puts chartData
        return JSON.parse(chartData)
    end  

    def self.query4(language_code, year_lower)
        query = "SELECT publication_year, AVG(average_rating) 
                FROM Books 
                WHERE language_code = '#{language_code}' 
                AND publication_year BETWEEN #{year_lower} AND 2017 
                GROUP BY publication_year 
                ORDER BY publication_year ASC"
        
        result = ActiveRecord::Base.connection.exec_query(query)
        temp = "["
        result.each do |row|
            temp << ('[' + row['publication_year'].to_s + ', ' + row['avg(average_rating)'].to_s + '], ')
        end
        chartData = temp.chop.chop
        chartData << ']' 
        
        return JSON.parse(chartData)
    end
    
    def self.query5(genre, year_lower, year_upper)
        query = "SELECT publication_year, COUNT(book_id) 
        FROM Books NATURAL JOIN Genres 
        WHERE #{genre} = 'true' AND average_rating > 
            (SELECT MAX(average_rating) 
            FROM Books NATURAL JOIN Genres 
            WHERE mystery = 'true')
        AND publication_year BETWEEN #{year_lower} AND #{year_upper}
        GROUP BY publication_year 
        ORDER BY publication_year ASC"
        
        result = ActiveRecord::Base.connection.exec_query(query)
        temp = "["
        result.each do |row|
            temp << ('[' + row['publication_year'].to_s + ', ' + row['count(book_id)'].to_s + '], ')
        end
        chartData = temp.chop.chop
        chartData << ']' 
        puts chartData
        return JSON.parse(chartData)
    end  

    def self.getTupleCount()
        query = "
        SELECT SUM(cnt)
        FROM (
        SELECT COUNT(*) as cnt FROM authors
        UNION ALL
        SELECT COUNT(*) as cnt FROM books
        UNION ALL
        SELECT COUNT(*) as cnt FROM writes
        UNION ALL
        SELECT COUNT(*) as cnt FROM genres )"
        result = ActiveRecord::Base.connection.exec_query(query)
        tupleCount = ""
        result.each do |row|
            tupleCount << row['sum(cnt)'].to_s
        end
        return tupleCount
    end

  end