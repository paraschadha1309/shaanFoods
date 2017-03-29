using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace ShaanFoods.Models
{
    public partial class ShaanFoodsContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            #warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
            optionsBuilder.UseSqlServer(@"Server=(local)\SQLEXPRESS;Database=ShaanFoods;Trusted_Connection=True;");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Account>(entity =>
            {
                entity.HasKey(e => e.UserId)
                    .HasName("PK_account");

                entity.ToTable("account");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.Property(e => e.Role)
                    .HasColumnName("role")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.UserName)
                    .IsRequired()
                    .HasColumnName("user_name")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.UserPassword)
                    .IsRequired()
                    .HasColumnName("user_password")
                    .HasColumnType("varchar(50)");
            });

            modelBuilder.Entity<CustomerOrder>(entity =>
            {
                entity.HasKey(e => e.OrderId)
                    .HasName("PK_customerOrder");

                entity.ToTable("customerOrder");

                entity.Property(e => e.OrderId).HasColumnName("order_id");

                entity.Property(e => e.CustomerName)
                    .IsRequired()
                    .HasColumnName("customer_name")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.CustomerPhone)
                    .IsRequired()
                    .HasColumnName("customer_phone")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Description)
                    .HasColumnName("description")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.OrderStatus)
                    .HasColumnName("order_status")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.PickupDate)
                    .HasColumnName("pickup_date")
                    .HasColumnType("date");

                entity.Property(e => e.PickupTime).HasColumnName("pickup_time");
            });

            modelBuilder.Entity<Employee>(entity =>
            {
                entity.ToTable("employee");

                entity.Property(e => e.EmployeeId).HasColumnName("employee_id");

                entity.Property(e => e.Dob)
                    .HasColumnName("dob")
                    .HasColumnType("date");

                entity.Property(e => e.Email)
                    .HasColumnName("email")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.EmergencyContact)
                    .HasColumnName("emergency_contact")
                    .HasColumnType("varchar(1)");

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasColumnName("first_name")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Gender)
                    .IsRequired()
                    .HasColumnName("gender")
                    .HasColumnType("varchar(10)");

                entity.Property(e => e.IsAdministrator)
                    .HasColumnName("isAdministrator")
                    .HasDefaultValueSql("1");

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasColumnName("last_name")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.MiddleName)
                    .IsRequired()
                    .HasColumnName("middle_name")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasColumnName("phone")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.PostalCode)
                    .HasColumnName("postalCode")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Sin)
                    .IsRequired()
                    .HasColumnName("sin")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Street)
                    .HasColumnName("street")
                    .HasColumnType("varchar(50)");
            });

            modelBuilder.Entity<Feedback>(entity =>
            {
                entity.HasKey(e => e.FeedId)
                    .HasName("PK_feedback");

                entity.ToTable("feedback");

                entity.Property(e => e.FeedId).HasColumnName("feed_id");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasColumnName("email")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Feedback1)
                    .IsRequired()
                    .HasColumnName("feedback")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasColumnName("first_name")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasColumnName("last_name")
                    .HasColumnType("varchar(50)");
            });

            modelBuilder.Entity<OrderDetails>(entity =>
            {
                entity.ToTable("orderDetails");

                entity.Property(e => e.OrderDetailsId).HasColumnName("order_details_id");

                entity.Property(e => e.OrderId).HasColumnName("order_id");

                entity.Property(e => e.OrderPrice)
                    .HasColumnName("order_price")
                    .HasColumnType("decimal");

                entity.Property(e => e.OrderQuantity).HasColumnName("order_quantity");

                entity.Property(e => e.OrderWeight)
                    .HasColumnName("order_weight")
                    .HasColumnType("decimal");

                entity.Property(e => e.PCategoryId).HasColumnName("p_category_id");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.OrderId)
                    .OnDelete(DeleteBehavior.Restrict)
                    .HasConstraintName("FK_orderDetails_customerOrder");

                entity.HasOne(d => d.PCategory)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.PCategoryId)
                    .OnDelete(DeleteBehavior.Restrict)
                    .HasConstraintName("FK_orderDetails_productsCategory");
            });

            modelBuilder.Entity<Products>(entity =>
            {
                entity.HasKey(e => e.ProductId)
                    .HasName("PK_products");

                entity.ToTable("products");

                entity.Property(e => e.ProductId).HasColumnName("product_id");

                entity.Property(e => e.ProductName)
                    .IsRequired()
                    .HasColumnName("product_name")
                    .HasColumnType("varchar(50)");
            });

            modelBuilder.Entity<ProductsCategory>(entity =>
            {
                entity.HasKey(e => e.PCategoryId)
                    .HasName("PK_productsCategory");

                entity.ToTable("productsCategory");

                entity.Property(e => e.PCategoryId).HasColumnName("p_category_id");

                entity.Property(e => e.CategoryName)
                    .IsRequired()
                    .HasColumnName("category_name")
                    .HasColumnType("varchar(50)");

                entity.Property(e => e.Description)
                    .HasColumnName("description")
                    .HasColumnType("varchar(100)");

                entity.Property(e => e.Price)
                    .HasColumnName("price")
                    .HasDefaultValueSql("0");

                entity.Property(e => e.ProductId).HasColumnName("product_id");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.ProductsCategory)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.Restrict)
                    .HasConstraintName("FK_productsCategory_products");
            });
        }

        public virtual DbSet<Account> Account { get; set; }
        public virtual DbSet<CustomerOrder> CustomerOrder { get; set; }
        public virtual DbSet<Employee> Employee { get; set; }
        public virtual DbSet<Feedback> Feedback { get; set; }
        public virtual DbSet<OrderDetails> OrderDetails { get; set; }
        public virtual DbSet<Products> Products { get; set; }
        public virtual DbSet<ProductsCategory> ProductsCategory { get; set; }
    }
}