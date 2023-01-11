<%@ Page Title="" Language="C#" MasterPageFile="~/site1.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="KennedyAccess.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>

<div class="form-floating mb-3;" style="width:300px">
    <div class="bd-example">
        <article class="my-3" id="typography">
            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com">
                <label for="floatingInput">Email address</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                <label for="floatingPassword">Password</label>
            </div>  
        </article>
    </div>
</div>

<!----- Page Navigation ------>
<aside class="bd-aside sticky-xl-top text-muted align-self-start mb-3 mb-xl-5 px-2">
  <h2 class="h6 pt-4 pb-3 mb-4 border-bottom">On this page</h2>
  <nav class="small" id="toc">
    <ul class="list-unstyled">
      <li class="my-2">
        <button class="btn d-inline-flex align-items-center collapsed border-0" data-bs-toggle="collapse" aria-expanded="false" data-bs-target="#contents-collapse" aria-controls="contents-collapse">Contents</button>
        <ul class="list-unstyled ps-3 collapse" id="contents-collapse">
          <li><a class="d-inline-flex align-items-center rounded text-decoration-none" href="#typography">Typography</a></li>
          <li><a class="d-inline-flex align-items-center rounded text-decoration-none" href="#images">Images</a></li>
        </ul>
      </li>
    </ul>
  </nav>
</aside>

<!----- modal ------>
    <% if (true)
        { %>
<button id="btnQuestionnaire" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Questionnaire</button>
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Questions</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="form-floating mb-3;" style="width:300px">
            <asp:TextBox ID="txtLastName" class="form-control" runat="server" placeholder="Last Name"></asp:TextBox>
            <label for="txtLastName">Last Name</label>
        </div>
        <div class="form-floating mb-3;" style="width:300px">
            <asp:TextBox ID="TextBox2" class="form-control" runat="server" placeholder="First Name"></asp:TextBox>
            <label for="txtFirstName">First Name</label>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Save" OnClick="btnSave_Click"/>
      </div>
    </div>
  </div>
</div>
    <% } %>

<!----- accordion ------>
<div class="accordion" id="accordionFlushExample" runat="server" enableviewstate="true">
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
        Accordion Item #1
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
    </div>
  </div>

  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
        Accordion Item #2
      </button>
    </h2>
    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
    </div>
  </div>

  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
        Accordion Item #3
      </button>
    </h2>
    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
    </div>
  </div>

</div>

<!----- modal server ------>
    <asp:Button ID="ClientButton" class="btn btn-primary" runat="server" Text="Launch Modal Popup (Client)" />
    <asp:Panel ID="myQuestionnaireModal" runat="server" Width="750px">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content" style="width:750px">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel1">Questions</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                <div class="form-floating mb-3;" style="width:300px">
                    <asp:TextBox ID="TextBox1" class="form-control" runat="server" ValidationGroup="NamesValidation" placeholder="Last Name"></asp:TextBox>
                    <label for="txtLastName">Last Name</label>
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="TextBox1" ValidationGroup="NamesValidation" ErrorMessage="Last Name is requried"></asp:RequiredFieldValidator>
                </div>
                <div class="form-floating mb-3;" style="width:300px">
                    <asp:TextBox ID="TextBox3" class="form-control" runat="server" placeholder="First Name"></asp:TextBox>
                    <label for="txtFirstName">First Name</label>
                </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="OKButton1" runat="server" Text="Close" />
                    <asp:Button ID="btnSave1" class="btn btn-primary" runat="server" Text="Save" ValidationGroup="NamesValidation" OnClick="btnSave1_Click"/>
                </div>
            </div>
        </div>

    </asp:Panel>


<asp:button id="Button2" runat="server" text="Button" />


<asp:panel id="Panel1" style="display: none" runat="server">
	<div class="HellowWorldPopup">
                <div class="PopupHeader" id="PopupHeader">Header</div>
                <div class="PopupBody">
                    <p>This is a simple modal dialog</p>
                </div>
                <div class="Controls">
                    <input id="btnOkay" type="button" value="Done" />
                    <input id="btnCancel" type="button" value="Cancel" />
		</div>
        </div>
</asp:panel>

    <asp:TextBox ID="TextBox4" runat="server" Width="400px" TextMode="MultiLine" Rows="8"></asp:TextBox>
        <asp:Button ID="Button3" runat="server" Text="Button3" OnClick="Button3_Click" />

    <ajaxToolkit:HtmlEditorExtender ID="HtmlEditorExtender1" runat="server" TargetControlID="TextBox4"></ajaxToolkit:HtmlEditorExtender>


    <br /><br />
<label class="switch" >
    <asp:CheckBox ID="cbkI_34_ListJob" runat="server" />
    <span class="slider round"></span>
</label><br />
    <asp:Button ID="Button4" Text="Save" runat="server" OnClick="Button4_Click" />


    <asp:DropDownList ID="ddlDropDownTest" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDropDownTest_SelectedIndexChanged"></asp:DropDownList><br /><br />
    <asp:DropDownList ID="ddlState" runat="server" Enabled="false"></asp:DropDownList>
             
        <asp:Table ID="tblAttachment" runat="server" class="table table-hover" Width="800px">
            <asp:TableRow BackColor="#B5B5B5" Height="30px">
                <asp:TableCell Width="300px" HorizontalAlign="Right">
                    <asp:ImageButton ID="lnkBtnCreate" runat="server" OnClick="lnkBtnCreate_Click" AlternateText="Delete" ImageAlign="Top" Height="20px" ImageUrl="~/images/arr017.svg" Visible="false"/>&nbsp;
                    <asp:ImageButton ID="lnkBtnDelete" runat="server" OnClick="lnkBtnDelete_Click" AlternateText="Delete" ImageAlign="Top" Height="20px" ImageUrl="~/images/gen027.svg" Visible="false"/>
                </asp:TableCell>
                <asp:TableCell Width="500px">
                    &nbsp;<asp:Label ID="labDirectory" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow VerticalAlign="Top" BackColor="#edf2f2">
                <asp:TableCell Width="300px">
                    <asp:TreeView ID="tvUserFolders" runat="server" ImageSet="XPFileExplorer" NodeIndent="15" 
                        Height="100%" OnSelectedNodeChanged="tvUserFolders_SelectedNodeChanged">
                        <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                        <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                            NodeSpacing="0px" VerticalPadding="2px"></NodeStyle>
                        <ParentNodeStyle Font-Bold="False" />
                        <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                            VerticalPadding="0px" />
                    </asp:TreeView>
                </asp:TableCell>
                <asp:TableCell VerticalAlign="Top" Width="500px">
                    <asp:TreeView ID="tvUserFiles" runat="server" ImageSet="XPFileExplorer" NodeIndent="15" >
                        <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" HorizontalPadding="2px"
                            NodeSpacing="0px" VerticalPadding="2px"></NodeStyle>
                    </asp:TreeView>
                    <div id="dZUpload" class="dropzone">
                        <div class="dz-default dz-message"></div>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
<link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />

</asp:Content>

