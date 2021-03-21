//------------------------------------------------------
// Author: Tiaan Nieuwoudt
// Date: 15 March 2021
// File: myProfile.aspx.cs
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
    public partial class myProfile : System.Web.UI.Page
    {

        //Validating Login, and saving cookies for functionality - User Redirected if not Logged In
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

        //Button to Commit changes made - Function checks Fields entered
        protected void submit_userchanges_Click(object sender, EventArgs e)
        {

            UserServicesSoapClient ws = new UserServicesSoapClient();
            string username = Request.Cookies["User"].Value;
            int userID = ws.getUserID(username);

            if(edit_email_textBox.Text != "")
            {
                ws.updateEmail(userID, edit_email_textBox.Text);
                Response.Redirect("myProfile.aspx");
            }

            if(edit_username_textbox.Text != "")
            {
                ws.updateUsername(userID, edit_username_textbox.Text);
                Response.Cookies["userId"].Value = null;
                Response.Cookies["User"].Value = null;
                Response.Cookies["LoggedIn"].Value = "false";
                Response.Redirect("Login.aspx");
            }



            if (edit_firstname_textbox.Text != "")
            {
                ws.updateFirstname(userID, edit_firstname_textbox.Text);
                Response.Redirect("myProfile.aspx");
            }


        }
        //Submit new password, validating current password and making sure all fields 
        // are entered. Editing current password when conditions are met.
        protected void submit_password_button_Click(object sender, EventArgs e)
        {
            empty_confirm_password_label.Visible = false;
            empty_newpassword_label.Visible = false;
            empty_password_label.Visible = false;

            int userID = Int32.Parse(Request.Cookies["userId"].Value);

            UserServicesSoapClient ws = new UserServicesSoapClient();
            string retrieved_password = ws.retrievePassword(userID);



            if (current_password_textbox.Text != "" && new_password_textbox.Text != "" && Confirm_new_password_textbox.Text != "") 
            {
                if (current_password_textbox.Text == retrieved_password)
                { 
                    if(new_password_textbox.Text == Confirm_new_password_textbox.Text)
                    {
                        ws.updatePassword(userID, Confirm_new_password_textbox.Text);
                        empty_confirm_password_label.Visible = true;
                        empty_confirm_password_label.Text = "Passwords changed";

                        Response.Cookies["userId"].Value = null;
                        Response.Cookies["User"].Value = null;
                        Response.Cookies["LoggedIn"].Value = "false";
                        Response.Redirect("Login.aspx");

                    }

                    //Passwords do not match
                    else
                    {
                        empty_confirm_password_label.Visible = true;
                        empty_confirm_password_label.Text = "Passwords must Match";
                        empty_newpassword_label.Text = "Passwords must Match";

                    }

                }
                //Incorrect current password
                else
                {
                    empty_password_label.Visible = true;
                    empty_confirm_password_label.Visible = false;
                    empty_newpassword_label.Visible = false;
                    empty_password_label.Text = "Incorrect Current password";
                }

            }
            //If any fields are left empty
            else
            {
                empty_newpassword_label.Text = "Please fill in all Fields";
                empty_newpassword_label.Visible = true;
            }

        }

        //Submitting  new Security info
        protected void submit_security_Settings_Click(object sender, EventArgs e)
        {
            string security_question = security_questions_dropdown.SelectedValue;
            int userId = Int32.Parse(Request.Cookies["userId"].Value);

            if(change_security_answer_texbox.Text != "")
            {
                UserServicesSoapClient ws = new UserServicesSoapClient();
                if(ws.changeSecurityInfo(security_question, change_security_answer_texbox.Text, userId) == true)
                {
                    change_security_info_result.Text = "Security info changed.";
                    change_security_info_result.Visible = true;
                }
                else
                {
                    change_security_info_result.Text = "Failed to change Security Information";
                    change_security_info_result.Visible = true;
                }
            }
            else
            {
                change_security_info_result.Text = "Security Answer is manditory.";
                change_security_info_result.Visible = true;
            }
            
        }
    }
}