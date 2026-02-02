require "rails_helper"

RSpec.describe Book, type: :model do
  it "is valid with valid attributes" do
    book = Book.new(title: "Test Book", author: "Test Author", price: 9.99, published_date: Date.today)
    expect(book).to be_valid
  end

  it "is invalid without a title" do
    book = Book.new(title: nil)
    expect(book).not_to be_valid
    expect(book.errors[:title]).to include("can't be blank")
  end

  it "is invalid without an author" do
    book = Book.new(author: nil)
    expect(book).not_to be_valid
    expect(book.errors[:author]).to include("can't be blank")
  end

  it "is invalid without a price" do
    book = Book.new(price: nil)
    expect(book).not_to be_valid
    expect(book.errors[:price]).to include("can't be blank")
  end

  it "is invalid without a published_date" do
    book = Book.new(published_date: nil)
    expect(book).not_to be_valid
    expect(book.errors[:published_date]).to include("can't be blank")
  end
end
