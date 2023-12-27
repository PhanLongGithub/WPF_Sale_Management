using System;
using System.Collections.Generic;
using BusinessObject;
using Microsoft.EntityFrameworkCore;

namespace DataAccess.Repository;

public partial class FstoreContext : DbContext
{
    public FstoreContext()
    {
    }

    public FstoreContext(DbContextOptions<FstoreContext> options)
        : base(options)
    {
    }

    public virtual DbSet<MemberObject> Members { get; set; }

    public virtual DbSet<OrderObject> Orders { get; set; }

    public virtual DbSet<OrderDetailObject> OrderDetails { get; set; }

    public virtual DbSet<ProductObject> Products { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("server =(local); database = FStore;uid=long;pwd=Phan5664;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<MemberObject>(entity =>
        {
            entity.HasKey(e => e.MemberId).HasName("PK__Member__0CF04B18D26E0498");

            entity.ToTable("Member");

            entity.Property(e => e.MemberId).ValueGeneratedNever();
            entity.Property(e => e.City)
                .HasMaxLength(15)
                .IsUnicode(false);
            entity.Property(e => e.CompanyName)
                .HasMaxLength(40)
                .IsUnicode(false);
            entity.Property(e => e.Country)
                .HasMaxLength(15)
                .IsUnicode(false);
            entity.Property(e => e.Email)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Password)
                .HasMaxLength(30)
                .IsUnicode(false);
        });

        modelBuilder.Entity<OrderObject>(entity =>
        {
            entity.HasKey(e => e.OrderId).HasName("PK__Order__C3905BCF3795D359");

            entity.ToTable("Order");

            entity.Property(e => e.OrderId).ValueGeneratedNever();
            entity.Property(e => e.Freight).HasColumnType("money");
            entity.Property(e => e.OrderDate).HasColumnType("datetime");
            entity.Property(e => e.RequiredDate).HasColumnType("datetime");
            entity.Property(e => e.ShippedDate).HasColumnType("datetime");

            entity.HasOne(d => d.Member).WithMany(p => p.Orders)
                .HasForeignKey(d => d.MemberId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Order__MemberId__267ABA7A");
        });

        modelBuilder.Entity<OrderDetailObject>(entity =>
        {
            entity.HasKey(e => e.OrderId).HasName("PK__OrderDet__C3905BCF65B10063");

            entity.ToTable("OrderDetail");

            entity.Property(e => e.OrderId).ValueGeneratedNever();
            entity.Property(e => e.UnitPrice).HasColumnType("money");

            entity.HasOne(d => d.Product).WithMany(p => p.OrderDetails)
                .HasForeignKey(d => d.ProductId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__OrderDeta__Disco__2D27B809");
        });

        modelBuilder.Entity<ProductObject>(entity =>
        {
            entity.HasKey(e => e.ProductId).HasName("PK__Product__B40CC6CDEC2F517A");

            entity.ToTable("Product");

            entity.Property(e => e.ProductId).ValueGeneratedNever();
            entity.Property(e => e.ProductName)
                .HasMaxLength(40)
                .IsUnicode(false);
            entity.Property(e => e.UnitPrice).HasColumnType("money");
            entity.Property(e => e.Weight)
                .HasMaxLength(20)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
