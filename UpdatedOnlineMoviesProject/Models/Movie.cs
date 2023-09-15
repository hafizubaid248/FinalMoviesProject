using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UpdatedOnlineMoviesProject.Models
{

    public class Movie
    {
        public int MovieID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public DateTime ReleaseDate { get; set; }
        public List<int> GenreIDs { get; set; }
    }
}