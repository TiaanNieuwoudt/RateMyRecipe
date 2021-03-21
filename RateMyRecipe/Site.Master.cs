using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RateMyRecipe
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void logout_button_click(object sender, EventArgs e)
        {
            if (Request.Cookies["LoggedIn"] != null && Request.Cookies["LoggedIn"].Value == "true")
            {

                Response.Cookies["User"].Value = null;
                Response.Cookies["userId"].Value = null;
                
                Response.Cookies["LoggedIn"].Value = "false";
                Response.Redirect("Login.aspx");
            }
        }
    }
}