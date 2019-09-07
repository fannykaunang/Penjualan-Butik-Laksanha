
Imports System.IO
Imports System.Net
Imports System.Web.Script.Serialization

Partial Class kasir_message_success
  Inherits System.Web.UI.Page
  Private serverKey As String = "AAAAbu4MFa0:APA91bFipM6MRrA3nrE134IoZk_oqb7TzJoPxXPcGdK5oJ_ZtQWkXy_cEfL8Zm6KQWbabgGvxWgLn1hKeHKGta4vvHzNDsprYcKbwCW43f_0rumCsevFGSVNBrHDjTPlJstuxk187jCc"
  Private senderId As String = "476440171949"
  Private webAddr As String = "https://fcm.googleapis.com/fcm/send"

  Private Sub kasir_message_success_Load(sender As Object, e As EventArgs) Handles Me.Load
    If Not (Me.Page.IsPostBack) Then
      If Me.Page.Request.QueryString("PreviousPage") = "Barang.aspx" Then
        SendNotification("eu52podTnZo:APA91bEGXiYoyrlIZH5Qe67I_RG8e4CoS3cU-AV2XFFofc-RUvHB8n9UUp64tuVYFssXKwJIA737yo5vD7a2vj27mAlu57uVsGGhSyR6hKe4sbtl1ujOwGMO--P2GJ86splYGBR_4DeD", "Penjualan Butik", "Input Barang : " & Page.Request.QueryString("nama_barang"))
        ViewState("PreviousPage") = Request.UrlReferrer
      ElseIf Me.Page.Request.QueryString("PreviousPage") = "Penerimaan.aspx" Then
        SendNotification("eu52podTnZo:APA91bEGXiYoyrlIZH5Qe67I_RG8e4CoS3cU-AV2XFFofc-RUvHB8n9UUp64tuVYFssXKwJIA737yo5vD7a2vj27mAlu57uVsGGhSyR6hKe4sbtl1ujOwGMO--P2GJ86splYGBR_4DeD", "Penjualan Butik", "Barang masuk baru : " & Page.Request.QueryString("nama_barang"))
        ViewState("PreviousPage") = Request.UrlReferrer
      ElseIf Me.Page.Request.QueryString("PreviousPage") = "Kategori_Barang.aspx" Then
        SendNotification("eu52podTnZo:APA91bEGXiYoyrlIZH5Qe67I_RG8e4CoS3cU-AV2XFFofc-RUvHB8n9UUp64tuVYFssXKwJIA737yo5vD7a2vj27mAlu57uVsGGhSyR6hKe4sbtl1ujOwGMO--P2GJ86splYGBR_4DeD", "Penjualan Butik", "Input Kategori Barang : " & Page.Request.QueryString("kategori_barang"))
        ViewState("PreviousPage") = Request.UrlReferrer
      ElseIf Me.Page.Request.QueryString("PreviousPage") = "Supplier.aspx" Then
        SendNotification("eu52podTnZo:APA91bEGXiYoyrlIZH5Qe67I_RG8e4CoS3cU-AV2XFFofc-RUvHB8n9UUp64tuVYFssXKwJIA737yo5vD7a2vj27mAlu57uVsGGhSyR6hKe4sbtl1ujOwGMO--P2GJ86splYGBR_4DeD", "Penjualan Butik", "Input Supplier : " & Page.Request.QueryString("supplier"))
        ViewState("PreviousPage") = Request.UrlReferrer
      ElseIf Me.Page.Request.QueryString("PreviousPage") = "Konsumen.aspx" Then
        SendNotification("eu52podTnZo:APA91bEGXiYoyrlIZH5Qe67I_RG8e4CoS3cU-AV2XFFofc-RUvHB8n9UUp64tuVYFssXKwJIA737yo5vD7a2vj27mAlu57uVsGGhSyR6hKe4sbtl1ujOwGMO--P2GJ86splYGBR_4DeD", "Penjualan Butik", "Input Konsumen Baru : " & Page.Request.QueryString("konsumen"))
        ViewState("PreviousPage") = Request.UrlReferrer
      ElseIf Me.Page.Request.QueryString("PreviousPage") = "list-barang.aspx" Then
        SendNotification("eu52podTnZo:APA91bEGXiYoyrlIZH5Qe67I_RG8e4CoS3cU-AV2XFFofc-RUvHB8n9UUp64tuVYFssXKwJIA737yo5vD7a2vj27mAlu57uVsGGhSyR6hKe4sbtl1ujOwGMO--P2GJ86splYGBR_4DeD", "Penjualan Butik", "Ubah Barang : " & Page.Request.QueryString("nama_barang_edit"))
        ViewState("PreviousPage") = Request.UrlReferrer
      End If
    End If
  End Sub

  Public Function SendNotification(ByVal DeviceToken As String, ByVal title As String, ByVal msg As String) As String
    Dim result = "-1"
    Dim httpWebRequest = CType(WebRequest.Create(webAddr), HttpWebRequest)
    httpWebRequest.ContentType = "application/json"
    httpWebRequest.Headers.Add(String.Format("Authorization: key={0}", serverKey))
    httpWebRequest.Headers.Add(String.Format("Sender: id={0}", senderId))
    httpWebRequest.Method = "POST"
    Dim payload = New With {Key .[to] = DeviceToken,
        Key .priority = "high",
        Key .content_available = True,
        Key .notification = New With {
        Key .body = msg,
        Key .title = title,
        Key .icon = "ic_android_black_24dp",
        Key .click_action = "OPEN_ACTIVITY_1"
        }
    }
    Dim serializer = New JavaScriptSerializer()

    Using streamWriter = New StreamWriter(httpWebRequest.GetRequestStream())
      Dim json As String = serializer.Serialize(payload)
      streamWriter.Write(json)
      streamWriter.Flush()
    End Using

    Dim httpResponse = CType(httpWebRequest.GetResponse(), HttpWebResponse)

    Using streamReader = New StreamReader(httpResponse.GetResponseStream())
      result = streamReader.ReadToEnd()
    End Using

    Return result
  End Function
  Protected Sub BTBACK_Click(sender As Object, e As EventArgs)
    If ViewState("PreviousPage") IsNot Nothing Then
      Response.Redirect(ViewState("PreviousPage").ToString())
    End If
  End Sub

End Class
