const std = @import("std");

pub fn build(b: *std.Build) void {
  const target = b.standardTargetOptions(.{});
  const optimize = b.standardOptimizeOption(.{});
  const exe = b.addExecutable(.{
    .name = "main",
    .root_module = b.createModule(.{
      .root_source_file = b.path("src/main.zig"),
      .target = target,
      .optimize = optimize,
    }),
  });
  
  b.installArtifact(exe);

  const run_exe = b.addRunArtifact(exe);
  const run_step = b.step("run", "Run the application");
  run_step.dependOn(&run_exe.step);
}

// zig build run -Dtarget=aarch64-macos -Doptimize=ReleaseFast --summary all