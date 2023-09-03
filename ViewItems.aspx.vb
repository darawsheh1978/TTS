Public Class ViewItems
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Me.Master.FindControl("_Filter").Visible = False
            DG.SettingsText.SearchPanelEditorNullText = "ابحث هنا.."
        End If
    End Sub

End Class