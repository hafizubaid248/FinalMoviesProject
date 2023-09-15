using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UpdatedOnlineMoviesProject.BusinessLayer;
using UpdatedOnlineMoviesProject.Models;

namespace UpdatedOnlineMoviesProject.PresentationLayer
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMessage.Text = "";
            }

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string passwordHash = txtPassword.Text; // In production, hash the password

            UserBusinessLogic userLogic = new UserBusinessLogic();
            User user = userLogic.SignIn(username, passwordHash);

            if (user != null)
            {
                // Successful sign-in
                // Redirect to another page or set user session, etc.
                //lblMessage.Text = "Sign-in successful. UserID: " + user.UserID;
                lblMessage.Text = "Sign-in successful. ";
            }
            else
            {
                // Sign-in failed
                lblMessage.Text = "Sign-in failed. Please check your credentials.";
            }

        }
    }
}