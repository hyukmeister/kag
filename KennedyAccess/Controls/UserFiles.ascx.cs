using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess.Controls
{
    public partial class UserFiles : System.Web.UI.UserControl
    {
        private string userName;
        private string rootFolder;

        protected void Page_Load(object sender, EventArgs e)
        {
            userName = "hyuk";
            rootFolder = "~/UserFiles/" + userName + "/ ";
            if (!this.IsPostBack)
            {
                // create the root folder if necessary
                CreateFolder(rootFolder);

                DirectoryInfo rootInfo = new DirectoryInfo(Server.MapPath(rootFolder));

                LoadFolders();

                tvUserFolders.Nodes[0].Selected = true;
                //labDirectory.Text = "/" + tvUserFolders.SelectedNode.Text;
                PopulateFiles(rootInfo);
            }
            else
            {
                foreach (string s in Request.Files)
                {
                    string folderName = tvUserFolders.SelectedValue;
                    HttpPostedFile file = Request.Files[s];

                    int fileSizeInBytes = file.ContentLength;
                    if(fileSizeInBytes > 0)
                    {
                        string fileName = Request.Headers["X-File-Name"];
                        string fileExtension = "";

                        if (!string.IsNullOrEmpty(fileName))
                            fileExtension = Path.GetExtension(fileName);

                        // IMPORTANT! Make sure to validate uploaded file contents, size, etc. to prevent scripts being uploaded into your web app directory
                        string savedFileName = Path.Combine(folderName, file.FileName + fileExtension);
                        file.SaveAs(savedFileName);
                    }
                }
            }
        }

        private void LoadFolders()
        {
            DirectoryInfo rootInfo = new DirectoryInfo(Server.MapPath(rootFolder));

            TreeNode directoryNode = new TreeNode
            {
                Text = userName,
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
            bool exists = System.IO.Directory.Exists(Server.MapPath(rootFolder));

            if (!exists)
                System.IO.Directory.CreateDirectory(Server.MapPath(rootFolder));
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

        protected void lnkBtnCreate_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            string folderName = tvUserFolders.SelectedValue;

        }
    }
}