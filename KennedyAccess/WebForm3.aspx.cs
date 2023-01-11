using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KennedyAccess
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        private string userName;
        private string rootFolder;

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.MaintainScrollPositionOnPostBack = true;

            userName = "hyuk";
            rootFolder = "~/UserFiles/" + userName + "/ ";

            if (!Page.IsPostBack)
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
                string folderName = tvUserFolders.SelectedValue;
                foreach (string s in Request.Files)
                {
                    HttpPostedFile file = Request.Files[s];

                    int fileSizeInBytes = file.ContentLength;
                    string fileName = file.FileName;
                    string fileExtension = "";

                    if (!string.IsNullOrEmpty(fileName))
                        fileExtension = Path.GetExtension(fileName);

                    // IMPORTANT! Make sure to validate uploaded file contents, size, etc. to prevent scripts being uploaded into your web app directory
                    string savedFileName = Path.Combine(folderName, file.FileName + fileExtension);
                    file.SaveAs(savedFileName);
                }
                DirectoryInfo rootInfo = new DirectoryInfo(tvUserFolders.SelectedValue);
                PopulateFiles(rootInfo);
            }
        }

            private void CreateFolder(string rootFolder)
        {
            // create the root folder if necessary
            bool exists = System.IO.Directory.Exists(Server.MapPath(rootFolder));

            if (!exists)
                System.IO.Directory.CreateDirectory(Server.MapPath(rootFolder));
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

        protected void lnkBtnCreate_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void lnkBtnDelete_Click(object sender, ImageClickEventArgs e)
        {

        }

    }
}