<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="recipes.aspx.cs" Inherits="RateMyRecipe.recipes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbrotron" style="border-style: none; border-width: thin; height: 548px">
        <div style="padding: 10px; float: left; width: 215px; background-color: #FFFFFF; height: 459px;">

            <h3>Recipes</h3>
            <asp:ListBox ID="recipes_listbox" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name" OnSelectedIndexChanged="recipes_listbox_SelectedIndexChanged" Width="186px" Height="284px"></asp:ListBox>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:rate_my_recipeConnectionString2 %>" SelectCommand="SELECT [name] FROM [Recipes]"></asp:SqlDataSource>
        </div>

        <div style="padding: 10px; float: left; background-color: #FFFFFF; width: 368px; height: 460px;">

            <asp:Label ID="recipe_owner_label" runat="server" Text="Recipe Owner"></asp:Label>&nbsp;:&nbsp;<asp:Label ID="recipe_owner_label_2" runat="server" Text="Label"></asp:Label>

            <br />
            <br />
            <asp:Label ID="recipe_ingredietns_label" runat="server" Text="Ingredients: "></asp:Label>&nbsp;
            <br />
            <asp:TextBox style="resize:none" ID="ingredientsTextArea" runat="server" Enabled="False" Height="160px" ReadOnly="True" TextMode="MultiLine" Width="247px"></asp:TextBox>
            <br />
            <asp:Label ID="recipe_method_label" runat="server" Text="Method: "></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <br />
            <asp:TextBox style="resize:none" ID="methodTextArea" runat="server" Height="113px" ReadOnly="True" TextMode="MultiLine" Width="238px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="recipe_rating_label" runat="server" Text="Rating: "></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Image ID="star_1" runat="server" Height="30px" Width="30px" ImageUrl="~/star.png" Visible="False" />
            <asp:Image ID="star_2" runat="server" Height="30px" Width="30px" ImageUrl="~/star.png" Visible="False" />
            <asp:Image ID="star_3" runat="server" Height="30px" Width="30px" ImageUrl="~/star.png" Visible="False" />
            <asp:Image ID="star_4" runat="server" Height="30px" Width="30px" ImageUrl="~/star.png" Visible="False" />
            <asp:Image ID="star_5" runat="server" Height="28px" Width="30px" ImageUrl="~/star.png" Visible="False" />

            <br /><br />
            <asp:Label ID="rate_recipe_label" runat="server" Text="Rate Recipe"></asp:Label>&nbsp;&nbsp;
            <br />
            <asp:DropDownList ID="selectRating_dropdown" runat="server" OnSelectedIndexChanged="select_rating_dropdown_changed" AutoPostBack="True">
                <asp:ListItem Value="1"></asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem Value="5"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="submit_rating_button" runat="server" Text="Submit Rating" OnClick="submit_rating_button_Click" />


        </div>

    </div>


</asp:Content>
