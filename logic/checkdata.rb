class CheckData
  def check_list_books(books)
    puts "\nBook List:"
    if books.empty?
      puts "\nNo books available"
      return nil
    end

    books.each_with_index do |book, idx|
      puts "\n#{idx}) " \
           "ID: #{book.id}, " \
           "Label: #{book.label.title}, " \
           "Publish Date: #{book.publish_date}, " \
           "Publisher: #{book.publisher}, " \
           "Cover State: #{book.cover_state}"
    end
  end

  def check_list_labels(labels)
    puts "\nLabel List:"
    if labels.empty?
      puts "\nNo Labels available"
      return nil
    end

    labels.each_with_index do |label, idx|
      puts "\n#{idx}) " \
           "ID: #{label.id}, " \
           "Title: #{label.title}, " \
           "Color: #{label.color}, "
    end
  end
end
