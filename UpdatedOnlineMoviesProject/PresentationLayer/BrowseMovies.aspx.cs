using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using UpdatedOnlineMoviesProject.BusinessLayer;
using UpdatedOnlineMoviesProject.DataAccessLayer;
using UpdatedOnlineMoviesProject.Models;


namespace UpdatedOnlineMoviesProject.PresentationLayer
{
    public partial class BrowseMovies : System.Web.UI.Page
    {
        private readonly string connectionString;
        MovieBusinessLogic movieBusinessLogic = new MovieBusinessLogic();
        public BrowseMovies()
        {
            connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        }




        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Bind the GridView with movie data
                BindMovieData();
                GetAllMoviesWithGenres();
            }
            else
            {
                // This code will execute on postbacks.
                // Repopulate your controls here.
            }
        }

        private void GetAllMoviesWithGenres()
        {
            SqlConnection con = new SqlConnection(connectionString);

            //SqlConnection con = new SqlConnection(@"Data Source= .\CMDLHRLTX523; Initial Catalog= WebOnlineMovies; Integrated Security=True");
            SqlCommand cmd = new SqlCommand("SELECT M.MovieID, M.Title, M.Description, M.ReleaseDate, G.Name AS GenreName\r\nFROM Movies AS M\r\nINNER JOIN MovieGenres AS MG ON M.MovieID = MG.MovieID\r\nINNER JOIN Genres AS G ON MG.GenreID = G.GenreID;", con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            movieTable.DataSource = dt;
            movieTable.DataBind();
            movieTable.UseAccessibleHeader = true;
            movieTable.HeaderRow.TableSection = TableRowSection.TableHeader;


        }
        private void BindMovieData()
        {
            // Use your data access method to get movie data
            //DataTable dt = GetAllMoviesWithGenres;
            MovieDataAccess movieDataAccess = new MovieDataAccess();
            DataTable dt = movieDataAccess.GetMoviesWithGenres();

            movieTable.DataSource = dt;
            movieTable.DataBind();
        }
        protected void btnAddToCart_Command(object sender, CommandEventArgs e)
        {
            int userID = 1; // Replace with the actual user ID
            int movieID = Convert.ToInt32(e.CommandArgument);
            int quantity = 1; // You can change the quantity as needed

            movieBusinessLogic.AddToCart(userID, movieID, quantity);
            BindMovieData(); // Refresh the GridView
        }
        protected void btnRemoveFromCart_Command(object sender, CommandEventArgs e)
        {
            int userID = 1; // Replace with the actual user ID
            int movieID = Convert.ToInt32(e.CommandArgument);

            movieBusinessLogic.RemoveFromCart(userID, movieID);
            BindMovieData(); // Refresh the GridView
        }

    }
}
        //int Key = 0;

        //protected void movieTable_SelectedIndexChanged(object sender, EventArgs e)
        //{
            //MovieIDs.Value = movieTable.SelectedRow.Cells[2].Text;
            //PrPriceTb.Value = movieTable.SelectedRow.Cells[4].Text;
            ////PriceTb.Value = ProductGV.SelectedRow.Cells[4].Text;
            ////PrQtyTb.Value = ProductGV.SelectedRow.Cells[4].Text;
            //Stock = Convert.ToInt32(movieTable.SelectedRow.Cells[5].Text);
            //if (PNameTb.Value == "")
            //{
            //    Key = 0;
            //}
            //else
            //{
            //    {
            //        Key = Convert.ToInt32(movieTable.SelectedRow.Cells[1].Text);
            //    }
            //}

        //}

        //if (!IsPostBack)
        //{
        //    DataTable movies = movieBusinessLogic.GetAllMoviesWithGenres();

        //    // Get a reference to the HTML table
        //    HtmlTable movieTable = FindControl("movieTable") as HtmlTable;

        //    // Loop through the movies and populate the HTML table
        //    foreach (DataRow movieRow in movies.Rows)
        //    {
        //        HtmlTableRow row = new HtmlTableRow();
        //        row.Cells.Add(new HtmlTableCell() { InnerText = movieRow["MovieID"].ToString() });
        //        row.Cells.Add(new HtmlTableCell() { InnerText = movieRow["Title"].ToString() });
        //        row.Cells.Add(new HtmlTableCell() { InnerText = movieRow["Description"].ToString() });
        //        row.Cells.Add(new HtmlTableCell() { InnerText = Convert.ToDateTime(movieRow["ReleaseDate"]).ToString("yyyy-MM-dd") });
        //        row.Cells.Add(new HtmlTableCell() { InnerText = movieRow["GenreName"].ToString() });
        //        movieTable.Rows.Add(row);
        //    }






        //if (!IsPostBack)
        //{
        //    // Fetch data from your DAL, for example:
        //    List<MovieWithGenres> movies = movieBusinessLogic.GetAllMoviesWithGenres();

        //    // Get a reference to the HTML table
        //    HtmlTable movieTable = FindControl("movieTable") as HtmlTable;

        //    // Loop through the movies and populate the HTML table
        //    foreach (var movie in movies)
        //    {
        //        HtmlTableRow row = new HtmlTableRow();
        //        row.Cells.Add(new HtmlTableCell() { InnerText = movie.MovieID.ToString() });
        //        row.Cells.Add(new HtmlTableCell() { InnerText = movie.Title });
        //        row.Cells.Add(new HtmlTableCell() { InnerText = movie.Description });
        //        row.Cells.Add(new HtmlTableCell() { InnerText = movie.ReleaseDate.ToString("yyyy-MM-dd") });
        //        row.Cells.Add(new HtmlTableCell() { InnerText = movie.GenreName });
        //        movieTable.Rows.Add(row);
        //    }
        //}


        //if (!IsPostBack)
        //{
        //    LoadMovies();
        //}


        //private void LoadMovies()
        //{
        //    MovieBusinessLogic movieBusinessLogic = new MovieBusinessLogic();
        //    DataTable dataTable = movieBusinessLogic.GetMoviesWithGenres();

        //    if (dataTable != null && dataTable.Rows.Count > 0)
        //    {
        //        gvMovies.DataSource = dataTable;
        //        gvMovies.DataBind();
        //    }
        //}
    