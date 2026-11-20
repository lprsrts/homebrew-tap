cask "fringe" do
  version "0.4.1"
  sha256 "a852d3eb19b8d66b15f14ed5c55521f941da6d3ee7668e4c28ee1c70d7d25c83"

  url "https://github.com/lprsrts/fringe/releases/download/v#{version}/Fringe-#{version}-macos-arm64.dmg"
  name "Fringe"
  desc "Full-wave 2D optics simulator with FDTD, FEM and MoM solvers"
  homepage "https://github.com/lprsrts/fringe"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :tahoe"

  app "Fringe.app"

  zap trash: [
    "~/Library/Preferences/com.asympton.fringe.plist",
    "~/Library/Saved Application State/com.asympton.fringe.savedState",
  ]
end
