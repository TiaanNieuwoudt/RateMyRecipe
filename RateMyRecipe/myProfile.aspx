<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="myProfile.aspx.cs" Inherits="RateMyRecipe.myProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">

        <h2>My Profile</h2>

        <asp:ListView ID="profile_info_listview" runat="server" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                    </td>
                    <td>
                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="securityAnswerLabel" runat="server" Text='<%# Eval("securityAnswer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="securityQuestionLabel" runat="server" Text='<%# Eval("securityQuestion") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="firstnameTextBox" runat="server" Text='<%# Bind("firstname") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="lastnameTextBox" runat="server" Text='<%# Bind("lastname") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="securityAnswerTextBox" runat="server" Text='<%# Bind("securityAnswer") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="securityQuestionTextBox" runat="server" Text='<%# Bind("securityQuestion") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="firstnameTextBox" runat="server" Text='<%# Bind("firstname") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="lastnameTextBox" runat="server" Text='<%# Bind("lastname") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="securityAnswerTextBox" runat="server" Text='<%# Bind("securityAnswer") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="securityQuestionTextBox" runat="server" Text='<%# Bind("securityQuestion") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                    </td>
                    <td>
                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="securityAnswerLabel" runat="server" Text='<%# Eval("securityAnswer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="securityQuestionLabel" runat="server" Text='<%# Eval("securityQuestion") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;
                                    border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server">username</th>
                                    <th runat="server">firstname</th>
                                    <th runat="server">lastname</th>
                                    <th runat="server">email</th>
                                    <th runat="server">securityAnswer</th>
                                    <th runat="server">securityQuestion</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                    </td>
                    <td>
                        <asp:Label ID="firstnameLabel" runat="server" Text='<%# Eval("firstname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lastnameLabel" runat="server" Text='<%# Eval("lastname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="securityAnswerLabel" runat="server" Text='<%# Eval("securityAnswer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="securityQuestionLabel" runat="server" Text='<%# Eval("securityQuestion") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:rate_my_recipeConnectionString4 %>" 
            SelectCommand="SELECT [username], [firstname], [lastname], [email], [securityAnswer], [securityQuestion] FROM [Users] WHERE ([Id] = @Id)">
            <SelectParameters>
                <asp:CookieParameter CookieName="userId" Name="Id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>


    </div>

    <div class="jumbotron">

        <asp:Label ID="messageLabelUsername" runat="server" Text="Editing Username will result the session to end. Relog to continue."></asp:Label>
        <br />
        <br />
        <asp:Label ID="edit_username_label" runat="server" Text="Edit Username"></asp:Label>
                <br />
        <br />
        <asp:TextBox ID="edit_username_textbox" runat="server"></asp:TextBox>
        <br />
        <br />

        <asp:Label ID="edit_firstname_label" runat="server" Text="Edit First Name"></asp:Label>
                <br />
        <br />
        <asp:TextBox ID="edit_firstname_textbox" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="edit_surname_label" runat="server" Text="Edit Last Name"></asp:Label>
                <br />
        <br />
        <asp:TextBox ID="edit_surname_textbox" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="edit_email_label" runat="server" Text="Edit Email Address"></asp:Label>
                <br />
        <br />
        <asp:TextBox ID="edit_email_textBox" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="submit_userchanges" runat="server" Text="Submit Changes" OnClick="submit_userchanges_Click" />
    </div>
    <div class="jumbotron">
        <asp:Label ID="message_password_label" runat="server" Text="Changing your password will require you to login again."></asp:Label>     
        <br />
        <br />
        <asp:Label ID="current_password" runat="server" Text="Current Password"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="current_password_textbox" runat="server"></asp:TextBox>&nbsp;&nbsp;<asp:Label ID="empty_password_label" 
            runat="server" Text="Password Cannot be empty" Visible="False" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <asp:Label ID="new_password_label" runat="server" Text="New Password"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="new_password_textbox" runat="server"></asp:TextBox> &nbsp;&nbsp; <asp:Label ID="empty_newpassword_label" 
            runat="server" Text="Password Cannot be empty" Visible="False" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Confirm_new_password_label" runat="server" Text="Confirm New Password"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="Confirm_new_password_textbox" runat="server"></asp:TextBox>&nbsp;&nbsp;<asp:Label ID="empty_confirm_password_label" 
            runat="server" Text="Password Cannot be empty" Visible="False" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <asp:Button ID="submit_password_button" runat="server" Text="Submit New password" OnClick="submit_password_button_Click" />
    </div>

    <div class="jumbotron">

        <asp:Label ID="Security_question_listbox_label" runat="server" Text="Security Questions"></asp:Label>

        <br />
        <br />
        <asp:DropDownList ID="security_questions_dropdown" runat="server">
            <asp:ListItem>What is your moms first name?</asp:ListItem>
            <asp:ListItem>What is your first dog&#39;s name</asp:ListItem>
            <asp:ListItem>What is your favourite color?</asp:ListItem>
            <asp:ListItem>What is your uncles middle Name?</asp:ListItem>
            <asp:ListItem>What is your favourite number?</asp:ListItem>
        </asp:DropDownList>

        <br />
        <br />
        <asp:Label ID="change_security_answer_label" runat="server" Text="Type an answer for your Security Question"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="change_security_answer_texbox" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="submit_security_Settings" runat="server" Text="Submit Settings" OnClick="submit_security_Settings_Click" />
        <br />
        <br />
        <asp:Label ID="change_security_info_result" runat="server" Text="Security Info changed" Visible="False"></asp:Label>
        

    </div>

</asp:Content>
