//------------------------------------------------------
// Author: Tiaan Nieuwoudt
// Date: 15 March 2021
// File: Default.aspx.cs
//-------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RateMyRecipe
{
    public partial class _Default : Page
    {

        //Check if user is logged in
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["LoggedIn"] != null && Request.Cookies["LoggedIn"].Value == "false")
            {
                Response.Redirect("Index.aspx");
            }
        }
    }
}