using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UpdatedOnlineMoviesProject.BusinessLayer;
using UpdatedOnlineMoviesProject.Models;

namespace UpdatedOnlineMoviesProject.PresentationLayer
{
    public partial class Movies : System.Web.UI.Page
    {
        private readonly MovieBusinessLogic movieLogic = new MovieBusinessLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Populate ListBox with genres from the database
                List<Genre> genres = movieLogic.GetGenres(); // Ensure 'GetGenres' method exists in MovieBusinessLogic
                lbGenres.DataSource = genres;
                lbGenres.DataTextField = "Name"; // Adjust this based on your Genre model
                lbGenres.DataValueField = "GenreID"; // Adjust this based on your Genre model
                lbGenres.DataBind();
            }

         

        }

        protected void btnAddMovie_Click(object sender, EventArgs e)
        {
            Movie movie = new Movie
            {
                Title = txtTitle.Text,
                Description = txtDescription.Text,
                ReleaseDate = DateTime.Parse(txtReleaseDate.Text),
                GenreIDs = GetSelectedGenres()
            };

            // Call the BusinessLogic to add the movie with genres
            int rowsAffected = movieLogic.AddMovieWithGenres(movie);

            if (rowsAffected > 0)
            {
                // Movie added successfully
                lblMessage.Text = "Movie added successfully."; // Ensure 'lblMessage' is a valid control
            }
            else
            {
                // Movie addition failed
                lblMessage.Text = "Failed to add the movie."; // Ensure 'lblMessage' is a valid control
            }

           

        }

        protected void txtDescription_TextChanged(object sender, EventArgs e)
        {

        }

        private List<int> GetSelectedGenres()
        {
            List<int> selectedGenres = new List<int>();
            foreach (ListItem item in lbGenres.Items)
            {
                if (item.Selected)
                {
                    selectedGenres.Add(Convert.ToInt32(item.Value));
                }
            }
            return selectedGenres;
        }

      
    }
    }
