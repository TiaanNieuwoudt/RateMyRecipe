//------------------------------------------------------
// Author: Tiaan Nieuwoudt
// Date: 15 March 2021
// File: addRecipe.aspx.cs
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
    public partial class addRecipe : System.Web.UI.Page
    {

        //Checked if user is logged in
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


        //Add recipe, validation is done by validation controls
        protected void add_recipe_button_Click(object sender, EventArgs e)
        {
            UserServicesSoapClient ws = new UserServicesSoapClient();
            int totalRatings = 0;
            int rating = 0;
            decimal avgRating = 0;

            string username = Request.Cookies["User"].Value;
            int userID = ws.getUserID(username);
            Console.WriteLine(userID);
            byte[] ingredients_bytes = System.Text.Encoding.ASCII.GetBytes(add_recipe_intgredients_textbox.Text);
            recipeAdded_label.Text = ingredients_bytes.ToString();
            byte[] method_bytes = System.Text.Encoding.ASCII.GetBytes(add_recipe_method_textbox.Text);
            ws.InsertRecipeService(add_recipe_name_textbox.Text, add_recipe_intgredients_textbox.Text, add_recipe_method_textbox.Text, userID, totalRatings, rating, avgRating);
            recipeAdded_label.Text = "Recpie Added";
        }
    }
}