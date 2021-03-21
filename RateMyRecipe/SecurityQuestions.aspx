<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SecurityQuestions.aspx.cs" Inherits="RateMyRecipe.SecurityQuestions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="jumbotron">
    <h4>Please fill in your username before submitting your Your security answer.</h4>
        <br />
    <asp:Label ID="forgot_password_username_label" runat="server" Text="Username: "></asp:Label>&nbsp;&nbsp;
        <br />    <br />

    <asp:TextBox ID="forgot_password_username_textbox" runat="server"></asp:TextBox>
    <br />
    <br />

    <asp:Button ID="forgot_password_submit_username_button" runat="server" Text="Submit Username" OnClick="forgot_password_submit_username_button_Click" />

    <br />
    <br />

    <asp:Label ID="select_question_label" runat="server" Text=" "></asp:Label>&nbsp;&nbsp;
    <br />
    <br />
    <asp:TextBox ID="security_answer_textbox" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="submit_security_answer_button" runat="server" Text="Submit Security Answer" OnClick="submit_security_answer_button_Click" />
    <br />
    <br />
    <asp:Label ID="forgot_password_result_label" runat="server" Text=" "></asp:Label>
    <br />

    </div>

</asp:Content>
