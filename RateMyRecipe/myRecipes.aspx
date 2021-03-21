<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="myRecipes.aspx.cs" Inherits="RateMyRecipe.myRecipes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron" draggable="false" style="overflow: auto; height: 324px;">
        <h2>My Recipes</h2>
        <br />
        <asp:DataList ID="recipe_datalist" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource1" 
            ForeColor="Black" GridLines="Both" HorizontalAlign="Left" Width="433px" Height="150px" DataKeyField="Id">
            <EditItemStyle BorderStyle="None" />
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="White" />
            <ItemTemplate>
                Id:
                <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                <br />
                name:
                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                <br />
                ingredients:
                <asp:Label ID="ingredientsLabel" runat="server" Text='<%# Eval("ingredients") %>' />
                <br />
                method:
                <asp:Label ID="methodLabel" runat="server" Text='<%# Eval("method") %>' />
                <br />
                totalRatings:
                <asp:Label ID="totalRatingsLabel" runat="server" Text='<%# Eval("totalRatings") %>' />
                <br />
                avgRating:
                <asp:Label ID="avgRatingLabel" runat="server" Text='<%# Eval("avgRating") %>' />
                <br />
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:rate_my_recipeConnectionString %>" 
            SelectCommand="SELECT [Id], [name], [ingredients], [method], [totalRatings], [avgRating] FROM [Recipes] WHERE ([ownerId] = @ownerId)">
            <SelectParameters>
                <asp:CookieParameter CookieName="userId" Name="ownerId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </div>

    <div class="jumbotron">

        <asp:Button ID="add_Recipe_button" runat="server" Text="Add New Recipe" OnClick="add_Recipe_button_Click" />

        <h2>Edit Recipe</h2>
        <asp:Label ID="edit_recipe_id_label" runat="server" Text="Recipe ID you would like to edit"></asp:Label>&nbsp;&nbsp;
        <asp:TextBox ID="recipe_edit_textbox" runat="server" Width="34px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="edit_recipe_name_label" runat="server" Text="Edit Recipe Name"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="edit_recipe_name_textbox" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="edit_name_button" runat="server" Text="Edit Name" OnClick="edit_name_button_Click" />
        <br />
        <br />
        <asp:Label ID="edit_recipe_ingredients_label" runat="server" Text="Edit Recipe Engredients"></asp:Label>&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="edit_recipe_ingredients_textbox" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="edit_ingredients_button" runat="server" Text="Edit Ingredients" OnClick="edit_ingredients_button_Click" />
        <br />
        <br />
        <asp:Label ID="edit_recipe_method_label" runat="server" Text="Edit Recipe Name"></asp:Label>&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="edit_recipe_method_textbox" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="edit_method_button" runat="server" Text="Edit Method" OnClick="edit_method_button_Click" />
        <br />
        <br />
    </div>
    </asp:Content>
