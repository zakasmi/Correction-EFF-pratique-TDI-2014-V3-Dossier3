using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestionAssurance_ASP
{
    public partial class Connexion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                try
                {
                    Provider.Remplire("select A.* ,E.Num_Entreprise,E.Nom_Entreprise,E.Adresse from Assure A inner join Entreprise E on E.Num_Entreprise = A.Num_Entreprise where Matricule='" + TB_Matricule.Text + "' and Mot_DePasse='" + TB_MotPass.Text + "'", "Assure1");
                    if (Provider.ds.Tables["Assure1"].Rows.Count > 0)
                    {
                        Session["Matricule"] = TB_Matricule.Text;
                        Response.Redirect("~/Accueil.aspx");
                    }
                    else Label3.Text = "Matricule ou mot de passe incorrect";
                }
                catch (Exception e1)
                {

                    Label3.Text = e1.Message;
                }
            }
        }
    }
}