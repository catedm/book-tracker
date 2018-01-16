class BookTracker
  @@id = 1

  def initialize
    @books = []
  end

  def add_book(title, author, edition)
    book = {
      title: title,
      author: author,
      edition: edition,
      id: @@id
    }

    @@id += 1
    @books.push(book)
  end

  def update(book_id, updated_book)
    if @books.none? { |book| book[:id] == book_id }
      puts "This book does not exist. Please enter a valid id."
      return
    end

    id = @books.select { |book| book[:id] == book_id }[0][:id]
    updated_book[:id] = id

    @books.map! do |book|
      book = book[:id] == book_id ? updated_book : book
    end
  end

  def delete(book_id)
    index = @books.index { |book| book[:id] == book_id }
    @books.delete_at(index)
  end

  def all_books
    @books.each do |book|
      puts "
      Book #{book[:id]}:
      Title: #{book[:title]}
      Author: #{book[:author]}
      Edition: #{book[:edition]}
      "
    end
  end
end

tracker = BookTracker.new

# ADD BOOKS
tracker.add_book('fane eyre', 'Charles Dickens', 2)
tracker.add_book('Learn to Program', 'Chris Pine', 2)

# BROWSE BOOKS
tracker.all_books

# UPDATE BOOKS BY ID
tracker.update(5, 'Learn To Program 2')
tracker.update(2, {title: 'Jane Eyre', author: 'Charles Dickens', edition: 3})

tracker.all_books

# DELETE BOOKS BY ID
tracker.delete(1)
