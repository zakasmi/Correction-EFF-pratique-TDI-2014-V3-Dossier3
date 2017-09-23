using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestionAssurance_ASP
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (Session["Matricule"] != null)
                {
                    TB_Matricule.Text = Session["Matricule"].ToString();
                }
                else Response.Redirect("Connexion.aspx");

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource2.Insert();
                Label9.Text = "Dossier est Ajouté avec succes";
            }
            catch (Exception e1)
            {
                Label9.Text = e1.Message;
                
            }
        }
    }
}