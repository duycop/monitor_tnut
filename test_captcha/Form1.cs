using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace test_captcha
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string txt = textBox1.Text;
            lib_captcha.CaptchaGenerator captcha = new lib_captcha.CaptchaGenerator();
            pictureBox1.Image= captcha.GenerateCaptcha(txt);
        }
    }
}
