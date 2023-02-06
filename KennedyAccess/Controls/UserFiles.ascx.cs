using iTextSharp.text;
using KennedyAccess.Classes;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess.Controls
{
    public partial class UserFiles : System.Web.UI.UserControl
    {
        private User user;
        BaseData bd = new BaseData();
        public string UserName;
        public string guid;
        private string rootFolder;
        private string key = "KennedyAccessSapphireForceConsul";
        private string iv = "SapphireConsulti";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                LabGuid.Text = guid;
                rootFolder = "~/UserFiles/" + LabGuid.Text + "/ ";

                labUserName.Text = UserName;
                user = (User)Session["User"];
                

                // create the root folder if necessary
                CreateFolder(Server.MapPath(rootFolder));

                DirectoryInfo rootInfo = new DirectoryInfo(Server.MapPath(rootFolder));

                LoadFolders();

                tvUserFolders.Nodes[0].Selected = true;
                //labDirectory.Text = "/" + tvUserFolders.SelectedNode.Text;
                PopulateFiles(rootInfo);

                btnNewFolder.Visible = user.HasRole("EmployerFileAdd");
            }
            else
            {
                rootFolder = "~/UserFiles/" + LabGuid.Text + "/ ";

                foreach (string s in Request.Files)
                {
                    string folderName = tvUserFolders.SelectedValue;
                    HttpPostedFile file = Request.Files[s];

                    int fileSizeInBytes = file.ContentLength;
                    if(fileSizeInBytes > 0)
                    {
                        // IMPORTANT! Make sure to validate uploaded file contents, size, etc. to prevent scripts being uploaded into your web app directory
                        //string savedFileName = Path.Combine(folderName, file.FileName + fileExtension);
                        string savedFileName = Path.Combine(folderName, file.FileName);
                        file.SaveAs(savedFileName);

                        byte[] fileData = new byte[file.ContentLength];
                        file.InputStream.Read(fileData, 0, file.ContentLength);

                        ///================================================================================================================
                        /// encrypt & save
                        //byte[] fileData = new byte[file.ContentLength];
                        //string savedFileName = Path.Combine(folderName, file.FileName);
                        //using (Aes aes = Aes.Create())
                        //{
                        //    aes.Key = Encoding.ASCII.GetBytes(key);
                        //    aes.IV = Encoding.ASCII.GetBytes(iv);

                        //    using (MemoryStream ms = new MemoryStream())
                        //    {
                        //        using (CryptoStream cs = new CryptoStream(ms, aes.CreateEncryptor(), CryptoStreamMode.Write))
                        //        {
                        //            cs.Write(fileData, 0, fileData.Length);
                        //        }

                        //        Save the encrypted data to a file
                        //        File.WriteAllBytes(savedFileName, ms.ToArray());
                        //    }
                        //}
                        ///================================================================================================================
                    }
                }
            }            
        }

        private void LoadFolders()
        {
            tvUserFolders.Nodes.Clear();
            DirectoryInfo rootInfo = new DirectoryInfo(Server.MapPath(rootFolder));

            TreeNode directoryNode = new TreeNode
            {
                Text = labUserName.Text,
                Value = rootInfo.FullName,
                ImageUrl = "/images/home.png"
            };
            tvUserFolders.Nodes.Add(directoryNode);

            this.PopulateTreeView(rootInfo, directoryNode);
        }

        // create the root folder if necessary
        private void CreateFolder(string rootFolder)
        {
            // create the root folder if necessary
            bool exists = System.IO.Directory.Exists(rootFolder);

            if (!exists)
                System.IO.Directory.CreateDirectory(rootFolder);

            // reload folders
            LoadFolders();
        }

        private void RenameFolder(string oldFoldePath, string newFoldePath)
        {
            // create the root folder if necessary
            bool exists = System.IO.Directory.Exists(oldFoldePath);

            if (exists)
                System.IO.Directory.Move(oldFoldePath, newFoldePath);

            // reload folders
            LoadFolders();
        }

        private void PopulateTreeView(DirectoryInfo dirInfo, TreeNode treeNode)
        {
            foreach (DirectoryInfo directory in dirInfo.GetDirectories())
            {
                TreeNode directoryNode = new TreeNode
                {
                    Text = directory.Name,
                    Value = directory.FullName,
                    ImageUrl = "/images/explorer2.png"
                };

                if (treeNode == null)
                {
                    //If Root Node, add to TreeView.
                    tvUserFolders.Nodes.Add(directoryNode);
                }
                else
                {
                    //If Child Node, add to Parent Node.
                    treeNode.ChildNodes.Add(directoryNode);
                }

                //PopulateFiles(directory, directoryNode);

                PopulateTreeView(directory, directoryNode);
            }
        }
        private void PopulateFiles(DirectoryInfo directory)
        {
            tvUserFiles.Nodes.Clear();

            //Get all files in the Directory.
            foreach (FileInfo file in directory.GetFiles())
            {
                if (file.Name != "desktop.ini")
                {
                    //Add each file as Child Node.
                    TreeNode fileNode = new TreeNode
                    {
                        Text = file.Name,
                        Value = file.FullName,
                        ImageUrl = "/images/file1.png"
                    };
                    tvUserFiles.Nodes.Add(fileNode);
                }
            }
        }

        protected void tvUserFolders_SelectedNodeChanged(object sender, EventArgs e)
        {
            string folderName = tvUserFolders.SelectedValue;
            DirectoryInfo rootInfo = new DirectoryInfo(folderName);
            PopulateFiles(rootInfo);
            //labDirectory.Text = "/" + tvUserFolders.SelectedNode.Text;
        }

        protected void lnkBtnDelete_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            string folderName = tvUserFolders.SelectedValue;
            foreach (var item in System.IO.Directory.GetFiles(folderName))
            {
                System.IO.File.Delete(item);
            }
            System.IO.Directory.Delete(folderName);

            // rebuild folder structure
            LoadFolders();
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string folderName = tvUserFolders.SelectedValue;
            CreateFolder(folderName + "\\" + txtFolderNmae.Text);
        }
        protected void btnRename_Click(object sender, EventArgs e)
        {
            string oldName = tvUserFolders.SelectedNode.Text;
            string newName = txtRenameFolder.Text;

            if (newName != string.Empty)
            {
                string oldFoldePath = tvUserFolders.SelectedValue;
                string newFoldePath = oldFoldePath;



                int i = newFoldePath.LastIndexOf(oldName);
                if (i >= 0)
                    newFoldePath = newFoldePath.Substring(0, i) + newName;

                RenameFolder(oldFoldePath, newFoldePath);
            }
        }

        protected void tvUserFiles_SelectedNodeChanged(object sender, EventArgs e)
        {

            try
            {
                if (tvUserFiles.SelectedNode.Value != "")
                {
                    string filename = tvUserFiles.SelectedNode.Value;

                    System.IO.FileInfo file = new System.IO.FileInfo(filename);

                    if (file.Exists)
                    {
                        System.Diagnostics.Process.Start(file.FullName);
                    }
                }
            }
            catch (Exception ex)
            {
                bd.WriteAuditTrail(user, "0", ex.Message);
            }
            ///================================================================================================================
            /// How to decrypt
            //private void DecryptFile(string encryptedFilePath)
            //{
            //    // The path to save the decrypted file
            //    string decryptedFilePath = Path.Combine(Server.MapPath("~/DecryptedFiles"), Path.GetFileNameWithoutExtension(encryptedFilePath));

            //    // Get the encrypted file data
            //    byte[] encryptedFileData = File.ReadAllBytes(encryptedFilePath);

            //    // Decrypt the data using a symmetric algorithm
            //    using (Aes aes = Aes.Create())
            //    {
            //        aes.Key = new byte[32]; // your encryption key
            //        aes.IV = new byte[16]; // your initialization vector

            //        using (MemoryStream ms = new MemoryStream(encryptedFileData))
            //        {
            //            using (CryptoStream cs = new CryptoStream(ms, aes.CreateDecryptor(), CryptoStreamMode.Read))
            //            {
            //                using (MemoryStream decryptedStream = new MemoryStream())
            //                {
            //                    cs.CopyTo(decryptedStream);
            //                    decryptedStream.Position = 0;

            //                    // Save the decrypted data to a file
            //                    File.WriteAllBytes(decryptedFilePath, decryptedStream.ToArray());
            //                }
            //            }
            //        }
            //    }
            //}
            ///================================================================================================================

        }
    }
}