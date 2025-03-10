USE [EcoSalesMS]
GO
/****** Object:  StoredProcedure [dbo].[Sp_SupplierInfo]    Script Date: 7/30/2021 12:46:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  PROCEDURE [dbo].[Sp_SupplierInfo]
(
@mode int = 4,
@SupplierId int=null,
@Name nvarchar (100)=null,
@FatherName nvarchar(100)=null,
@Mobile nvarchar(100)=null,
@Phone nvarchar(100)=null,
@Telephone nvarchar(100)=null,
@Email nvarchar(50)=null,
@Religion nvarchar(50)=null,
@OccupId int=null,
@Reference nvarchar(100)=null,
@DistId int=null,
@ThanaId int=null,
@PostId int=null,
@ViId int=null,
@Address nvarchar(250)=null,
@Remarks nvarchar(250)=null,
@Photo image='',
@IsSupplier nvarchar(3)=null,
@UserId nvarchar (50) =null,
@Lmdt datetime = null
)
as
Declare @vSupplierFound		int
Declare @vErrorMsg		varchar(2000)

if @mode=1
begin
	insert into tblSuppliers(SupplierId,Name,FatherName,Mobile,Phone,Telephone,Email,Religion,Reference,Remarks,Photo,OccupId,Address,ViId,PostId,ThanaId,DistId,IsSupplier,UserId,Lmdt)
	values (@SupplierId,@Name,@FatherName,@Mobile,@Phone,@Telephone,@Email,@Religion,@Reference,@Remarks,@Photo,@OccupId,@Address,@ViId,@PostId,@ThanaId,@DistId,@IsSupplier,@UserId,GETDATE())				
end
if @mode=2
begin
	update tblSuppliers set Name=@Name,FatherName=@FatherName,Mobile=@Mobile,Phone=@Phone,Telephone=@Telephone,Email=@Email,Religion=@Religion,Reference=@Reference,Remarks=@Remarks,Photo=@Photo,OccupId=@OccupId,
	Address=@Address,ViId=@ViId,PostId=@PostId,ThanaId=@ThanaId,DistId=@DistId,IsSupplier=@IsSupplier,UserId=@UserId,Lmdt=GETDATE() where SupplierId=@SupplierId
end
if @mode=3
begin
	select @vSupplierFound=isnull(SupplierId,0) from tblPurchaseHDR where SupplierId=@SupplierId
	if isnull(@vSupplierFound,0)>0
	begin
		SET @vErrorMsg='Can not Proceed. Supplier Already Tagged in Purchase.'
		GOTO ERR_HANDLER1
	end
	delete from tblSuppliers  where SupplierId=@SupplierId
end
if @mode=4
begin
	select * from tblSuppliers
end
if @mode=5
begin
	select a.SupplierId,a.Name,a.FatherName,a.Mobile,a.Phone,a.Telephone,a.Email,a.Religion,a.OccupId,f.Name as OccuName, a.Reference,a.DistId,b.Name as DistName,a.ThanaId,c.Name as ThanaName, a.PostId,d.Name as PostName,
	a.ViId,e.Name as VilName, a.Address,a.Remarks,a.Photo,a.IsSupplier,a.UserId,a.Lmdt
	from tblSuppliers a 
	left join tblDistricts b on a.DistId=b.DistId
	left join tblThanas c on a.ThanaId=c.ThanaId
	left join tblPosts d on a.PostId=d.PostId
	left join tblVillages e on a.ViId=e.ViId
	left join tblDesignations f on a.OccupId=f.DesigId
	where SupplierId=@SupplierId
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

