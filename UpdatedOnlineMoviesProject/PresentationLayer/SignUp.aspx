<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="UpdatedOnlineMoviesProject.PresentationLayer.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Login</title>
<link rel="stylesheet" href="../Asset/Lib/Bootstrap/css/bootstrap.min.css" />
</head>
<body>

      <div class-="container-fluid">
      <div class="row" style="height:100px"></div>
      <div class="row">
          
          <div class="col-md-2"></div>
          <div class="col-md-4">
              <img src="../Asset/Images/movies.jpg" class="img-fluid" style="float:left; height:250px; width:500px" />
          </div>
          <div class="col-md-4">
              <h1 class="text-danger">Sign Up</h1>



              <form id="form1" runat="server">
                                    <div class="form-group">

  <label for="txtUsername">User Name</label>
  <input type="text" class="form-control" id="txtUsername" runat="server" required="required" >
  
</div>



       




                  <div class="form-group">

  <label for="txtEmail">Email address</label>
  <input type="email" class="form-control" id="txtEmail" runat="server" required="required" placeholder="Email" >
  
</div>

                  
  <br />
                


<div class="form-group">
  <label for="txtPassword">Password</label>
  <input type="password" class="form-control" id="txtPassword" placeholder="Password" runat="server" required="required">
</div>

                  <div>

                 
                    <asp:CheckBox ID="chkIsAdmin" runat="server" Text="Admin" EnableViewState="false" />
  <br />
                       </div>
                  <asp:Label ID="lblMessage" runat="server" ForeColor="Red" EnableViewState="false"></asp:Label>
        <br />
                      <asp:Button text=" Sign Up " Class="btn btn-danger btn-block" runat="server" ID="Button1" OnClick="btnSignUp_Click"/>





  
  </form>

          </div>       

      </div> 
          </div>





    </body>
</html>








    <%--<form id="form1" runat="server">--%>
<%--    <div>
        <h2>Sign Up</h2>
        
        <%--<asp:TextBox ID="txtUsername" runat="server" placeholder="Username" EnableViewState="false" Required="true"></asp:TextBox>--%>
        <%--<br />--%>
        <%--<asp:TextBox ID="txtPassword" runat="server" placeholder="Password" EnableViewState="false" TextMode="Password" Required="true"></asp:TextBox>--%>
        <%--<br />--%>
        <%--<asp:TextBox ID="txtEmail" runat="server" placeholder="Email" EnableViewState="false" Required="true"></asp:TextBox>--%>
       <%-- <br />--%>
       <%-- <asp:CheckBox ID="chkIsAdmin" runat="server" Text="Admin" EnableViewState="false" />
        <br />--%>
      <%--  <asp:Label ID="lblMessage" runat="server" ForeColor="Red" EnableViewState="false"></asp:Label>
        <br />--%>
        <%--<asp:Button ID="btnSignUp" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" EnableViewState="false" />--%>
   <%--     <asp:Button text=" Sign Up " Class="btn btn-danger btn-block" runat="server" ID="btnSignUp" OnClick="btnSignUp_Click"/>
    </div>
</form>--%>



