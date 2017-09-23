create database GestAssurance 
Go
use GestAssurance
GO
create table Maladie(
Num_Maladie int constraint PK_Maladie Primary Key,
Designation_Maladie varchar(30)
)
GO
create table Entreprise(
Num_Entreprise  int constraint PK_Entreprise Primary Key,
Nom_Entreprise varchar(30),
Adresse varchar(50),
Telephone varchar(20),
Nombre_Employe int ,
Email varchar(30)
)
GO
create table Assure (
Matricule varchar(20) constraint PK_Assure Primary Key,
Nom_Ass varchar(30),
Date_Naissance date,
Nb_Enfant int ,
Situation_Familiale varchar(20),
Num_Entreprise  int constraint FK_Assure_Entreprise Foreign key (Num_Entreprise) references Entreprise(Num_Entreprise),
Total_Remb float ,
Date_Deces date ,
Mot_DePasse varchar(30)
)
GO
create table Dossier(
NumDossier int constraint PK_Dossier Primary Key,
DateDepot date ,
Montant_Remboursement float ,
Date_Traitement Date ,
Lien_Malade varchar(30),
Matricule varchar(20) constraint FK_Dossier_Assure Foreign key (Matricule) references Assure(Matricule),
Num_Maladie int constraint FK_Dossier_Maladie Foreign key (Num_Maladie) references Maladie(Num_Maladie),
Total_Dossier float
)
GO

