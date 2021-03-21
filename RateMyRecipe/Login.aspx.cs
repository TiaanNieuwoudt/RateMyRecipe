//------------------------------------------------------
// Author: Tiaan Nieuwoudt
// Date: 15 March 2021
// File: Login.aspx.cs
//-------------------------------------------------------


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using RateMyRecipe.dbServices;

namespace RateMyRecipe
{
    public partial class Login : System.Web.UI.Page
    {


        //Change Login cookie to false
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["LoggedIn"] != null && Request.Cookies["LoggedIn"].Value == "true")
            {
                Response.Cookies["LoggedIn"].Value = "false";
            }
        }

        // Login on user uplon click Logon button
        protected void login_button_click(object sender, EventArgs e)
        {

            if (Request.Cookies["LoggedIn"] != null && Request.Cookies["LoggedIn"].Value == "true")
            {
                Request.Cookies["LoggedIn"].Value = "false";
            }
                UserServicesSoapClient login_ws = new UserServicesSoapClient();
                if (login_ws.userLogin(username_textbox.Text, password_textbox.Text) == false)
                {
                    login_label.Visible = true;
                }

                //USer logged in successfully
                else
                {
                    HttpCookie loggedInCookie = new HttpCookie("LoggedIn", "true");
                    Response.Cookies.Add(loggedInCookie);



                    HttpCookie userCookie = new HttpCookie("User", username_textbox.Text);
                    Response.Cookies.Add(userCookie);

                    string username = username_textbox.Text;
                    int userId = login_ws.getUserID(username);
                    HttpCookie userIdCookie = new HttpCookie("userId", userId.ToString());
                    Response.Cookies.Add(userIdCookie);

                    Response.Redirect("MyRecipes.aspx");
                }
            



        }

        //Forgot password functionality
        protected void forgot_password_butotn_Click(object sender, EventArgs e)
        {
            Response.Redirect("securityQuestions.aspx");
        }
    }
}