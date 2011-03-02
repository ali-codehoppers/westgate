namespace WestgateEmailService
{
    partial class ProjectInstaller
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.emailserviceProcessInstaller = new System.ServiceProcess.ServiceProcessInstaller();
            this.emailserviceInstaller = new System.ServiceProcess.ServiceInstaller();
            // 
            // emailserviceProcessInstaller
            // 
            this.emailserviceProcessInstaller.Account = System.ServiceProcess.ServiceAccount.LocalSystem;
            this.emailserviceProcessInstaller.Password = null;
            this.emailserviceProcessInstaller.Username = null;
            // 
            // emailserviceInstaller
            // 
            this.emailserviceInstaller.ServiceName = "WestgateEmailService";
            this.emailserviceInstaller.StartType = System.ServiceProcess.ServiceStartMode.Automatic;
            // 
            // ProjectInstaller
            // 
            this.Installers.AddRange(new System.Configuration.Install.Installer[] {
            this.emailserviceProcessInstaller,
            this.emailserviceInstaller});

        }

        #endregion

        private System.ServiceProcess.ServiceProcessInstaller emailserviceProcessInstaller;
        private System.ServiceProcess.ServiceInstaller emailserviceInstaller;
    }
}