GO
create table Rubrique(
Num_Rubrique int constraint PK_Rubrique Primary Key,
Nom_Rubrique varchar(30),
NumDossier int  constraint FK_Rubrique_Dossier Foreign key (NumDossier) references Dossier(NumDossier),
Montant_Rubrique float,
)
GO
USE [GestAssurance]
GO
INSERT [dbo].[Entreprise] ([Num_Entreprise], [Nom_Entreprise], [Adresse], [Telephone], [Nombre_Employe], [Email]) VALUES (1, N'NomEntr1', N'AdressEntre1', N'0611111111', 20, N'Entre1@gmail.com')
INSERT [dbo].[Entreprise] ([Num_Entreprise], [Nom_Entreprise], [Adresse], [Telephone], [Nombre_Employe], [Email]) VALUES (2, N'NomEntr2', N'AdressEntre2', N'0622222222', 50, N'Entre2@gmail.com')
INSERT [dbo].[Entreprise] ([Num_Entreprise], [Nom_Entreprise], [Adresse], [Telephone], [Nombre_Employe], [Email]) VALUES (3, N'NomEntr3', N'AdressEntre3', N'0633333333', 10, N'Entre3@gmail.com')
INSERT [dbo].[Assure] ([Matricule], [Nom_Ass], [Date_Naissance], [Nb_Enfant], [Situation_Familiale], [Num_Entreprise], [Total_Remb], [Date_Deces], [Mot_DePasse]) VALUES (N'M1', N'NomDAssure1', CAST(N'2001-12-03' AS Date), 2, N'Marie', 1, NULL, NULL, N'M1')
INSERT [dbo].[Assure] ([Matricule], [Nom_Ass], [Date_Naissance], [Nb_Enfant], [Situation_Familiale], [Num_Entreprise], [Total_Remb], [Date_Deces], [Mot_DePasse]) VALUES (N'M2', N'NomDAssure2', CAST(N'1995-12-03' AS Date), 3, N'Marie', 1, NULL, NULL, N'M2')
INSERT [dbo].[Assure] ([Matricule], [Nom_Ass], [Date_Naissance], [Nb_Enfant], [Situation_Familiale], [Num_Entreprise], [Total_Remb], [Date_Deces], [Mot_DePasse]) VALUES (N'M3', N'NomDAssure3', CAST(N'1994-12-03' AS Date), 0, N'', 2, NULL, NULL, N'M3')
INSERT [dbo].[Assure] ([Matricule], [Nom_Ass], [Date_Naissance], [Nb_Enfant], [Situation_Familiale], [Num_Entreprise], [Total_Remb], [Date_Deces], [Mot_DePasse]) VALUES (N'M4', N'NomDAssure4', CAST(N'1993-12-03' AS Date), 0, N'', 3, NULL, NULL, N'M3')
INSERT [dbo].[Maladie] ([Num_Maladie], [Designation_Maladie]) VALUES (1, N'DesMaladie1')
INSERT [dbo].[Maladie] ([Num_Maladie], [Designation_Maladie]) VALUES (2, N'DesMaladie2')
INSERT [dbo].[Maladie] ([Num_Maladie], [Designation_Maladie]) VALUES (3, N'DesMaladie3')
INSERT [dbo].[Maladie] ([Num_Maladie], [Designation_Maladie]) VALUES (4, N'DesMaladie4')
INSERT [dbo].[Dossier] ([NumDossier], [DateDepot], [Montant_Remboursement], [Date_Traitement], [Lien_Malade], [Matricule], [Num_Maladie], [Total_Dossier]) VALUES (1, CAST(N'2017-12-05' AS Date), NULL, NULL, N'Fils', N'M1', 1, NULL)
INSERT [dbo].[Dossier] ([NumDossier], [DateDepot], [Montant_Remboursement], [Date_Traitement], [Lien_Malade], [Matricule], [Num_Maladie], [Total_Dossier]) VALUES (2, CAST(N'2017-04-05' AS Date), NULL, NULL, N'Filles', N'M2', 3, NULL)
INSERT [dbo].[Dossier] ([NumDossier], [DateDepot], [Montant_Remboursement], [Date_Traitement], [Lien_Malade], [Matricule], [Num_Maladie], [Total_Dossier]) VALUES (3, CAST(N'2017-05-05' AS Date), NULL, NULL, N'Filles', N'M3', 2, NULL)
INSERT [dbo].[Dossier] ([NumDossier], [DateDepot], [Montant_Remboursement], [Date_Traitement], [Lien_Malade], [Matricule], [Num_Maladie], [Total_Dossier]) VALUES (4, CAST(N'2016-05-05' AS Date), NULL, NULL, N'Fils', N'M4', 4, NULL)
INSERT [dbo].[Rubrique] ([Num_Rubrique], [Nom_Rubrique], [NumDossier], [Montant_Rubrique]) VALUES (1, N'Radios', 2, 500)
INSERT [dbo].[Rubrique] ([Num_Rubrique], [Nom_Rubrique], [NumDossier], [Montant_Rubrique]) VALUES (2, N'Pharmacie', 2, 300)
INSERT [dbo].[Rubrique] ([Num_Rubrique], [Nom_Rubrique], [NumDossier], [Montant_Rubrique]) VALUES (3, N'Pharmacie', 1, 1400)
INSERT [dbo].[Rubrique] ([Num_Rubrique], [Nom_Rubrique], [NumDossier], [Montant_Rubrique]) VALUES (4, N'Radios', 1, 200)
INSERT [dbo].[Rubrique] ([Num_Rubrique], [Nom_Rubrique], [NumDossier], [Montant_Rubrique]) VALUES (5, N'Radios', 3, 2000)
INSERT [dbo].[Rubrique] ([Num_Rubrique], [Nom_Rubrique], [NumDossier], [Montant_Rubrique]) VALUES (6, N'Soins', 3, 550)
INSERT [dbo].[Rubrique] ([Num_Rubrique], [Nom_Rubrique], [NumDossier], [Montant_Rubrique]) VALUES (7, N'Radios', 4, 1000)
INSERT [dbo].[Rubrique] ([Num_Rubrique], [Nom_Rubrique], [NumDossier], [Montant_Rubrique]) VALUES (8, N'Soins', 4, 1200)
INSERT [dbo].[Rubrique] ([Num_Rubrique], [Nom_Rubrique], [NumDossier], [Montant_Rubrique]) VALUES (9, N'Pharmacie', 4, 300)
GO

