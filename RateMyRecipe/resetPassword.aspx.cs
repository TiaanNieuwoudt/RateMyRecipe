//------------------------------------------------------
// Author: Tiaan Nieuwoudt
// Date: 15 March 2021
// File: resetPassword.aspx.cs
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
    public partial class resetPassword : System.Web.UI.Page
    {

        //Saving cookies for resetting the user's password
        UserServicesSoapClient ws = new UserServicesSoapClient();
        string username;


        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Cookies["savedUsername"].Value != null)
            {
                username = Request.Cookies["savedUsername"].Value;
            }
            
        }

        // Submit new password for specified User
        protected void submit_new_password_button_Click(object sender, EventArgs e)
        {
            
            username = Request.Cookies["savedUsername"].Value;
            if (new_password_textbox.Text == confirm_password_textbox.Text)
            {
                ws.changePasswordByUsername(username, new_password_textbox.Text);
               Response.Redirect("login.aspx");
            }

        }
    }
}