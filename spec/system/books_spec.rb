require "rails_helper"

RSpec.describe "Books", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "creates a book successfully and shows flash notice" do
    visit new_book_path
    fill_in "Title", with: "Integration Test Book"
    fill_in "Author", with: "Integration Author"
    fill_in "Price", with: "19.99"
    fill_in "Published date", with: "2024-01-01"
    click_button "Create Book"

    expect(page).to have_content("Book was successfully created.")
    expect(page).to have_content("Integration Test Book")
    expect(page).to have_content("Integration Author")
    expect(page).to have_content("19.99")
    expect(page).to have_content("2024-01-01")
  end

  it "fails to create a book with blank title and shows error" do
    visit new_book_path
    fill_in "Title", with: ""
    click_button "Create Book"

    expect(page).to have_content("Title can't be blank")
  end

  it "fails to create a book with blank author and shows error" do
    visit new_book_path
    fill_in "Title", with: "Valid Title"
    fill_in "Author", with: ""
    click_button "Create Book"

    expect(page).to have_content("Author can't be blank")
  end

  it "fails to create a book with blank price and shows error" do
    visit new_book_path
    fill_in "Title", with: "Valid Title"
    fill_in "Price", with: ""
    click_button "Create Book"

    expect(page).to have_content("Price can't be blank")
  end

  it "fails to create a book with blank published date and shows error" do
    visit new_book_path
    fill_in "Title", with: "Valid Title"
    fill_in "Published date", with: ""
    click_button "Create Book"

    expect(page).to have_content("Published date can't be blank")
  end
end
