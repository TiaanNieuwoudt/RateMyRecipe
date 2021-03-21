<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="resetPassword.aspx.cs" Inherits="RateMyRecipe.resetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbron">
        <br />
    <asp:Label ID="new_password_one_label" runat="server" Text="Enter new password"></asp:Label>
    <br />  
    <br />
    <asp:TextBox ID="new_password_textbox" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="new_password_two_label" runat="server" Text="Confirm Password"></asp:Label>
    <br />
    <br />
    <asp:TextBox ID="confirm_password_textbox" runat="server"></asp:TextBox>
    <br />
    <br />

    
    <asp:Button ID="submit_new_password_button" runat="server" Text="Submit" OnClick="submit_new_password_button_Click" />
    </div>

</asp:Content>
