using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using RateMyRecipe.dbServices;


namespace RateMyRecipe
{
    public partial class Register : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void register_button_click(object sender, EventArgs e)
        {
            UserServicesSoapClient ws = new UserServicesSoapClient();

            string security_question = security_questions_listbox.SelectedValue;
            string security_answer = security_question_answer_textbox.Text;

            if(ws.RegisterUserService(register_username_textbox.Text, register_password_textbox.Text, register_email_textbox.Text, 
                name_textbox.Text, surname_textbox.Text, security_question, security_answer) == false)
            {
                register_result_label.Visible = true;
            }
            else
            {
                Response.Redirect("Index.aspx");
            }
            
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}