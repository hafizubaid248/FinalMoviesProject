<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BrowseMovies.aspx.cs" Inherits="UpdatedOnlineMoviesProject.PresentationLayer.BrowseMovies" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <script type="text/javascript" src="../Models/jquery-1.8.3.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>




    <style>
        

#form1 {
    max-width: 600px;
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
}

.form-group {
    margin-bottom: 15px;
}



input[type="text"],
textarea,
input[type="date"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
}






.dataTables_wrapper {
    font-size: 12px;
}

    </style>
   
    
    <script type="text/javascript">
        $(document).ready(function () {
            $('#movieTable').DataTable(); movieTable
        });
    </script>

</head>
<body>



      <form id="form1" runat="server" >
        <h2>Browse Movies</h2>
        <div>
      <asp:GridView ID="movieTable" runat="server" AutoGenerateColumns="False">

            <%--<asp:GridView ID="movieTable" runat="server" AutoGenerateColumns="false" AutoGenerateSelectButton="True" OnSelectedIndexChanged="movieTable_SelectedIndexChanged">--%>
                <Columns>
        <asp:BoundField HeaderText="Movie ID" DataField="MovieID"/>
        <asp:BoundField HeaderText="Title" DataField="Title" />
        <asp:BoundField HeaderText="Description" DataField="Description" />
        <asp:BoundField HeaderText="Release Date" DataField="ReleaseDate" />
        <asp:BoundField HeaderText="Genre Names" DataField="GenreName" />
     <asp:TemplateField HeaderText="Action">
         <ItemTemplate>
             <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CommandName="AddToCart" CommandArgument='<%# Eval("MovieID") %>' OnCommand="btnAddToCart_Command" />
             <asp:Button ID="btnRemoveFromCart" runat="server" Text="Remove from Cart" CommandName="RemoveFromCart" CommandArgument='<%# Eval("MovieID") %>' OnCommand="btnRemoveFromCart_Command" />
         </ItemTemplate>
        </asp:TemplateField>
        <%--<asp:BoundField HeaderText="Cart ITems" DataField="AddToCart" />--%>
     


                    <%--<div class="col">--%>
    



    </Columns>
</asp:GridView>


    </form>
    </body>
</html>





  <%--  <form id="form1" runat="server">
        <h2>Browse Movies</h2>
        <div>
            <asp:GridView ID="gvMovies" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="MovieID" HeaderText="Movie ID" />
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="ReleaseDate" HeaderText="Release Date" />
                    <asp:BoundField DataField="GenreName" HeaderText="Genre" />
                </Columns>
            </asp:GridView>
        </div>
    </form>--%>

  
       <%-- <h2>Browse Movies</h2>
        <div>--%>
 <%--          <table id="movieTable" class="display">
    <thead>
        <tr>
            <th>Movie ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Release Date</th>
            <th>Genre</th>
        </tr>
    </thead>
    <tbody>
        <!-- Rows will be dynamically populated using DataTables -->
    </tbody>
</table>--%>
          <%--  <form>

           

            <asp:GridView ID="gvMovies" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="MovieID" HeaderText="Movie ID" />
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="ReleaseDate" HeaderText="Release Date" />
                    <asp:BoundField DataField="GenreName" HeaderText="Genre" />
                </Columns>
            </asp:GridView>
        </div>
     </form>--%>
    


