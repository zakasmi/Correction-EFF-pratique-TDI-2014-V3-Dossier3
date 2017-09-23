using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestionAssurance_ASP
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label NumDossier = (Label)GridView1.Rows[e.RowIndex].Cells[0].FindControl("IT_NumDossier");
            int numdoss = int.Parse(NumDossier.Text);

            SqlCommand cmd = new SqlCommand("delete from Dossier where NumDossier=@NumDos", Provider.cnx);
            cmd.Parameters.AddWithValue("@NumDos",numdoss);
            Provider.cnx.Open();
            cmd.ExecuteNonQuery();
            Provider.cnx.Close();
            LBL_Info.Text = "Le dossier est Supprimer avec succes";
            GridView1.DataSource = null;
            Response.Redirect(Request.RawUrl);
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                Label NumDossier = (Label)GridView1.Rows[e.RowIndex].Cells[0].FindControl("Label1");
                TextBox DateDepot = (TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("TB_DateDepot");
                TextBox Montant_Remboursement = (TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]; ;
                TextBox Date_Traitement = (TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0];
                TextBox Lien_Malade = (TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]; ;
                TextBox Matricule = (TextBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0];
                DropDownList Num_Maladie = (DropDownList)GridView1.Rows[e.RowIndex].Cells[6].FindControl("DropDownList1");
                TextBox Total_Dossier = (TextBox)GridView1.Rows[e.RowIndex].Cells[7].Controls[0];
                float x, y;
                if (!float.TryParse(Total_Dossier.Text,out x)) {
                    Total_Dossier.Text = "0";
                }
                if (!float.TryParse(Montant_Remboursement.Text, out y))
                {
                    Montant_Remboursement.Text = "0";
                }


                SqlCommand cmd = new SqlCommand("update Dossier set DateDepot = @DateDepot, Montant_Remboursement = @Montant_Remboursement , Date_Traitement = @Date_Traitement ,Lien_Malade = @Lien_Malade,Matricule = @Matricule,Num_Maladie=@Num_Maladie,Total_Dossier=@Total_Dossier where NumDossier=@NumDos", Provider.cnx);
                cmd.Parameters.AddWithValue("@NumDos", int.Parse(NumDossier.Text));
                cmd.Parameters.AddWithValue("@DateDepot", DateDepot.Text);
                cmd.Parameters.AddWithValue("@Montant_Remboursement", float.Parse(Montant_Remboursement.Text));
                cmd.Parameters.AddWithValue("@Date_Traitement", Date_Traitement.Text);
                cmd.Parameters.AddWithValue("@Lien_Malade", Lien_Malade.Text);
                cmd.Parameters.AddWithValue("@Matricule", Matricule.Text);
                cmd.Parameters.AddWithValue("@Num_Maladie", int.Parse(Num_Maladie.Text));
                cmd.Parameters.AddWithValue("@Total_Dossier", float.Parse(Total_Dossier.Text));
                Provider.cnx.Open();
                cmd.ExecuteNonQuery();
                Provider.cnx.Close();
                LBL_Info.Text = "Le dossier est Modifier avec succes";
                GridView1.DataSource = null;
            }
            catch (Exception e1)
            {

                LBL_Info.Text = e1.Message; 
            }
            Response.Redirect(Request.RawUrl);
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            TB_INfo.Enabled = false;
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            TB_INfo.Enabled = true;
        }

        protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
        {
            TB_INfo.Enabled = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (RadioButton1.Checked == true)
            {
                Response.Redirect(Request.RawUrl);
            }
            else if (RadioButton2.Checked == true)
            {
                SqlDataSource1.SelectCommand = "select *from Dossier where NumDossier='" + TB_INfo.Text + "'";
                GridView1.DataBind();

            }
            else if (RadioButton3.Checked == true)
            {
                SqlDataSource1.SelectCommand = "select *from Dossier where Matricule='" + TB_INfo.Text + "'";
            
                GridView1.DataBind();
            }
            }
    }
}