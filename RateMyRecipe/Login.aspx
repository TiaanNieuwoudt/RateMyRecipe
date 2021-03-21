<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RateMyRecipe.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <asp:Label ID="username_label" runat="server" Text="Username: "></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
    <asp:TextBox ID="username_textbox" runat="server"></asp:TextBox>&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="email_required_validator" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="username_textbox" Display="Dynamic" 
        EnableTheming="False" ForeColor="Red" OnDataBinding="login_button_click">Username Manditory</asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="password_label" runat="server" Text="Password: "></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="password_textbox" runat="server"></asp:TextBox>&nbsp;&nbsp;
     <asp:RequiredFieldValidator ID="password_required_validator" runat="server" ErrorMessage="Password Manditory" Display="Dynamic" ControlToValidate="password_textbox" 
         ForeColor="Red" OnDataBinding="login_button_click"></asp:RequiredFieldValidator>
    <br />
   
    <br />
    <asp:Button class="btn btn-primary btn-lg" ID="login_button" runat="server" OnClick="login_button_click" Text="Login" />
    <br />
    <br />
    <asp:Label ID="login_label" runat="server" Text="Login Failed" Visible="False" ForeColor="Black"></asp:Label>
    <br />
    <br />
    <asp:Button class="btn btn-primary btn-sm"  ID="forgot_password_butotn" runat="server" Text="Forgot Password" OnClick="forgot_password_butotn_Click" CausesValidation="False" />

</asp:Content>
