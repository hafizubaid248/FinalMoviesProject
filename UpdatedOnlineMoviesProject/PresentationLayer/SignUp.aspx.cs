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
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMessage.Text = "";
            }

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
           
            User user = new User
            {
                
                //Username = txtUsername.Text,
                Username = txtUsername.Value,
                //PasswordHash = txtPassword.Text, // Hash the password in production
                PasswordHash = txtPassword.Value, // Hash the password in production
                Email = txtEmail.Value,
                IsAdmin = chkIsAdmin.Checked
            };

            UserBusinessLogic userLogic = new UserBusinessLogic();
            int result = userLogic.SignUp(user);

            if (result > 0)
            {
                lblMessage.Text = "User has been registered successfully.";
            }
            else if (result == -1)
            {
                lblMessage.Text = "Username already exists. Please choose another username.";
            }
            else
            {
                lblMessage.Text = "User registration failed.";
            }

        }
    }
}