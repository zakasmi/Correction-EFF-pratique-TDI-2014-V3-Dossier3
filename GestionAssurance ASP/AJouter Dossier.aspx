<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AJouter Dossier.aspx.cs" Inherits="GestionAssurance_ASP.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 144px;
        }
        .auto-style6 {
            height: 23px;
            width: 144px;
        }
        .auto-style11 {
            width: 144px;
            height: 36px;
        }
        .auto-style12 {
            width: 448px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:Label ID="Label1" runat="server" Text="NumDossier"></asp:Label>
            </td>
            <td class="auto-style12">
                <asp:TextBox ID="TB_NumDossier" runat="server" TextMode="Number" Width="128px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_NumDossier" ErrorMessage="NumDossier est requis" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:Label ID="Label2" runat="server" Text="DateDepot"></asp:Label>
            </td>
            <td class="auto-style12">
                <asp:TextBox ID="TB_DateDepot" runat="server" EnableTheming="False" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_DateDepot" ErrorMessage="Date Depot est requis" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:Label ID="Label3" runat="server" Text="Montant_Remboursement"></asp:Label>
            </td>
            <td class="auto-style12">
                <asp:TextBox ID="TB_Montant_Remboursement" runat="server" TextMode="Number">0</asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TB_Montant_Remboursement" ErrorMessage="Montant Remboursement est requis" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TB_Montant_Remboursement" ControlToValidate="TB_Total_Dossier" ErrorMessage="Montant Remboursement doit etre inferieur a montant total" ForeColor="Red" Operator="GreaterThanEqual">*</asp:CompareValidator>
            </td>
            <td class="auto-style6"></td>
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:Label ID="Label4" runat="server" Text="Date_Traitement"></asp:Label>
            </td>
            <td class="auto-style12">
                <asp:TextBox ID="TB_Date_Traitement" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TB_Date_Traitement" ErrorMessage="Date Traitement est requis" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="TB_DateDepot" ControlToValidate="TB_Date_Traitement" ErrorMessage="Date Depot doit etre inferieur a la date traitement" ForeColor="Red" Operator="GreaterThanEqual">*</asp:CompareValidator>
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:Label ID="Label5" runat="server" Text="Lien_Malade"></asp:Label>
            </td>
            <td class="auto-style12">
                <asp:DropDownList ID="DDL_Lien_Malade" runat="server">
                    <asp:ListItem>fils</asp:ListItem>
                    <asp:ListItem>conjoint</asp:ListItem>
                    <asp:ListItem>fille</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DDL_Lien_Malade" ErrorMessage="Lient Maladie  est requis" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:Label ID="Label6" runat="server" Text="Matricule"></asp:Label>
            </td>
            <td class="auto-style12">
                <asp:TextBox ID="TB_Matricule" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:Label ID="Label7" runat="server" Text="Num_Maladie"></asp:Label>
            </td>
            <td class="auto-style12">
                <asp:DropDownList ID="DDL_Num_Maladie" runat="server" DataSourceID="SqlDataSource1" DataTextField="Designation_Maladie" DataValueField="Num_Maladie" Height="16px" Width="117px">
                </asp:DropDownList>
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:Label ID="Label8" runat="server" Text="Total_Dossier"></asp:Label>
            </td>
            <td class="auto-style12">
                <asp:TextBox ID="TB_Total_Dossier" runat="server" TextMode="Number">0</asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TB_Total_Dossier" ErrorMessage="Total Dossier est requis" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GestAssuranceConnectionString %>" DeleteCommand="DELETE FROM [Dossier] WHERE [NumDossier] = @NumDossier" InsertCommand="INSERT INTO [Dossier] ([NumDossier], [DateDepot], [Montant_Remboursement], [Date_Traitement], [Lien_Malade], [Matricule], [Num_Maladie], [Total_Dossier]) VALUES (@NumDossier, @DateDepot, @Montant_Remboursement, @Date_Traitement, @Lien_Malade, @Matricule, @Num_Maladie, @Total_Dossier)" SelectCommand="SELECT * FROM [Dossier]" UpdateCommand="UPDATE [Dossier] SET [DateDepot] = @DateDepot, [Montant_Remboursement] = @Montant_Remboursement, [Date_Traitement] = @Date_Traitement, [Lien_Malade] = @Lien_Malade, [Matricule] = @Matricule, [Num_Maladie] = @Num_Maladie, [Total_Dossier] = @Total_Dossier WHERE [NumDossier] = @NumDossier">
                    <DeleteParameters>
                        <asp:Parameter Name="NumDossier" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="TB_NumDossier" DefaultValue="100" Name="NumDossier" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="TB_DateDepot" DbType="Date" DefaultValue="" Name="DateDepot" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TB_Montant_Remboursement" Name="Montant_Remboursement" PropertyName="Text" Type="Double" />
                        <asp:ControlParameter ControlID="TB_Date_Traitement" DbType="Date" Name="Date_Traitement" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DDL_Lien_Malade" Name="Lien_Malade" PropertyName="SelectedValue" Type="String" DefaultValue="" />
                        <asp:SessionParameter Name="Matricule" SessionField="Matricule" Type="String" />
                        <asp:ControlParameter ControlID="DDL_Num_Maladie" Name="Num_Maladie" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="TB_Total_Dossier" Name="Total_Dossier" PropertyName="Text" Type="Double" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter DbType="Date" Name="DateDepot" />
                        <asp:Parameter Name="Montant_Remboursement" Type="Double" />
                        <asp:Parameter DbType="Date" Name="Date_Traitement" />
                        <asp:Parameter Name="Lien_Malade" Type="String" />
                        <asp:Parameter Name="Matricule" Type="String" />
                        <asp:Parameter Name="Num_Maladie" Type="Int32" />
                        <asp:Parameter Name="Total_Dossier" Type="Double" />
                        <asp:Parameter Name="NumDossier" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td class="auto-style12"></td>
            <td class="auto-style11"></td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style12">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ajouter" />
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GestAssuranceConnectionString %>" SelectCommand="SELECT * FROM [Maladie]"></asp:SqlDataSource>
            </td>
            <td class="auto-style12">
                <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="#006600"></asp:Label>
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style12">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
