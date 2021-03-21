//------------------------------------------------------
// Author: Tiaan Nieuwoudt
// Date: 15 March 2021
// File: SecurityQuestions.aspx.cs
//-------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RateMyRecipe.dbServices;

namespace RateMyRecipe
{
    public partial class SecurityQuestions : System.Web.UI.Page
    {

        //Calling Web services and ensure that the user is logged in.
        UserServicesSoapClient ws = new UserServicesSoapClient();

        string username;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.Cookies["LoggedIn"] != null && Request.Cookies["LoggedIn"].Value == "true")
            {
                UserServicesSoapClient ws = new UserServicesSoapClient();
                string username = Request.Cookies["User"].Value;
                int userID = ws.getUserID(username);
            }
            else
            {
                Response.Redirect("Index.aspx");
            }


        }

        //Submitting Username
        protected void forgot_password_submit_username_button_Click(object sender, EventArgs e)
        {

            username = forgot_password_username_textbox.Text;
            if (ws.getSecurityQuestuion(username) != null)
            {
                string answer = security_answer_textbox.Text;
                select_question_label.Text = ws.getSecurityQuestuion(username);
            }
            else
            {
                select_question_label.Text = "Username not found";
            }

        }


        //Submitting answer to security qeustion and validation
        protected void submit_security_answer_button_Click(object sender, EventArgs e)
        {

            username = forgot_password_username_textbox.Text;
            string security_answer = ws.validateSecurityQuestion(username);
            string typed_answer = security_answer_textbox.Text;

            if(security_answer == typed_answer)
            {
                HttpCookie savedUsername = new HttpCookie("savedUsername", username);
                Response.Cookies.Add(savedUsername);
                Response.Redirect("resetPassword.aspx");
            }

            else
            {
                forgot_password_result_label.Text = "Incorrect answer";
            }

        }
    }
}