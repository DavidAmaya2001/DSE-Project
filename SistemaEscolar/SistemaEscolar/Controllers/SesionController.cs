using SistemaEscolar.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SistemaEscolar.Controllers
{
    public class SesionController
    {
        private SesionModel sesionModel;
        private FrmLogin frmLogin;

        public SesionController(FrmLogin frmLogin)
        {
            this.sesionModel = new SesionModel();
            this.frmLogin = frmLogin;

            frmLogin.btnIngresarAction += OnIniciarSesionButtonClick;
        }

        public void OnIniciarSesionButtonClick(string usuario, string contrasena)
        {
            if (string.IsNullOrEmpty(usuario) && string.IsNullOrEmpty(contrasena))
            {
                MessageBox.Show("Debe ingresar su usuario y contraseña", "¡Cuidado!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                if (string.IsNullOrEmpty(contrasena))
                {
                    MessageBox.Show("Debe ingresar su contraseña", "¡Cuidado!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else
                {
                    if (string.IsNullOrEmpty(usuario))
                    {
                        MessageBox.Show("Debe ingresar su usuario", "¡Cuidado!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                    else
                    {
                        try
                        {
                            sesionModel.Nivel = sesionModel.IniciarSesion(usuario, contrasena);

                            if (sesionModel.Nivel == 1)
                            {
                                frmLogin.idProfesor = sesionModel.ExtraerID(usuario, contrasena);
                                frmLogin.nombreProfesor = sesionModel.ExtraerNombre(usuario, contrasena);
                                frmLogin.fotoPerfilProfesor = sesionModel.ExtraerFoto(usuario, contrasena);

                                MessageBox.Show("Var 1: " + frmLogin.idProfesor.ToString());
                                MessageBox.Show("Var 2: " + frmLogin.nombreProfesor);
                                
                                /*
                                FrmMenuAdmin formMenuPrueba = new FrmMenuAdmin();
                                formMenuPrueba.Show();
                                frmLogin.Hide();
                                */
                            }
                            else if (sesionModel.Nivel == 2)
                            {
                                frmLogin.idProfesor = sesionModel.ExtraerID(usuario, contrasena);
                                frmLogin.nombreProfesor = sesionModel.ExtraerNombre(usuario, contrasena);
                                frmLogin.fotoPerfilProfesor = sesionModel.ExtraerFoto(usuario, contrasena);

                                /*
                                MenuProfesor menuProfesor = new MenuProfesor();
                                menuProfesor.Show();
                                frmLogin.Hide();
                                */
                            }
                            else
                            {
                                MessageBox.Show("Usuario o contraseña incorrecta", "¡Cuidado!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            }
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine("Error: " + ex.Message);
                        }
                    }
                }
            }
        }
    }
}

