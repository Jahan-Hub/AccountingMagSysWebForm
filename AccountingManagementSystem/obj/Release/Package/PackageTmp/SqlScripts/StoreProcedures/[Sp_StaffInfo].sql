USE [EcoSalesMS]
GO
/****** Object:  StoredProcedure [dbo].[Sp_StaffInfo]    Script Date: 7/30/2021 12:46:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER  PROCEDURE [dbo].[Sp_StaffInfo]
(
@mode int = 4,
@StaffId int=null,
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
@Salary decimal(18,0)=0,
@IsSupplier nvarchar(3)=null,
@UserId nvarchar (50) =null,
@Lmdt datetime = null
)
as
if @mode=1
begin
	insert into tblStaff(StaffId,Name,FatherName,Mobile,Phone,Telephone,Email,Religion,Reference,Remarks,Photo,Salary,OccupId,Address,ViId,PostId,ThanaId,DistId,IsSupplier,UserId,Lmdt)
	values (@StaffId,@Name,@FatherName,@Mobile,@Phone,@Telephone,@Email,@Religion,@Reference,@Remarks,@Photo,@Salary,@OccupId,@Address,@ViId,@PostId,@ThanaId,@DistId,@IsSupplier,@UserId,GETDATE())				
end
if @mode=2
begin
	update tblStaff set Name=@Name,FatherName=@FatherName,Mobile=@Mobile,Phone=@Phone,Telephone=@Telephone,Email=@Email,Religion=@Religion,Reference=@Reference,Remarks=@Remarks,Photo=@Photo,Salary=@Salary,OccupId=@OccupId,
	Address=@Address,ViId=@ViId,PostId=@PostId,ThanaId=@ThanaId,DistId=@DistId,IsSupplier=@IsSupplier,UserId=@UserId,Lmdt=GETDATE() where StaffId=@StaffId
end
if @mode=3
begin
	delete from tblStaff  where StaffId=@StaffId
end
if @mode=4
begin
	select * from tblStaff
end
if @mode=5
begin
	select a.StaffId,a.Name,a.FatherName,a.Mobile,a.Phone,a.Salary,a.Telephone,a.Email,a.Religion,a.OccupId,f.Name as OccuName, a.Reference,a.DistId,b.Name as DistName,a.ThanaId,c.Name as ThanaName, a.PostId,d.Name as PostName,
	a.ViId,e.Name as VilName, a.Address,a.Remarks,a.Photo,a.IsSupplier,a.UserId,a.Lmdt
	from tblStaff a 
	left join tblDistricts b on a.DistId=b.DistId
	left join tblThanas c on a.ThanaId=c.ThanaId
	left join tblPosts d on a.PostId=d.PostId
	left join tblVillages e on a.ViId=e.ViId
	left join tblDesignations f on a.OccupId=f.DesigId
	where StaffId=@StaffId
end
if @mode=6
begin
	select StaffId,Name from tblStaff
end



