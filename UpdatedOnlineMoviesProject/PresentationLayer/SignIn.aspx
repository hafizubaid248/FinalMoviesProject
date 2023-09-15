<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="UpdatedOnlineMoviesProject.PresentationLayer.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    

    <style>
        /* Add your custom CSS styles here */
.signin-container {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
    margin-top: 27vh;
}

.form-group {
    margin-bottom: 15px;
}
/* form{
    width: 90vh;
    margin: auto;
} */

label {
    display: block;
    font-weight: bold;
}

input[type="text"],
input[type="password"],
input[type="email"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

#btnSignIn {
    display: block;
    width: 100%;
    padding: 10px;
    background-color: #059629;
    color: #fff;
    border: none;
    border-radius: 3px;
    cursor: pointer;
}

#lblMessage {
    margin-top: 10px;
    color: green;
    font-weight: bold;
}


    </style>






</head>
<body>
     <div class="signin-container">
        <h2>User Sign In</h2>
   <form id="form1" runat="server">
        <div>
            <%--<h2>Sign In</h2>--%>
         
            <div>

           <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" EnableViewState="false" Required="true"></asp:TextBox>
            <br />
                <br />
   
                 </div>
            <div>

           
            
            <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" EnableViewState="false" TextMode="Password" Required="true"></asp:TextBox>
            <br />
                <br />

                 </div>
            <asp:Button ID="btnSignIn" runat="server" Text="Sign In" OnClick="btnSignIn_Click" EnableViewState="false" />
            <br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" EnableViewState="false"></asp:Label>
        </div>
       </form>
</body>
</html>
