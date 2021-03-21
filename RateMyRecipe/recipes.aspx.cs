using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RateMyRecipe.dbServices;
using System.Threading.Tasks;
using System.IO;
using System.Text;

namespace RateMyRecipe
{
    public partial class recipes : System.Web.UI.Page
    {
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


        protected void recipes_dropdown_TextChanged(object sender, EventArgs e)
        {

        }

        protected void recipes_listbox_SelectedIndexChanged(object sender, EventArgs e)
        {

            star_1.Visible = false;
            star_2.Visible = false;
            star_3.Visible = false;
            star_4.Visible = false;
            star_5.Visible = false;

            UserServicesSoapClient ws = new UserServicesSoapClient();
            ArrayList recipe = new ArrayList();
            foreach (object i in ws.get_recipe(recipes_listbox.SelectedValue))
            {
                recipe.Add(i);
            }
            ingredientsTextArea.Text = recipe[2].ToString();
            methodTextArea.Text = recipe[1].ToString();
            decimal recipe_rating = (decimal)recipe[3];
            recipe_owner_label_2.Text = recipe[4].ToString();

            if (recipe_rating > 0M && recipe_rating <0.2M)
            {
                star_1.Visible = true;
            }
            if (recipe_rating >= 0.2M && recipe_rating < 0.4M)
            {
                star_1.Visible = true;
                star_2.Visible = true;
            }
            if (recipe_rating >= 0.4M && recipe_rating < 0.6M)
            {
                star_1.Visible = true;
                star_2.Visible = true;
                star_3.Visible = true;
            }
            if (recipe_rating >= 0.6M && recipe_rating < 0.8M)
            {
                star_1.Visible = true;
                star_2.Visible = true;
                star_3.Visible = true;
                star_4.Visible = true;
            }
            if(recipe_rating >= 0.8M)
            {
                star_1.Visible = true;
                star_2.Visible = true;
                star_3.Visible = true;
                star_4.Visible = true;
                star_5.Visible = true;
            }



        }


        protected void select_rating_dropdown_changed(object sender, EventArgs e)
        {
            

        }

        protected void submit_rating_button_Click(object sender, EventArgs e)
        {
            int userId = Int32.Parse(Request.Cookies["userId"].Value);
            UserServicesSoapClient ws = new UserServicesSoapClient();
            if(ws.rate_recipe(recipes_listbox.SelectedValue, Int32.Parse(selectRating_dropdown.SelectedValue), userId) == true)
            {
                try
                {
                    //Pass the filepath and filename to the StreamWriter Constructor
                    StreamWriter sw = new StreamWriter("recipeRatingRecord.txt");
                    //Write a line of text
                    sw.WriteLine($"User Email: {ws.getEmail(userId).ToString()}  Recipe: {recipes_listbox.SelectedValue}  Rating: {selectRating_dropdown.SelectedValue}");
                    //Write a second line of text
                    //Close the file
                    sw.Close();
                }
                catch (Exception ee)
                {
                    Console.WriteLine("Exception: " + ee.Message);
                }

            }

        }
    }
}