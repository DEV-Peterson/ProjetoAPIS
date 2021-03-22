<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadUsuario.aspx.cs" Inherits="ProjetoAPIS.cadUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Cadastro de Usuário</h1>

            <label>Nome</label>
            <br />
            <asp:TextBox ID="txtNome" runat="server"></asp:TextBox>
            <br />
            <label>CEP</label>
            <br />
            <asp:TextBox ID="txtCEP" runat="server"></asp:TextBox>
            <asp:Button ID="btnCEP" runat="server" Text="Consultar CEP" OnClick="btnCEP_Click" />
            <br />
            <label>Endereço</label>
            <br />
            <asp:TextBox ID="txtEndereço" runat="server"></asp:TextBox>
            <br />
            <label>Bairro</label>
            <br />
            <asp:TextBox ID="txtBairro" runat="server"></asp:TextBox>
            <br />
            <label>Cidade</label>
            <br />
            <asp:TextBox ID="txtCidade" runat="server"></asp:TextBox>
            <br />
            <label>UF</label>
            <br />
            <asp:TextBox ID="txtUF" runat="server"></asp:TextBox>
            <br />
            <label>E-mail</label>
            <br />
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <br />
            <label>Senha</label>
            <br />
            <asp:TextBox ID="txtSenha" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:FileUpload ID="fpFoto" runat="server" />
            <br />
            <asp:Button ID="btnCadastrar" runat="server" Text="Register" OnClick="btnCadastrar_Click" />
            <asp:Button ID="btnBack" runat="server" Text="Home" OnClick="btnBack_Click" />

            <asp:GridView ID="gridUsuario" runat="server" AutoGenerateColumns="false" DataKeyNames="Codigo" DataSourceID="SqlDataSource1" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                <Columns>
                    <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                    <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" InsertVisible="False" SortExpression="Codigo"></asp:BoundField>
                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome"></asp:BoundField>
                    <asp:BoundField DataField="Endereco" HeaderText="Endereco" SortExpression="Endereco"></asp:BoundField>
                    <asp:BoundField DataField="Bairro" HeaderText="Bairro" SortExpression="Bairro"></asp:BoundField>
                    <asp:BoundField DataField="Cidade" HeaderText="Cidade" SortExpression="Cidade"></asp:BoundField>
                    <asp:BoundField DataField="UF" HeaderText="UF" SortExpression="UF"></asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                    <asp:BoundField DataField="Senha" HeaderText="Senha" SortExpression="Senha"></asp:BoundField>
                    <asp:BoundField DataField="nomeFoto" HeaderText="nomeFoto" SortExpression="nomeFoto"></asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#CCCC99"></FooterStyle>

                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White"></HeaderStyle>

                <PagerStyle HorizontalAlign="Right" BackColor="#F7F7DE" ForeColor="Black"></PagerStyle>

                <RowStyle BackColor="#F7F7DE"></RowStyle>

                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                <SortedAscendingCellStyle BackColor="#FBFBF2"></SortedAscendingCellStyle>

                <SortedAscendingHeaderStyle BackColor="#848384"></SortedAscendingHeaderStyle>

                <SortedDescendingCellStyle BackColor="#EAEAD3"></SortedDescendingCellStyle>

                <SortedDescendingHeaderStyle BackColor="#575357"></SortedDescendingHeaderStyle>
            </asp:GridView>

            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:APISConnectionString %>' SelectCommand="SELECT * FROM [tabUsuario]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
