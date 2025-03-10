USE [EcoSalesMS]
GO
/****** Object:  StoredProcedure [dbo].[Sp_CustomerInfo]    Script Date: 7/30/2021 12:42:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  PROCEDURE [dbo].[Sp_CustomerInfo]
(
	@mode int = 4,
	@CustId int=null,
	@Name nvarchar (100)=null,
	@FatherName nvarchar(100)=null,
	@Mobile nvarchar(100)=null,
	@Phone nvarchar(100)=null,
	@Telephone nvarchar(100)=null,
	@Email nvarchar(50)=null,
	@CustomerTerritoryCode nvarchar(50)=null,
	@Religion nvarchar(50)=null,
	@OccupId int=null,
	@Reference nvarchar(100)=null,
	@DistId int=null,
	@ThanaId int=null,
	@PostId int=null,
	@ViId int=null,
	@Address nvarchar(250)=null,
	@DeliveryAddress nvarchar(250)=null,
	@Remarks nvarchar(250)=null,
	@Photo image='',
	@IsSupplier nvarchar(3)=null,
	@Region		int=0,
	@Area		int=0,
	@Teritory	int=0,
	@UserId nvarchar (50) =null,
	@Lmdt datetime = null
)
as
Declare @vCustFound		int
Declare @vErrorMsg		varchar(2000)
if @mode=1
begin
	insert into tblCustomers (CustId,Name,FatherName,Mobile,Phone,Telephone,Email,CustomerTerritoryCode,Religion,Reference,Remarks,Photo,OccupId,Address,DeliveryAddress,ViId,PostId,ThanaId,DistId,IsSupplier,Region,Area,Teritory,UserId,Lmdt)
	values (@CustId,@Name,@FatherName,@Mobile,@Phone,@Telephone,@Email,@CustomerTerritoryCode,@Religion,@Reference,@Remarks,@Photo,@OccupId,@Address,@DeliveryAddress,@ViId,@PostId,@ThanaId,@DistId,@IsSupplier,@Region,@Area,@Teritory,@UserId,GETDATE())				
end
if @mode=2
begin
	update tblCustomers set Name=@Name,FatherName=@FatherName,Mobile=@Mobile,Phone=@Phone,Telephone=@Telephone,Email=@Email,CustomerTerritoryCode=@CustomerTerritoryCode,Religion=@Religion,Reference=@Reference,Remarks=@Remarks,Photo=@Photo,OccupId=@OccupId,
	Address=@Address,DeliveryAddress=@DeliveryAddress,ViId=@ViId,PostId=@PostId,ThanaId=@ThanaId,DistId=@DistId,IsSupplier=@IsSupplier,Region=@Region,Area=@Area,Teritory=@Teritory, UserId=@UserId,Lmdt=GETDATE() where CustId=@CustId
end
if @mode=3
begin
	select @vCustFound=isnull(CustId,0) from tblSalesHDR where CustId=@CustId
	if isnull(@vCustFound,0)>0
	begin
		SET @vErrorMsg='Can not Proceed. Customer Already Tagged in Sales.'
		GOTO ERR_HANDLER1
	end
	delete from tblCustomers  where CustId=@CustId
end
if @mode=4
begin
	select * from tblCustomers
end
if @mode=5
begin
	select a.CustId,a.Name,a.FatherName,a.Mobile,a.Phone,a.Telephone,a.Email,a.CustomerTerritoryCode,a.Religion,a.OccupId,
	f.Name as OccuName, a.Reference,a.DistId,b.Name as DistName,a.ThanaId,c.Name as ThanaName, a.PostId,d.Name as PostName,
	a.ViId,e.Name as VilName,g.Name StaffName, a.Address,a.DeliveryAddress,a.Remarks,a.Photo,a.IsSupplier,a.UserId,a.Lmdt,
	a.Region,a.Area,a.Teritory,h.Name RegionName, i.Name AreaName, j.Name TeritoryName

	from tblCustomers a 
	left join tblDistricts b on a.DistId=b.DistId
	left join tblThanas c on a.ThanaId=c.ThanaId
	left join tblPosts d on a.PostId=d.PostId
	left join tblVillages e on a.ViId=e.ViId
	left join tblDesignations f on a.OccupId=f.DesigId
	left join tblStaff g on a.Reference=g.StaffId
	left join tblRegion h on a.Region=h.RegionId
	left join tblArea i on a.Area=i.AreaId
	left join tblTeritory j on a.Teritory=j.TeritoryId
	where CustId=@CustId
end
if @mode=6 -- get staff name
begin
	select a.StaffId,a.Name from tblStaff a
end
if @mode=7 
begin
	select a.RegionId,a.Name from tblRegion a
end
if @mode=8 
begin
	select a.AreaId,a.Name from tblArea a
	where a.RegionId=@Region
end
if @mode=9 
begin
	select a.TeritoryId,a.Name from tblTeritory a
	where a.AreaId=@Area
end

CleanUp:
	RETURN	
	
ERR_HANDLER:
	--SELECT @v_ErrorMsg = MATRIXSYSDB.DBO.fn_GetSystemMessages(@v_ErrorNo, 
	--                                                          @v_Disp_1, 
	--                                                          @v_Disp_2, 
	--                                                          @v_Disp_3, 
	--                                                          @v_Disp_4, 
	--                                                          @v_Disp_5)
	RAISERROR (@vErrorMsg,16,1)
    GOTO CleanUp
ERR_HANDLER1:
	RAISERROR (@vErrorMsg,16,1)
    GOTO CleanUp


