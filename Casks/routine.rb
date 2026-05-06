cask "routine" do
  version "1.0.4"
  sha256 "1d42ec2c861ea819b82b5c9d25f6eaff0eba5a41aa827bca7f7a2538d2b301a4"

  url "https://github.com/box-kr/routine/releases/download/v#{version}/Routine-#{version}.zip"
  name "Routine"
  desc "macOS automation system based on user patterns (Time, Wi-Fi, Battery, etc.)"
  homepage "https://github.com/box-kr/routine"

  app "Routine.app"

  # 다운로드 후 Gatekeeper에서 '손상된 앱'으로 인식되는 것을 방지합니다.
  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/Routine.app"],
                   sudo: false,
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Preferences/kr.box.apps.macos.routine.plist",
  ]
end