--2 -1
alter table Dossier add constraint CH_DateDepot_DateTreaitement check( DateDepot <= Date_Traitement)
GO
alter table Dossier add constraint CH_LienMaladie check(Lien_Malade in ('fils','fille','conjoint'))
GO
--3 
ALTER TABLE Assure Add constraint D_Total_Remb default '0' for Total_Remb
GO
--4
SELECT     dbo.Assure.Matricule, COUNT(dbo.Dossier.NumDossier) AS 'NombreTraiter'
FROM         dbo.Assure INNER JOIN
                      dbo.Dossier ON dbo.Assure.Matricule = dbo.Dossier.Matricule
WHERE     (dbo.Dossier.Date_Traitement IS NOT NULL)
GROUP BY dbo.Assure.Matricule
--5 
GO
create trigger TG_Assure_Deces on Assure
after update 
as begin 
if((select Date_Deces from inserted) is not null)
Begin
declare @Matricule varchar(20); 
set @Matricule  = (select Matricule from inserted)
delete from Rubrique where NumDossier in (select NumDossier from Dossier where Matricule = @Matricule);
delete from Dossier where  Matricule =@Matricule;
End
End 
GO
--6
create trigger TG_Rembourse on Dossier 
instead of update
as begin 
declare @montant float ;
declare @matricule varchar(20);
select @montant = Montant_Remboursement , @matricule = Matricule from inserted;
if(@montant is not null)
begin
if(@montant <= 1000)
begin
declare @total_rem float ;
set @total_rem = (select Total_Remb from Assure where Matricule = @matricule)
set @total_rem = @total_rem +@montant;
update Assure set Total_Remb = @total_rem where Matricule = (select Matricule from inserted)
end
else Begin 
Raiserror('Le plafond de remboursement est 1000 ',16,1)
End
End
UPDATE [dbo].[Dossier]
   SET [NumDossier] = I.[NumDossier]
      ,[DateDepot] = 	  I.[DateDepot] 
      ,[Montant_Remboursement] =  I.[Montant_Remboursement]
      ,[Date_Traitement] =    I.[Date_Traitement] 	
      ,[Lien_Malade] =	    I.[Lien_Malade] 		
      ,[Matricule] =	 I.[Matricule] 				
      ,[Num_Maladie] =	 I.[Num_Maladie]			
      ,[Total_Dossier] =			    I.[Total_Dossier] 						  							
	  from inserted I
	  where dbo.Dossier.NumDossier = I.NumDossier
end
GO
--7 
CREATE FUNCTION NombreDossier_LienMaladie_Assure (@Matricule varchar(20) )
RETURNS TABLE 
AS
RETURN 
(

SELECT     Lien_Malade,count(Dossier.Lien_Malade) as 'NombreDossier'
FROM         dbo.Assure INNER JOIN
                      dbo.Dossier ON dbo.Assure.Matricule = dbo.Dossier.Matricule
where dbo.Dossier.Matricule = @Matricule
group by Lien_Malade
)
GO
-- 8
create procedure NombDossRembourseEtNonRPArEntrepEtMois @Num_Entreprise int,@mois int
as begin 
declare @Rembourse int ;
declare @NonRembourse int ;
set @Rembourse = (SELECT count(*)
                    FROM    dbo.Assure A INNER JOIN
                      dbo.Dossier D ON A.Matricule = D.Matricule INNER JOIN
                      dbo.Entreprise E ON A.Num_Entreprise = E.Num_Entreprise
					 where E.Num_Entreprise = @Num_Entreprise and DatePart(MONTH,DateDepot) = @mois and Montant_Remboursement is not null
					  )
set @NonRembourse = (SELECT count(*)
                    FROM    dbo.Assure A INNER JOIN
                      dbo.Dossier D ON A.Matricule = D.Matricule INNER JOIN
                      dbo.Entreprise E ON A.Num_Entreprise = E.Num_Entreprise
					 where E.Num_Entreprise = @Num_Entreprise and DatePart(MONTH,DateDepot) = @mois and Montant_Remboursement is null
					  )
select   @Num_Entreprise as 'NumEntreprise', @mois as 'Mois',@Rembourse as 'Rembourse',@NonRembourse as 'NonRembourse'
end
-- test
--exec dbo.NombDossRembourseEtNonRPArEntrepEtMois '1' ,'5' 
 







