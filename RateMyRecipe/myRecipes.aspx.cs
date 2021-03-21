//------------------------------------------------------
// Author: Tiaan Nieuwoudt
// Date: 15 March 2021
// File: myrecipes.aspx.cs
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
    public partial class myRecipes : System.Web.UI.Page
    {

        
        protected void Page_Load(object sender, EventArgs e)
        {
            //Check if user is logged in
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


        //Edit recipe Name
        protected void edit_name_button_Click(object sender, EventArgs e)
        {
            UserServicesSoapClient ws = new UserServicesSoapClient();
            if (recipe_edit_textbox.Text != "")
            {
                ws.updateRecipeName(int.Parse(recipe_edit_textbox.Text), edit_recipe_name_textbox.Text);
                Response.Redirect("myRecipes.aspx");
            }

        }

        //Edit recipe ingredients
        protected void edit_ingredients_button_Click(object sender, EventArgs e)
        {
            if (recipe_edit_textbox.Text != "")
            {
                UserServicesSoapClient ws = new UserServicesSoapClient();
                ws.updateRecipeEngredients(int.Parse(recipe_edit_textbox.Text), edit_recipe_ingredients_textbox.Text);
                Response.Redirect("myRecipes.aspx");
            }
        }

        //Edit Recipe Method
        protected void edit_method_button_Click(object sender, EventArgs e)
        {
            if (recipe_edit_textbox.Text != "")
            {
                UserServicesSoapClient ws = new UserServicesSoapClient();
                ws.updateRecipeMethod(int.Parse(recipe_edit_textbox.Text), edit_recipe_method_textbox.Text);
                Response.Redirect("myRecipes.aspx");
            }
        }

        protected void add_Recipe_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("addRecipe.aspx");
        }
    }
}