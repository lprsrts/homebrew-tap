class FringeCli < Formula
  desc "Full-wave 2D optics solver (FDTD, FEM, MoM) for the command-line"
  homepage "https://github.com/lprsrts/fringe"
  url "https://github.com/lprsrts/fringe/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "fbaae3d5349d81894a91f61c3b9d4939b57da5b95bc8da30d68916c80bf575f3"
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
