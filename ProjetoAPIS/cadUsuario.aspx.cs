using ProjetoAPIS.DAL;
using ProjetoAPIS.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetoAPIS
{
    public partial class cadUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCEP_Click(object sender, EventArgs e)
        {
            try
            {
                using (var ws = new wsCorreios.AtendeClienteClient())
                {
                    var resultado = ws.consultaCEP(txtCEP.Text);

                    txtEndereço.Text = resultado.end;
                    txtBairro.Text = resultado.bairro;
                    txtCidade.Text = resultado.cidade;
                    txtUF.Text = resultado.uf;
                }
            }
            catch (Exception ex)
            {
                showMessage(ex.Message);
            }
        }

        public void showMessage(string msg)
        {
            Response.Write("<script> alert('" + msg + "') </script>");
        }
        public void CleanCamps()
        {
            txtBairro.Text = "";
            txtCEP.Text = "";
            txtCidade.Text = "";
            txtEmail.Text = "";
            txtEndereço.Text = "";
            txtNome.Text = "";
            txtSenha.Text = "";
            txtUF.Text = "";
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            try
            {
                if (fpFoto.HasFile)
                {
                    string wayArchive = Server.MapPath("/fotoUsuario/");
                    string nameArchive = fpFoto.FileName;
                    fpFoto.SaveAs(wayArchive + nameArchive);

                    tabUsuario objUsuario = new tabUsuario();
                    objUsuario.Bairro = txtBairro.Text;
                    objUsuario.Cidade = txtCidade.Text;
                    objUsuario.Email = txtEmail.Text;
                    objUsuario.Endereco = txtEndereço.Text;
                    objUsuario.UF = txtUF.Text;
                    objUsuario.Nome = txtNome.Text;
                    objUsuario.Senha = txtSenha.Text;
                    objUsuario.nomeFoto = nameArchive;
                    tabUsuario objValidate = new tabUsuario();
                    usuarioDAL uDal = new usuarioDAL();

                    objValidate = uDal.ConsultTabEmail(txtEmail.Text);

                    if (objValidate != null)
                    {
                        showMessage("Esse usuário já existe!");
                    }
                    else
                    {
                        uDal.RegisterUser(objUsuario);
                        gridUsuario.DataBind();
                        showMessage("Usuário cadastrado com Sucesso!");
                        Suporte objsup = new Suporte();
                        string GenEmail = "Olá " + txtNome;
                        string ApoEmail = "Bem-vindo ao Sistema! Para mais informações, contate o nosso E-mail!";
                        objsup.sendEmail(GenEmail, txtEmail.Text, ApoEmail);
                        CleanCamps();
                    }
                }
                else
                {
                    showMessage("Insira uma foto!");
                }

            }
            catch (Exception ex)
            {

                showMessage("Erro ao salvar Cadastro. Entre em contato com Administrador (xx-xxxx-xxxx)");
            }

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {

        }
    }
}