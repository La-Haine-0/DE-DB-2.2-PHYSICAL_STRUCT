CREATE TABLE IF NOT EXISTS authors (
    author_id uuid PRIMARY KEY,
    author_fio VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS books (
    book_cipher uuid PRIMARY KEY,
    book_name VARCHAR(255) NOT NULL,
    year_of_publishing_book DATE NOT NULL,
    book_size INTEGER NOT NULL,
    book_priсe REAL NOT NULL,
    сount_copies_of_book INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS authors_books (
    authors_books_id uuid PRIMARY KEY,
    book_cipher uuid,
    author_id uuid,
    FOREIGN KEY (book_cipher) REFERENCES books (book_cipher) ON DELETE SET NULL,
    FOREIGN KEY (author_id) REFERENCES authors (author_id) ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS cities (
    city_id uuid PRIMARY KEY,
    city_name VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS publishing_houses_cities (
    publishing_houses_cities_id uuid PRIMARY KEY,
    publishing_houses_id,
    city_id uuid,
    FOREIGN KEY (city_id) REFERENCES cities (city_id) ON DELETE SET NULL,
    FOREIGN KEY (publishing_houses_id) REFERENCES publishing_houses (publishing_houses_id) ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS publishing_houses (
    publishing_houses_id uuid PRIMARY KEY,
    name_publishing_houses  VARCHAR(255) NOT NULL,
    year_of_publishing_houses  INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS copies_of_books (
    copies_of_books_id uuid PRIMARY KEY,
    location_of_copie VARCHAR(255) NOT NULL,
    publishing_house_id uuid,
    book_cipher uuid,
    FOREIGN KEY (book_cipher) REFERENCES books (book_cipher) ON DELETE CASCADE,
    FOREIGN KEY (publishing_house_id) REFERENCES publishing_houses (publishing_house_id) ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS readers (
    number_of_reader_ticket uuid PRIMARY KEY,
    reader_fio VARCHAR(255) NOT NULL,
    reader_address VARCHAR(255) NOT NULL,
    reader_phone_number INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS lending_of_books (
    lending_of_book_id uuid PRIMARY KEY,
    lending_date DATE NOT NULL,
    deadline_time DATE NOT NULL,
    return_date DATE NOT NULL,
    number_of_reader_ticket uuid,
    copies_of_books_id uuid,
    FOREIGN KEY (number_of_reader_ticket) REFERENCES readers (number_of_reader_ticket) ON DELETE CASCADE,
    FOREIGN KEY (copies_of_books_id) REFERENCES copies_of_books (copies_of_books_id) ON DELETE SET NULL
);