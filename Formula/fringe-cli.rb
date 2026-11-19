class FringeCli < Formula
  desc "Full-wave 2D optics solver (FDTD, FEM, MoM) for the command-line"
  homepage "https://github.com/lprsrts/fringe"
  url "https://github.com/lprsrts/fringe/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "966d523cea5693b6cdaea08329b57891132b0d4158095b60b373939043ee9820"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lprsrts/fringe.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--bin", "fringe-cli", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fringe-cli --version")
    scene = pipe_output("#{bin}/fringe-cli example lens")
    pipe_output("#{bin}/fringe-cli solve - -o lens.png --quality preview --quiet", scene, 0)
    assert_path_exists testpath/"lens.png"
  end
end
