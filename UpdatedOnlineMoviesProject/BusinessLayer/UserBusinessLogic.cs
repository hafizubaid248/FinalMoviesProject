using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UpdatedOnlineMoviesProject.DataAccessLayer;
using UpdatedOnlineMoviesProject.Models;

namespace UpdatedOnlineMoviesProject.BusinessLayer
{
    public class UserBusinessLogic
    {
        private MovieBusinessLogic movieBusinessLogic = new MovieBusinessLogic();

        private readonly UserDataAccess userDataAccess;

        public UserBusinessLogic()
        {
            userDataAccess = new UserDataAccess();
        }

        public int SignUp(User user)
        {
            if (userDataAccess.IsUsernameExists(user.Username))
            {
                // Username already exists, handle accordingly
                return -1;
            }

            // Proceed with user registration
            return userDataAccess.AddUser(user);
        }

        public User SignIn(string username, string passwordHash)
        {
            return userDataAccess.SignIn(username, passwordHash);
        }
    }
}