<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="GestionAssurance_ASP.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style4 {
            width: 38px;
        }
        .auto-style5 {
            width: 38px;
            height: 23px;
        }
        .auto-style6 {
            width: 553px;
            height: 23px;
        }
        .auto-style11 {
            width: 1771%;
        }
        .auto-style12 {
            width: 287px;
        }
        .auto-style13 {
            width: 71px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style5"></td>
            <td class="auto-style6"></td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="NumDossier" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView1_RowDeleting" Width="303px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="NumDossier" SortExpression="NumDossier">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("NumDossier") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="IT_NumDossier" runat="server" Text='<%# Bind("NumDossier") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="DateDepot" SortExpression="DateDepot">
                            <EditItemTemplate>
                                <asp:TextBox ID="TB_DateDepot" runat="server" Height="16px" Text='<%# Bind("DateDepot") %>' TextMode="Date" Width="152px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_DateDepot" ErrorMessage=" champs est requis" ForeColor="Red" Font-Bold="False">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("DateDepot") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Montant_Remboursement" HeaderText="Montant_Remboursement" SortExpression="Montant_Remboursement" />
                        <asp:BoundField DataField="Date_Traitement" HeaderText="Date_Traitement" SortExpression="Date_Traitement" />
                        <asp:BoundField DataField="Lien_Malade" HeaderText="Lien_Malade" SortExpression="Lien_Malade" />
                      
                        <asp:BoundField DataField="Matricule" HeaderText="Matricule" SortExpression="Matricule" />
                        <asp:TemplateField HeaderText="Num_Maladie" SortExpression="Num_Maladie">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Designation_Maladie" DataValueField="Num_Maladie" Height="17px" SelectedValue='<%# Bind("Num_Maladie") %>' Width="113px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="ce champs est requis" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GestAssuranceConnectionString %>" SelectCommand="SELECT * FROM [Maladie]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Num_Maladie") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Total_Dossier" HeaderText="Total_Dossier" SortExpression="Total_Dossier" />
                        <asp:CommandField ButtonType="Button" HeaderText="Supprimer" ShowDeleteButton="True" ShowHeader="True" />
                        <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                        <asp:CommandField ButtonType="Button" HeaderText="Select" ShowHeader="True" ShowSelectButton="True" />
                           
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
            </td>
            
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="LBL_Info" runat="server" Font-Bold="True" ForeColor="#00CC00" Text="Label"></asp:Label>
            &nbsp;&nbsp;&nbsp;
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" Height="44px" Width="283px" />
            </td>
      
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GestAssuranceConnectionString %>" SelectCommand="SELECT NumDossier, DateDepot, Montant_Remboursement, Date_Traitement, Lien_Malade, Matricule, Num_Maladie, Total_Dossier FROM Dossier">
                </asp:SqlDataSource>
            </td>
       
        </tr>
        <tr>
            <td class="auto-style5">
                <table class="auto-style11">
                    <tr>
                        <td class="auto-style12">
                            <asp:RadioButton ID="RadioButton1" runat="server" GroupName="filtrer" OnCheckedChanged="RadioButton1_CheckedChanged" Text="Tous" />
                            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="filtrer" OnCheckedChanged="RadioButton2_CheckedChanged" Text="NumDossier" />
                            <asp:RadioButton ID="RadioButton3" runat="server" GroupName="filtrer" OnCheckedChanged="RadioButton3_CheckedChanged" Text="Matricule" />
                        </td>
                        <td class="auto-style13">
                            <asp:TextBox ID="TB_INfo" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Filtrer" Width="104px" />
                        </td>
                      
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Num_Rubrique" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Num_Rubrique" HeaderText="Num_Rubrique" ReadOnly="True" SortExpression="Num_Rubrique" />
                        <asp:BoundField DataField="Nom_Rubrique" HeaderText="Nom_Rubrique" SortExpression="Nom_Rubrique" />
                        <asp:BoundField DataField="NumDossier" HeaderText="NumDossier" SortExpression="NumDossier" />
                        <asp:BoundField DataField="Montant_Rubrique" HeaderText="Montant_Rubrique" SortExpression="Montant_Rubrique" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <EmptyDataTemplate>
                        Pas De Rubrique pour Le Dossier Selectionnee
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                </td>
         
            
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GestAssuranceConnectionString %>" SelectCommand="SELECT * FROM [Rubrique] WHERE ([NumDossier] = @NumDossier)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="NumDossier" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
          
        </tr>
        </table>
</asp:Content>
