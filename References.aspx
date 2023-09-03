<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main_Template.Master" CodeBehind="References.aspx.vb" Inherits="TTsAccounting.References" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v21.2, Version=21.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v21.2, Version=21.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="scripts_" runat="server">
 

    <style>  
           .customHeaderStyle {  
               background-color:#6f42c1;  
           }  
                .customHeaderStyle a {  
                   color: white;  
               }  
</style>  

 


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Title_" runat="server">
   
      <span class="d-inline-block btn float-right">
          <i class="ri-file-list-fill h2"></i>
      </span>
    
    <span class="d-inline-block h3">قائمة الذمم</span>
 

   
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Filters_" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body_" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <dx:BootstrapGridView ID="DG" runat="server" DataSourceID="SqlRef" KeyFieldName="RefNo" AutoGenerateColumns="False">
         
        <Settings ShowFilterRow="true" ShowFilterRowMenu="true" ShowFilterRowMenuLikeItem="true" />
        <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
   
              <SettingsBehavior AutoFilterRowInputDelay="1200" SortMode="DisplayText" />
   
              <SettingsPager AlwaysShowPager="True" Position="Bottom"  PageSize="100">
            <FirstPageButton Text="الاول" />
            <LastPageButton Text="الاخر" />
            <NextPageButton Text="التالي" />
            <PrevPageButton Text="السابق" />
            <PageSizeItemSettings  Caption="" Visible="false"    />
            <Summary   Position="right"   Text=".صفحة {0} من {1} ( عدد الاصناف:  {2} صنف) " />
             
         

        </SettingsPager>  
        <CssClasses HeaderRow="customHeaderStyle"   /> 
        
        <SettingsSearchPanel   SearchInPreview="true" Delay="1200"   Visible="True" />
        
        <SettingsLoadingPanel  ImagePosition="Top"   Text="جاري التحميل ..." />
         
        <Columns>

            <dx:BootstrapGridViewTextColumn Caption="رقم " FieldName="RefNo" VisibleIndex="0">
            </dx:BootstrapGridViewTextColumn>


            <dx:BootstrapGridViewTextColumn Caption="اسم" FieldName="RefName" VisibleIndex="1">
            </dx:BootstrapGridViewTextColumn>


            <dx:BootstrapGridViewTextColumn Caption="النوع" FieldName="RefTypeName" VisibleIndex="2">
            </dx:BootstrapGridViewTextColumn>
            <dx:BootstrapGridViewTextColumn Caption="طريقة البيع" FieldName="PriceName" VisibleIndex="3">
            </dx:BootstrapGridViewTextColumn>


            
            <dx:BootstrapGridViewTextColumn Caption="المدينة" FieldName="City" VisibleIndex="5">
            </dx:BootstrapGridViewTextColumn>
 

            <dx:BootstrapGridViewTextColumn Caption="ملاحظات" FieldName="RefMemo" VisibleIndex="7">
            </dx:BootstrapGridViewTextColumn>

            <dx:BootstrapGridViewTextColumn Caption="الحالة" FieldName="Active" VisibleIndex="7">
            </dx:BootstrapGridViewTextColumn>
           <dx:BootstrapGridViewTextColumn Caption="العنوان" FieldName="Address" VisibleIndex="7">
            </dx:BootstrapGridViewTextColumn>

        </Columns>
       



    </dx:BootstrapGridView>
   
    <asp:SqlDataSource ID="SqlRef"
        runat="server" 
        ConnectionString="<%$ ConnectionStrings:one %>"
        SelectCommand="SELECT   * FROM referancesView"></asp:SqlDataSource>
</ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>