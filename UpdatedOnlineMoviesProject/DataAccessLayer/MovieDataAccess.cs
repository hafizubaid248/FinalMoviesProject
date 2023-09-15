using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using UpdatedOnlineMoviesProject.Models;

namespace UpdatedOnlineMoviesProject.DataAccessLayer
{

    public class MovieDataAccess
    {
        private readonly string connectionString;

        public MovieDataAccess()
        {
            connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        }
        public int AddMovieWithGenres(Movie movie)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("AddMovieWithGenres", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Title", movie.Title);
                    command.Parameters.AddWithValue("@Description", movie.Description);
                    command.Parameters.AddWithValue("@ReleaseDate", movie.ReleaseDate);


                    string genreIDs = string.Join(",", movie.GenreIDs);
                    command.Parameters.AddWithValue("@GenreIDs", genreIDs);

                    return command.ExecuteNonQuery();
                }
            }
        }
        public List<Genre> GetGenres()
        {
            List<Genre> genres = new List<Genre>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT GenreID, Name FROM Genres";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Genre genre = new Genre
                            {
                                GenreID = Convert.ToInt32(reader["GenreID"]),
                                Name = reader["Name"].ToString()
                            };
                            genres.Add(genre);
                        }
                    }
                }
            }

            return genres;
        }
        public DataTable GetMoviesWithGenres()
        //public List<MovieWithGenres> GetMoviesWithGenres()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("GetMoviesWithGenres", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    dataAdapter.Fill(dataTable);

                    return dataTable;
                }
            }
        }
        public void AddToCart(int userID, int movieID, int quantity)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("AddToCartss", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@UserID", userID);
                    command.Parameters.AddWithValue("@MovieID", movieID);
                    command.Parameters.AddWithValue("@Quantity", quantity);
                    command.ExecuteNonQuery();
                }
            }
        }
        public void RemoveFromCart(int userID, int movieID)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("RemoveFromCart", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@UserID", userID);
                    command.Parameters.AddWithValue("@MovieID", movieID);
                    command.ExecuteNonQuery();
                }
            }
        }

    }
}


            //public DataTable GetAllMoviesWithGenres()
            //{
            //    DataTable dt = new DataTable();
            //    using (SqlConnection connection = new SqlConnection(connectionString))
            //    {
            //        connection.Open();

            //        using (SqlCommand command = new SqlCommand("GetMoviesWithGenres", connection))
            //        {
            //            command.CommandType = CommandType.StoredProcedure;

            //            using (SqlDataAdapter dataAdapter = new SqlDataAdapter(command))
            //            {
            //                dataAdapter.Fill(dt);
            //            }
            //        }
            //    }
            //    return dt;



            //}
        
    

    //public class MovieDataAccess
    //{
    //    private readonly string connectionString;

    //    public MovieDataAccess()
    //    {
    //        connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
    //    }


    //    public int AddMovieWithGenres(Movie movie)
    //    {
    //        using (SqlConnection connection = new SqlConnection(connectionString))
    //        {
    //            connection.Open();

    //            using (SqlCommand command = new SqlCommand("AddMovieWithGenres", connection))
    //            {
    //                command.CommandType = CommandType.StoredProcedure;
    //                command.Parameters.AddWithValue("@Title", movie.Title);
    //                command.Parameters.AddWithValue("@Description", movie.Description);
    //                command.Parameters.AddWithValue("@ReleaseDate", movie.ReleaseDate);


    //                string genreIDs = string.Join(",", movie.GenreIDs);
    //                command.Parameters.AddWithValue("@GenreIDs", genreIDs);

    //                return command.ExecuteNonQuery();
    //            }
    //        }
    //    }
    //    public List<Genre> GetGenres()
    //    {
    //        List<Genre> genres = new List<Genre>();

    //        using (SqlConnection connection = new SqlConnection(connectionString))
    //        {
    //            connection.Open();

    //            string query = "SELECT GenreID, Name FROM Genres";
    //            using (SqlCommand command = new SqlCommand(query, connection))
    //            {
    //                using (SqlDataReader reader = command.ExecuteReader())
    //                {
    //                    while (reader.Read())
    //                    {
    //                        Genre genre = new Genre
    //                        {
    //                            GenreID = Convert.ToInt32(reader["GenreID"]),
    //                            Name = reader["Name"].ToString()
    //                        };
    //                        genres.Add(genre);
    //                    }
    //                }
    //            }
    //        }

    //        return genres;
    //    }


    //public int AddMovie(Movie movie)
    //{
    //    using (SqlConnection connection = new SqlConnection(connectionString))
    //    {
    //        connection.Open();

    //        using (SqlCommand command = new SqlCommand("AddMovie", connection))
    //        {
    //            command.CommandType = CommandType.StoredProcedure;
    //            command.Parameters.AddWithValue("@Title", movie.Title);
    //            command.Parameters.AddWithValue("@Description", movie.Description);
    //            command.Parameters.AddWithValue("@ReleaseDate", movie.ReleaseDate);

    //            SqlParameter movieIdParam = new SqlParameter("@MovieID", SqlDbType.Int);
    //            movieIdParam.Direction = ParameterDirection.Output;
    //            //command.Parameters.Add(movieIdParam);

    //            command.ExecuteNonQuery();
    //            return Convert.ToInt32(movieIdParam.Value);
    //        }
    //    }
    //}


