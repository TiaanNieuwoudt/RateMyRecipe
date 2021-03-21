<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="RateMyRecipe.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="jumbotron">

    
<asp:Label ID="register_username_label" runat="server" Text="Username: "></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="register_username_textbox" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="register_email_required_validator" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="register_username_textbox" Display="Dynamic" EnableTheming="False" ForeColor="Red" 
        OnDataBinding="register_button_click">Email Address Manditory</asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="register_password_label" runat="server" Text="Password: "></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="register_password_textbox" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:RequiredFieldValidator ID="register_password_required_validator" runat="server" ErrorMessage="Password Manditory" Display="Dynamic" 
         ControlToValidate="register_password_textbox" ForeColor="Red" OnDataBinding="register_button_click"></asp:RequiredFieldValidator>
    <br />
    <br />


    <asp:Label ID="email_address_label" runat="server" Text="Email Address: "></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="register_email_textbox" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="register_email_validator" runat="server" ErrorMessage="Email Address Manditory" Display="Dynamic" 
        ControlToValidate="register_email_textbox" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />

    <asp:Label ID="name_label" runat="server" Text="First Name: "></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="name_textbox" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="regsiter_name_validator" runat="server" ErrorMessage="Name Manditory" Display="Dynamic" 
        ControlToValidate="name_textbox" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />

    <asp:Label ID="surname_label" runat="server" Text="Surname: "></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="surname_textbox" runat="server"></asp:TextBox>&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="surname_validator" runat="server" ErrorMessage="Surname Manditory" Display="Dynamic" 
        ControlToValidate="surname_textbox" ForeColor="Red"></asp:RequiredFieldValidator>

    <br />
    
    <br />
    <br />

    

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RateMyRecipeConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>

    <asp:DropDownList ID="security_questions_listbox" runat="server" AutoPostBack="True" Height="16px" Width="359px">
        <asp:ListItem>What is your moms First Name?</asp:ListItem>
        <asp:ListItem>What was your first dogs name</asp:ListItem>
        <asp:ListItem>What is your favourite color?</asp:ListItem>
        <asp:ListItem>What is your uncles Middle Name?</asp:ListItem>
        <asp:ListItem>What is your favourite Number?</asp:ListItem>
    </asp:DropDownList>
        <br />
    <br />

    <asp:TextBox ID="security_question_answer_textbox" runat="server" Width="334px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="validate_security_answer" runat="server" ErrorMessage="Field Required" ControlToValidate="security_question_answer_textbox" ForeColor="#FF3300"></asp:RequiredFieldValidator>
        <br />
    <br />
    <asp:Button class="btn btn-primary btn-lg" ID="register_button" runat="server" OnClick="register_button_click" Text="Register" />
    <br />
    <br />
    <asp:Label ID="register_result_label" runat="server" Text="Register Failed, Username Exists" Visible="False"></asp:Label>
</div>


</asp:Content>
