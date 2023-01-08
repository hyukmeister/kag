using System;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

namespace KennedyAccess
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                DirectoryInfo rootInfo = new DirectoryInfo(Server.MapPath("~/UserFiles/hyuk/"));
                this.PopulateTreeView(rootInfo, null);
                PopulateFiles(rootInfo, null);

            }
            else
            {
                string folderName = "~/UserFiles/hyuk/" + tvUserFiles.SelectedNode.Text;
                foreach (string s in Request.Files)
                {
                    HttpPostedFile file = Request.Files[s];

                    int fileSizeInBytes = file.ContentLength;
                    string fileName = Request.Headers["X-File-Name"];
                    string fileExtension = "";

                    if (!string.IsNullOrEmpty(fileName))
                        fileExtension = Path.GetExtension(fileName);

                    // IMPORTANT! Make sure to validate uploaded file contents, size, etc. to prevent scripts being uploaded into your web app directory
                    string savedFileName = Path.Combine(Server.MapPath(folderName), file.FileName + fileExtension);
                    file.SaveAs(savedFileName);
                }
            }
        }

        private void PopulateTreeView(DirectoryInfo dirInfo, TreeNode treeNode)
        {
            foreach (DirectoryInfo directory in dirInfo.GetDirectories())
            {
                TreeNode directoryNode = new TreeNode
                {
                    Text = directory.Name,
                    Value = directory.FullName,
                    ImageUrl = "/images/fil012.svg"
                };

                if (treeNode == null)
                {
                    //If Root Node, add to TreeView.
                    tvUserFiles.Nodes.Add(directoryNode);
                }
                else
                {
                    //If Child Node, add to Parent Node.
                    treeNode.ChildNodes.Add(directoryNode);
                }

                PopulateFiles(directory, directoryNode);

                PopulateTreeView(directory, directoryNode);
            }
        }
        private void PopulateFiles(DirectoryInfo directory, TreeNode directoryNode)
        {
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
                        ImageUrl = "/images/cod002.svg"
                    };
                    if(directoryNode==null)
                        tvUserFiles.Nodes.Add(fileNode);
                    else
                        directoryNode.ChildNodes.Add(fileNode);
                }
            }
        }
    }
}