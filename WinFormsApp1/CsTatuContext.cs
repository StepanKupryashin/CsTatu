using Microsoft.EntityFrameworkCore;
using System.Configuration;
namespace WinFormsApp1;

public partial class CsTatuContext : DbContext
{
    public CsTatuContext()
    {
    }

    public CsTatuContext(DbContextOptions<CsTatuContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Appointment> Appointments { get; set; }

    public virtual DbSet<Material> Materials { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<Tattoo> Tattoos { get; set; }

    public virtual DbSet<UsedMaterial> UsedMaterials { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<WorkShedule> WorkShedules { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Appointment>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("appointments_pkey");

            entity.ToTable("appointments");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Status)
                .HasMaxLength(255)
                .HasColumnName("status");
            entity.Property(e => e.TattooId).HasColumnName("tattoo_id");
            entity.Property(e => e.UserId).HasColumnName("user_id");
            entity.Property(e => e.WorkSheduleId).HasColumnName("work_shedule_id");

            entity.HasOne(d => d.Tattoo).WithMany(p => p.Appointments)
                .HasForeignKey(d => d.TattooId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("appointments_tattoo_id_fkey");

            entity.HasOne(d => d.User).WithMany(p => p.Appointments)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("appointments_user_id_fkey");

            entity.HasOne(d => d.WorkShedule).WithMany(p => p.Appointments)
                .HasForeignKey(d => d.WorkSheduleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("appointments_work_shedule_id_fkey");
        });

        modelBuilder.Entity<Material>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("materials_pkey");

            entity.ToTable("materials");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Count).HasColumnName("count");
            entity.Property(e => e.Name)
                .HasMaxLength(255)
                .HasColumnName("name");
            entity.Property(e => e.Price)
                .HasColumnType("money")
                .HasColumnName("price");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("roles_pkey");

            entity.ToTable("roles");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Title)
                .HasMaxLength(255)
                .HasColumnName("title");
        });

        modelBuilder.Entity<Tattoo>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("tattoos_pkey");

            entity.ToTable("tattoos");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.AreaSize)
                .HasMaxLength(100)
                .HasColumnName("area_size");
            entity.Property(e => e.Image).HasColumnName("image");
            entity.Property(e => e.Price)
                .HasColumnType("money")
                .HasColumnName("price");
            entity.Property(e => e.Style)
                .HasMaxLength(255)
                .HasColumnName("style");
            entity.Property(e => e.Title)
                .HasMaxLength(255)
                .HasColumnName("title");
        });

        modelBuilder.Entity<UsedMaterial>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("used_materials_pkey");

            entity.ToTable("used_materials");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.MaterialId).HasColumnName("material_id");
            entity.Property(e => e.TattooId).HasColumnName("tattoo_id");

            entity.HasOne(d => d.Material).WithMany(p => p.UsedMaterials)
                .HasForeignKey(d => d.MaterialId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("used_materials_material_id_fkey");

            entity.HasOne(d => d.Tattoo).WithMany(p => p.UsedMaterials)
                .HasForeignKey(d => d.TattooId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("used_materials_tattoo_id_fkey");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("users_pkey");

            entity.ToTable("users");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Email)
                .HasMaxLength(255)
                .HasColumnName("email");
            entity.Property(e => e.FullName)
                .HasMaxLength(255)
                .HasColumnName("name");
            entity.Property(e => e.Password)
                .HasMaxLength(255)
                .HasColumnName("password");
            entity.Property(e => e.RoleId).HasColumnName("role_id");

            entity.HasOne(d => d.Role).WithMany(p => p.Users)
                .HasForeignKey(d => d.RoleId)
                .HasConstraintName("users_role_id_fkey");
        });

        modelBuilder.Entity<WorkShedule>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("work_shedules_pkey");

            entity.ToTable("work_shedules");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.UserId).HasColumnName("user_id");
            entity.Property(e => e.WorkingTime)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("working_time");

            entity.HasOne(d => d.User).WithMany(p => p.WorkShedules)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("work_shedules_user_id_fkey");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
