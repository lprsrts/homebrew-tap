cask "fringe" do
  version "0.3.0"
  sha256 "b72d49fb9214475e93e672fec47a013ff79f80951b72b8c248e86fbc896984d9"

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
