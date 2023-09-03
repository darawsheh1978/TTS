Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Net

Public Class Utility
    Public Shared ConStr As String = ConfigurationManager.ConnectionStrings("one").ConnectionString
    Public Shared Con As New SqlConnection
    'Public Shared SurveyId As Integer
    'Public Shared Addnew As Boolean = False
    'Public Shared Allow As Boolean = False
    Public Shared Qry As String
    Public Sub Connect()
        ' If Con.State = Data.ConnectionState.Open Then Exit Sub
        'Con.ConnectionString = ""
        'Con.ConnectionString = ""
        Con.Close()
        ' hgnh
        ' If Con.State = ConnectionState.Open Then Con.Close()
        Con.ConnectionString = ConStr
        'ghgh
        ' edited by mazen 
        Con.Open()
    End Sub
    Public Function GetDataSet(ByVal Qry As String) As Data.DataSet
        Connect() ' Connect to the Database
        Dim Ds As New Data.DataSet
        Dim Da As New SqlDataAdapter(Qry, Con)
        Da.Fill(Ds, "Result") ' Extract the Data
        Return Ds
    End Function

    'Public Function GetFiles(ByVal Qry As String) As DsDocs
    '    Connect() ' Connect to the Database
    '    Dim Ds As New DsDocs
    '    Dim Da As New SqlDataAdapter(Qry, Con)
    '    Da.Fill(Ds.doc_files) ' Extract the Data
    '    Return Ds
    'End Function

    Public Function GetDatareader(ByVal qry As String) As SqlDataReader
        Dim Com As New SqlCommand
        Dim Dr As SqlDataReader

        Com.Connection = Con
        Connect()
        Com.CommandText = qry
        Dr = Com.ExecuteReader
        Return Dr
        Dr.Close()


    End Function
    Public Function ExecuteQry(ByVal Qry As String) As Boolean
        Dim Com As New SqlCommand
        Dim Trans As SqlTransaction
        Try

            Com.Connection = Con
            Connect()
            Trans = Con.BeginTransaction
            Com.Transaction = Trans
            Com.CommandText = Qry
            Com.ExecuteNonQuery()
            Trans.Commit()
            Return True
        Catch ex As Exception

            ' Trans.Rollback()
            Return False
        End Try
    End Function

    Public Function GetCurrentId(ByVal KeyFld As String, ByVal TblName As String) As Integer

        Dim Com As New SqlCommand
        Dim Dr As SqlDataReader
        Try
            Com.Connection = Con
            Connect()
            Com.CommandText = "Select Max( " & KeyFld & ")  from  " & TblName
            Dr = Com.ExecuteReader
            Dr.Read()
            Dim Id As Integer = Dr(0)
            Dr.Close()
            Return Id
        Catch ex As Exception
            Dr = Nothing
        End Try
    End Function
    Public Function GetAdminId() As Integer
        Dim Id As Integer
        Dim Com As New SqlCommand
        Dim Dr As SqlDataReader
        Try
            Com.Connection = Con
            Connect()
            Com.CommandText = "Select Max(Administration_Id) from Administrations "
            Dr = Com.ExecuteReader
            Dr.Read()
            Id = Dr(0)
            Dr.Close()
            Return Id
        Catch ex As Exception
            Dr = Nothing
            Return -1
        End Try
    End Function

    Public Sub SendWA(sms As String, num As String)

        Dim WebRequest As HttpWebRequest
        WebRequest = HttpWebRequest.Create("https://api.ultramsg.com/instance49137/messages/chat")
        Dim postdata As String = "token=agqyg0fjmwz8c03a&to=" & num & "&body=" & sms
        Dim enc As UTF8Encoding = New System.Text.UTF8Encoding()
        Dim postdatabytes As Byte() = enc.GetBytes(postdata)
        WebRequest.Method = "POST"
        WebRequest.ContentType = "application/x-www-form-urlencoded"
        ' WebRequest.GetRequestStream()
        WebRequest.GetRequestStream().Write(postdatabytes, 0, postdatabytes.Length)
        Dim ret As New System.IO.StreamReader(WebRequest.GetResponse().GetResponseStream())
    End Sub


End Class