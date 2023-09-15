using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using UpdatedOnlineMoviesProject.DataAccessLayer;
using UpdatedOnlineMoviesProject.Models;

namespace UpdatedOnlineMoviesProject.BusinessLayer
{
    public class MovieBusinessLogic
    {
     


        private readonly MovieDataAccess movieDataAccess;

        public MovieBusinessLogic()
        {
            movieDataAccess = new MovieDataAccess();
        }
        public int AddMovieWithGenres(Movie movie)
        {
            // Perform validation and business logic here if needed

            return movieDataAccess.AddMovieWithGenres(movie);
        }
        public List<Genre> GetGenres()
        {


            return movieDataAccess.GetGenres();

        }
        public DataTable GetMoviesWithGenres()
        //public List<MovieWithGenres> GetAllMoviesWithGenres()
        {
            return movieDataAccess.GetMoviesWithGenres();
        }
        public void AddToCart(int userID, int movieID, int quantity)
        {
            movieDataAccess.AddToCart(userID, movieID, quantity);
        }

        public void RemoveFromCart(int userID, int movieID)
        {
            movieDataAccess.RemoveFromCart(userID, movieID);
        }


    }
}































//public class MovieBusinessLogic
//{
//    private readonly MovieDataAccess movieDataAccess;

//    public MovieBusinessLogic()
//    {
//        movieDataAccess = new MovieDataAccess();
//    }

//    public int AddMovieWithGenres(Movie movie)
//    {
//        // Perform validation and business logic here if needed

//        return movieDataAccess.AddMovieWithGenres(movie);
//    }
//    public List<Genre> GetGenres()
//    {


//        return movieDataAccess.GetGenres();

//    }



//    //public int AddMovie(Movie movie)
//    //{
//    //    return movieDataAccess.AddMovie(movie);
//    //}
//}
