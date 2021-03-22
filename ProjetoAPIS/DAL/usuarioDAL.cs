using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjetoAPIS.DAL
{
    public class usuarioDAL
    {
        public tabUsuario ConsultTabEmail(string email)
        {
            using (APISEntities ctx = new APISEntities())
            {
                return ctx.tabUsuario.Where(c => c.Email == email).FirstOrDefault();
            }
        }

        public void RegisterUser(tabUsuario objU)
        {
            using (APISEntities ctx = new APISEntities())
            {
                ctx.tabUsuario.Add(objU);
                ctx.SaveChanges();
            }
        }
    }
}