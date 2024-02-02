using System;
using System.Collections.Generic;
using ApiMarket.Models;
using ApiMarket.Models.Manufacturer;
using ApiMarket.Models.Product;
using Microsoft.EntityFrameworkCore;

namespace ApiMarket.Context;

public partial class Ispp01up02Context : DbContext
{
    public Ispp01up02Context()
    {
    }

    public Ispp01up02Context(DbContextOptions<Ispp01up02Context> options)
        : base(options)
    {
    }

    public virtual DbSet<Category> Categories { get; set; }

    public virtual DbSet<City> Cities { get; set; }

    public virtual DbSet<Manufacturer> Manufacturers { get; set; }

    public virtual DbSet<Manufacturertype> Manufacturertypes { get; set; }

    public virtual DbSet<Material> Materials { get; set; }

    public virtual DbSet<MaterialType> Materialtypes { get; set; }

    public virtual DbSet<MeasureType> Measuretypes { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<Ordercomposion> Ordercomposions { get; set; }

    public virtual DbSet<Orderstatus> Orderstatuses { get; set; }

    public virtual DbSet<Pickuppoint> Pickuppoints { get; set; }

    public virtual DbSet<Product> Products { get; set; }

    public virtual DbSet<Provider> Providers { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseMySql("username=ispp01up02;password=02;host=prserver;port=3306;database=ispp01up02", Microsoft.EntityFrameworkCore.ServerVersion.Parse("8.0.21-mysql"));

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder
            .UseCollation("utf8mb4_0900_ai_ci")
            .HasCharSet("utf8mb4");

        modelBuilder.Entity<Category>(entity =>
        {
            entity.HasKey(e => e.CategoryId).HasName("PRIMARY");

            entity.ToTable("category");

            entity.Property(e => e.CategoryId)
                .ValueGeneratedNever()
                .HasColumnName("CategoryID");
            entity.Property(e => e.CategoryName).HasMaxLength(200);
        });

        modelBuilder.Entity<City>(entity =>
        {
            entity.HasKey(e => e.CityId).HasName("PRIMARY");

            entity.ToTable("city");

            entity.Property(e => e.CityId).HasColumnName("CityID");
            entity.Property(e => e.CityName).HasColumnType("text");
        });

        modelBuilder.Entity<Manufacturer>(entity =>
        {
            entity.HasKey(e => e.ManufacturerId).HasName("PRIMARY");

            entity.ToTable("manufacturer");

            entity.HasIndex(e => e.ManufacturerTypeId, "fk_Manufacturer_ManufacturerType1_idx");

            entity.Property(e => e.ManufacturerId).HasColumnName("ManufacturerID");
            entity.Property(e => e.ManufacturerInn)
                .HasMaxLength(45)
                .HasColumnName("ManufacturerINN");
            entity.Property(e => e.ManufacturerName).HasMaxLength(110);
            entity.Property(e => e.ManufacturerTypeId).HasColumnName("ManufacturerTypeID");

            entity.HasOne(d => d.ManufacturerType).WithMany(p => p.Manufacturers)
                .HasForeignKey(d => d.ManufacturerTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_Manufacturer_ManufacturerType1");
        });

        modelBuilder.Entity<Manufacturertype>(entity =>
        {
            entity.HasKey(e => e.ManufacturerTypeId).HasName("PRIMARY");

            entity.ToTable("manufacturertype");

            entity.Property(e => e.ManufacturerTypeId).HasColumnName("ManufacturerTypeID");
            entity.Property(e => e.ManufacturerTypeName).HasMaxLength(10);
        });

        modelBuilder.Entity<Material>(entity =>
        {
            entity.HasKey(e => e.MaterialId).HasName("PRIMARY");

            entity.ToTable("material");

            entity.HasIndex(e => e.MaterialTypeId, "fk_material_materialtype1_idx");

            entity.HasIndex(e => e.MeasureTypeId, "fk_material_measuretype1_idx");

            entity.Property(e => e.MaterialId).HasColumnName("MaterialID");
            entity.Property(e => e.MaterialImagePath).HasMaxLength(150);
            entity.Property(e => e.MaterialName).HasMaxLength(100);
            entity.Property(e => e.MaterialTypeId).HasColumnName("MaterialTypeID");
            entity.Property(e => e.MeasureTypeId).HasColumnName("MeasureTypeID");

            entity.HasOne(d => d.MaterialType).WithMany(p => p.Materials)
                .HasForeignKey(d => d.MaterialTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_material_materialtype1");

            entity.HasOne(d => d.MeasureType).WithMany(p => p.Materials)
                .HasForeignKey(d => d.MeasureTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_material_measuretype1");

            entity.HasMany(d => d.Manufacturers).WithMany(p => p.Materials)
                .UsingEntity<Dictionary<string, object>>(
                    "Materialmanufacturer",
                    r => r.HasOne<Manufacturer>().WithMany()
                        .HasForeignKey("ManufacturerId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("fk_material_has_manufacturer_manufacturer1"),
                    l => l.HasOne<Material>().WithMany()
                        .HasForeignKey("MaterialId")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("fk_material_has_manufacturer_material1"),
                    j =>
                    {
                        j.HasKey("MaterialId", "ManufacturerId")
                            .HasName("PRIMARY")
                            .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });
                        j.ToTable("materialmanufacturer");
                        j.HasIndex(new[] { "ManufacturerId" }, "fk_material_has_manufacturer_manufacturer1_idx");
                        j.HasIndex(new[] { "MaterialId" }, "fk_material_has_manufacturer_material1_idx");
                    });
        });

        modelBuilder.Entity<MaterialType>(entity =>
        {
            entity.HasKey(e => e.MaterialTypeId).HasName("PRIMARY");

            entity.ToTable("materialtype");

            entity.Property(e => e.MaterialTypeId).HasColumnName("MaterialTypeID");
            entity.Property(e => e.MaterialTypeName).HasMaxLength(45);
        });

        modelBuilder.Entity<MeasureType>(entity =>
        {
            entity.HasKey(e => e.MeasureTypeId).HasName("PRIMARY");

            entity.ToTable("measuretype");

            entity.Property(e => e.MeasureTypeId).HasColumnName("MeasureTypeID");
            entity.Property(e => e.MeasureTypeName).HasMaxLength(45);
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.HasKey(e => e.OrderId).HasName("PRIMARY");

            entity.ToTable("order");

            entity.HasIndex(e => e.OrderStatusId, "fk_order_orderstatus1_idx");

            entity.HasIndex(e => e.PickupPointId, "fk_order_pickuppoint1_idx");

            entity.HasIndex(e => e.UserId, "fk_order_user1_idx");

            entity.Property(e => e.OrderId).HasColumnName("OrderID");
            entity.Property(e => e.OrderReceiveCode).HasMaxLength(10);
            entity.Property(e => e.OrderStatusId).HasColumnName("OrderStatusID");
            entity.Property(e => e.PickupPointId).HasColumnName("PickupPointID");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.OrderStatus).WithMany(p => p.Orders)
                .HasForeignKey(d => d.OrderStatusId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_order_orderstatus1");

            entity.HasOne(d => d.PickupPoint).WithMany(p => p.Orders)
                .HasForeignKey(d => d.PickupPointId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_order_pickuppoint1");

            entity.HasOne(d => d.User).WithMany(p => p.Orders)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("fk_order_user1");
        });

        modelBuilder.Entity<Ordercomposion>(entity =>
        {
            entity.HasKey(e => new { e.ProductArticleNumber, e.OrderId })
                .HasName("PRIMARY")
                .HasAnnotation("MySql:IndexPrefixLength", new[] { 0, 0 });

            entity.ToTable("ordercomposion");

            entity.HasIndex(e => e.OrderId, "fk_product_has_order_order1_idx");

            entity.HasIndex(e => e.ProductArticleNumber, "fk_product_has_order_product1_idx");

            entity.Property(e => e.ProductArticleNumber)
                .HasMaxLength(100)
                .UseCollation("utf8_general_ci")
                .HasCharSet("utf8");
            entity.Property(e => e.OrderId).HasColumnName("OrderID");

            entity.HasOne(d => d.Order).WithMany(p => p.Ordercomposions)
                .HasForeignKey(d => d.OrderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_product_has_order_order1");

            entity.HasOne(d => d.ProductArticleNumberNavigation).WithMany(p => p.Ordercomposions)
                .HasForeignKey(d => d.ProductArticleNumber)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_product_has_order_product1");
        });

        modelBuilder.Entity<Orderstatus>(entity =>
        {
            entity.HasKey(e => e.OrderStatusId).HasName("PRIMARY");

            entity.ToTable("orderstatus");

            entity.HasIndex(e => e.OrderStatusName, "OrderStatusName_UNIQUE").IsUnique();

            entity.Property(e => e.OrderStatusId).HasColumnName("OrderStatusID");
            entity.Property(e => e.OrderStatusName)
                .HasMaxLength(45)
                .HasDefaultValueSql("'Новый'");
        });

        modelBuilder.Entity<Pickuppoint>(entity =>
        {
            entity.HasKey(e => e.PickupPointId).HasName("PRIMARY");

            entity.ToTable("pickuppoint");

            entity.HasIndex(e => e.CityId, "fk_pickuppoint_city1_idx");

            entity.Property(e => e.PickupPointId).HasColumnName("PickupPointID");
            entity.Property(e => e.CityId).HasColumnName("CityID");
            entity.Property(e => e.PickupPointBuilding).HasMaxLength(10);
            entity.Property(e => e.PickupPointStreet).HasColumnType("text");
            entity.Property(e => e.PuckupPointIndex).HasColumnType("text");

            entity.HasOne(d => d.City).WithMany(p => p.Pickuppoints)
                .HasForeignKey(d => d.CityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_pickuppoint_city1");
        });

        modelBuilder.Entity<Product>(entity =>
        {
            entity.HasKey(e => e.ProductArticleNumber).HasName("PRIMARY");

            entity.ToTable("product");

            entity.HasIndex(e => e.CategoryId, "fk_product_category1_idx");

            entity.HasIndex(e => e.MeasureTypeId, "fk_product_measuretype1_idx");

            entity.HasIndex(e => e.ProviderId, "fk_product_provider1_idx");

            entity.HasIndex(e => e.ManufacturerId, "fk_product_provider2_idx");

            entity.Property(e => e.ProductArticleNumber)
                .HasMaxLength(100)
                .UseCollation("utf8_general_ci")
                .HasCharSet("utf8");
            entity.Property(e => e.CategoryId).HasColumnName("CategoryID");
            entity.Property(e => e.ManufacturerId).HasColumnName("ManufacturerID");
            entity.Property(e => e.MeasureTypeId).HasColumnName("MeasureTypeID");
            entity.Property(e => e.ProductDescription).HasColumnType("text");
            entity.Property(e => e.ProductName).HasColumnType("text");
            entity.Property(e => e.ProductPhoto).HasMaxLength(100);
            entity.Property(e => e.ProviderId).HasColumnName("ProviderID");

            entity.HasOne(d => d.Category).WithMany(p => p.Products)
                .HasForeignKey(d => d.CategoryId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_product_category1");

            entity.HasOne(d => d.Manufacturer).WithMany(p => p.ProductManufacturers)
                .HasForeignKey(d => d.ManufacturerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_product_provider2");

            entity.HasOne(d => d.MeasureType).WithMany(p => p.Products)
                .HasForeignKey(d => d.MeasureTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_product_measuretype1");

            entity.HasOne(d => d.Provider).WithMany(p => p.ProductProviders)
                .HasForeignKey(d => d.ProviderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_product_provider1");
        });

        modelBuilder.Entity<Provider>(entity =>
        {
            entity.HasKey(e => e.ProviderId).HasName("PRIMARY");

            entity.ToTable("provider");

            entity.Property(e => e.ProviderId).HasColumnName("ProviderID");
            entity.Property(e => e.ProviderName).HasMaxLength(45);
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.RoleId).HasName("PRIMARY");

            entity.ToTable("role");

            entity.Property(e => e.RoleId).HasColumnName("RoleID");
            entity.Property(e => e.RoleName).HasMaxLength(100);
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PRIMARY");

            entity.ToTable("user");

            entity.HasIndex(e => e.RoleId, "UserRole");

            entity.Property(e => e.UserId).HasColumnName("UserID");
            entity.Property(e => e.RoleId).HasColumnName("RoleID");
            entity.Property(e => e.UserLogin).HasColumnType("text");
            entity.Property(e => e.UserName).HasMaxLength(100);
            entity.Property(e => e.UserPassword).HasColumnType("text");
            entity.Property(e => e.UserPatronymic).HasMaxLength(100);
            entity.Property(e => e.UserSurname).HasMaxLength(100);

            entity.HasOne(d => d.Role).WithMany(p => p.Users)
                .HasForeignKey(d => d.RoleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("user_ibfk_1");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
