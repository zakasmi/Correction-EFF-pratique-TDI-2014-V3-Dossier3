<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="GestionAssurance_ASP.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 253px;
    }
    .auto-style3 {
        width: 236px;
    }
    .auto-style4 {
        width: 236px;
        height: 30px;
    }
    .auto-style5 {
        width: 253px;
        height: 30px;
    }
    .auto-style6 {
        height: 30px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style2">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style4">
            <asp:Label ID="Label1" runat="server" Text="Matricule"></asp:Label>
        </td>
        <td class="auto-style5">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
        <td class="auto-style6">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Afficher" Width="85px" />
        </td>
    </tr>
    <tr>
        <td class="auto-style3">&nbsp;</td>
        <td class="auto-style2">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">
            <asp:Label ID="Label2" runat="server" Text="Nombre Dossier Rembourse "></asp:Label>
        </td>
        <td class="auto-style2">
            <asp:Label ID="Label3" runat="server" Text="0"></asp:Label>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">
            <asp:Label ID="Label4" runat="server" Text="Nombre Dossier Non Rembourse"></asp:Label>
        </td>
        <td class="auto-style2">
            <asp:Label ID="Label5" runat="server" Text="0"></asp:Label>
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
