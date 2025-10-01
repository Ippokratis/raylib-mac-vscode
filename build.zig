const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardOptimizeOption(.{});

    const module = b.addModule("main", .{
        .target = target,
        .optimize = mode,
        .link_libc = true,
    });

    module.addCSourceFile(.{
        .file = b.path("src/main.c"),
        .flags = &[_][]const u8{"-std=c11"},
    });

    const exe = b.addExecutable(.{
        .name = "game",
        .root_module = module,
    });

    exe.linkSystemLibrary("raylib");

    if (target.result.os.tag == .macos) {
        exe.linkFramework("IOKit");
        exe.linkFramework("Cocoa");
        exe.linkFramework("OpenGL");
    }

    b.installArtifact(exe);
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the game");
    run_step.dependOn(&run_cmd.step);
}
