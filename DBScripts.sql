use WebOnlineMovies

CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL,
    PasswordHash NVARCHAR(MAX) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    IsAdmin BIT NOT NULL
);

Create Table Genres (
    GenreID Int Primary Key Identity(1,1),
    Name NvarChar(50) NOT NULL
);


CREATE TABLE Movies (
    MovieID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
    ReleaseDate DATE
);

Alter TABLE Movies 
Add Action NVARCHAR(100) Not Null

  Add GenreID INT,
    FOREIGN KEY (GenreID) REFERENCES Genres (GenreID)
	Add FOREIGN KEY (MovieID) REFERENCES Movies (MovieID),


	CREATE TABLE MovieGenres (
    MovieGenreID INT PRIMARY KEY IDENTITY(1,1),
    MovieID INT,
    GenreID INT,
    FOREIGN KEY (MovieID) REFERENCES Movies (MovieID),
    FOREIGN KEY (GenreID) REFERENCES Genres (GenreID)
);

CREATE TABLE CartItems (
    CartItemID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT, -- To associate items with a specific user
    MovieID INT, -- To associate items with a specific movie
    Quantity INT, -- If you want to track quantities of the same movie
    DateAdded DATETIME, -- To track when the item was added to the cart
	 FOREIGN KEY (MovieID) REFERENCES Movies (MovieID),
	 FOREIGN KEY (UserID) REFERENCES Users (UserID)
);






use WebOnlineMovies
CREATE PROCEDURE AddMovieWithGenres
    @Title NVARCHAR(100),
    @Description NVARCHAR(MAX),
    @ReleaseDate DATE,
    @GenreIDs NVARCHAR
AS
BEGIN
    INSERT INTO Movies (Title, Description, ReleaseDate)
    VALUES (@Title, @Description, @ReleaseDate);

    DECLARE @MovieID INT;
    SET @MovieID = SCOPE_IDENTITY();

    INSERT INTO MovieGenres (MovieID, GenreID)
    SELECT @MovieID, GenreID
    FROM Genres
    WHERE GenreID IN (SELECT value FROM STRING_SPLIT(@GenreIDs, ','));
END;

CREATE PROCEDURE GetMoviesWithGenres
AS
BEGIN
    SELECT M.MovieID, M.Title, M.Description, M.ReleaseDate, G.Name AS GenreName
    FROM Movies AS M
    INNER JOIN MovieGenres AS MG ON M.MovieID = MG.MovieID
    INNER JOIN Genres AS G ON MG.GenreID = G.GenreID;
END;


CREATE PROCEDURE AddToCart
    @MovieID INT,
    @UserID INT
AS
BEGIN
    INSERT INTO CartItems (MovieID, UserID, ReleaseDate)
    VALUES (@MovieID, @UserID, GETDATE());
END;

CREATE PROCEDURE AddToCart
    @MovieID INT,
    @UserID INT
AS
BEGIN
    INSERT INTO CartItems (MovieID, UserID, DateAdded)
    VALUES (@MovieID, @UserID, GETDATE());
END;


CREATE PROCEDURE trash
    @MovieID INT,
    @UserID INT
AS
BEGIN
    INSERT INTO trashsadsad (MovieID, UserID, DateAdded)
    VALUES (@MovieID, @UserID, GETDATE());
END;



CREATE TABLE UserCart (
    CartID INT PRIMARY KEY IDENTITY(1,1),
    --UserID INT, -- Reference to the user
    MovieID INT, -- Reference to the movie
    --CONSTRAINT FK_UserCart_User FOREIGN KEY (UserID) REFERENCES Users (UserID),
    CONSTRAINT FK_UserCart_Movie FOREIGN KEY (MovieID) REFERENCES Movies (MovieID)
);


CREATE PROCEDURE AddToCarts
    @MovieID INT,
	@CartID INT,
	@Quantity
AS
BEGIN

    INSERT INTO UserCart ( MovieID,CartID,Quantity)
    VALUES (@MovieID, @CartID, @Quantity);
END;


CREATE TABLE ShoppingCart (
    UserID INT,
    MovieID INT,
    Quantity INT,
    CONSTRAINT PK_ShoppingCart PRIMARY KEY (UserID, MovieID),
    FOREIGN KEY (UserID) REFERENCES Users (UserID),  -- Link to your Users table
    FOREIGN KEY (MovieID) REFERENCES Movies (MovieID)  -- Link to your Movies table
);

CREATE PROCEDURE AddToCartss
    @UserID INT,
    @MovieID INT,
    @Quantity INT
AS
BEGIN
    -- Check if the item is already in the cart and update quantity if it is.
    IF EXISTS (SELECT 1 FROM ShoppingCart WHERE UserID = @UserID AND MovieID = @MovieID)
    BEGIN
        UPDATE ShoppingCart
        SET Quantity = Quantity + @Quantity
        WHERE UserID = @UserID AND MovieID = @MovieID;
    END
    ELSE
    BEGIN
        -- Otherwise, insert a new row into the cart.
        INSERT INTO ShoppingCart (UserID, MovieID, Quantity)
        VALUES (@UserID, @MovieID, @Quantity);
    END
END;

CREATE PROCEDURE RemoveFromCart
    @UserID INT,
    @MovieID INT
AS
BEGIN
    DELETE FROM ShoppingCart
    WHERE UserID = @UserID AND MovieID = @MovieID;
END;













INSERT INTO Genres (Name)
VALUES ('Thriller'), ('Fiction'),('Poetry'),('Novel'),
('Romance'),('Drama'),('History'),('Fairy tale'),
('Comedy'),('Tall tale'),('Epic'),('Adventure'),
('Action'),('Horror'),('Fantasy'),('Historical drama'),
('Mystery'),('Legal drama'),('Thriller')

select * from Users
select * from Genres
select * from Movies
select * from MovieGenres
select * from ShoppingCart
