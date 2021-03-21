<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addRecipe.aspx.cs" Inherits="RateMyRecipe.addRecipe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">

    <asp:Label ID="add_recipe_name_label" runat="server" Text="Recipe Name"></asp:Label>
    &nbsp;
    <asp:TextBox ID="add_recipe_name_textbox" runat="server" Height="29px" Width="350px"></asp:TextBox>
    <br /><br />
    <asp:Label ID="add_recipe_intgredients_label" runat="server" Text="Intgredients"></asp:Label>
    &nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="add_recipe_intgredients_textbox" runat="server" Height="107px" Width="354px"></asp:TextBox>
    <br /><br />
    <asp:Label ID="add_recipe_method_label" runat="server" Text="Method"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="add_recipe_method_textbox" runat="server" Height="115px" Width="354px"></asp:TextBox>
    <br /><br />

    <asp:Button ID="add_recipe_button" runat="server" Text="Add Recipe" OnClick="add_recipe_button_Click" />
    <br />
    <br />

    <asp:Label ID="recipeAdded_label" runat="server" Text="Recipe Added"></asp:Label>
        </div>

</asp:Content>
