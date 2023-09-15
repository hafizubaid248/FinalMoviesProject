<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="UpdatedOnlineMoviesProject.PresentationLayer.Movies" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"/>
  <link rel="stylesheet" href="/resources/demos/style.css"/>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>




     




    <title></title>


    <style>
      

#form1 {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
}

.form-group {
    margin-bottom: 15px;
}

label {
    display: block;
    font-weight: bold;
}

input[type="text"],
textarea,
input[type="date"],
select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
}


    </style>







</head>
<body>

      <form id="form1" runat="server">
      <div>
          <h1>Add Movie</h1>
          <%--<asp.Label ID="lblMessage" runat="server" ForeColor="Green" EnableViewState="false"></asp:Label>--%>
          
          <div>
              <label for="txtTitle">Title:</label>
              <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" Required="true"></asp:TextBox>
          </div>
          <div>
              <label for="txtDescription">Description:</label>
              <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
          </div>
          <div>
              <label for="txtReleaseDate">Release Date:</label>
              <asp:TextBox ID="txtReleaseDate" runat="server" CssClass="form-control" TextMode="Date" Required="true"></asp:TextBox>
          </div>
          <div>
              <label for="lbGenres">Genres:</label>
              <asp:ListBox ID="lbGenres" runat="server" CssClass="form-control" SelectionMode="Multiple">
                 
              </asp:ListBox>
          </div>
          <div>
                <asp:Button ID="Button1" runat="server" Text="Add Movie" OnClick="btnAddMovie_Click" EnableViewState="false" style="display: block; width: 100%; padding: 10px;  background-color: #007bff;    color: #fff;    border: none;    border-radius: 3px;    cursor: pointer;"/>
             
             <%-- <asp:Button ID="btnAddMovie" runat="server" Text="Add Movie" CssClass="btn btn-primary" OnClick="btnAddMovie_Click" />--%>
               <asp:Label ID="lblMessage" runat="server" ForeColor="Red" EnableViewState="false"></asp:Label>
          </div>
      </div>
  </form>















<%--   <form id="form1" runat="server">
        <div>
            <h2>Add Movies</h2>
         
          <asp:TextBox ID="txtTitle" runat="server" placeholder="Title" EnableViewState="false" Required="true"></asp:TextBox>
           <br />
            <asp:TextBox ID="txtDescription" runat="server" placeholder="Description" EnableViewState="false" TextMode="MultiLine" Rows="4" OnTextChanged="txtDescription_TextChanged"></asp:TextBox>
            <br /> 
            
               <div>
    


            <asp:TextBox ID="txtReleaseDate" runat="server" placeholder="Release Date (yyyy-MM-dd)" EnableViewState="false" Required="true"></asp:TextBox>
            <br />
           <%-- <asp:DropDownList ID="ddlGenres" runat="server" EnableViewState="false">
               
            </asp:DropDownList>--%>

      <%--    <asp:CheckBoxList ID="cblGenres" runat="server" EnableViewState="false">
   
</asp:CheckBoxList>--%>


            <%--                <asp:ListBox ID="lbGenres" runat="server" CssClass="form-control" SelectionMode="Multiple"> </asp:ListBox>--%>

            <%--<asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple" EnableViewState="false" >--%>
       <%--     <asp:ListBox ID="lbGenres" runat="server" SelectionMode="Multiple" EnableViewState="false" >
  
</asp:ListBox>



            <br />
           
            <asp:Button ID="btnAddMovie" runat="server" Text="Add Movie" OnClick="btnAddMovie_Click" EnableViewState="false" style="display: block; width: 100%; padding: 10px;  background-color: #007bff;    color: #fff;    border: none;    border-radius: 3px;    cursor: pointer;"/>
               
           
           
           <asp:Label ID="lblMessage" runat="server" ForeColor="Red" EnableViewState="false"></asp:Label>
        </div>
    </form>--%>
</body>
</html>
<%--  <script>
  $( function() {
      $("#txtReleaseDate").datepicker();
      buttonImage: "calendar.gif"
  } );
  </script>--%>

  