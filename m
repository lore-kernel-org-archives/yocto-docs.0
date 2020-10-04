Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.10425.1601817170987311836
 for <docs@lists.yoctoproject.org>;
 Sun, 04 Oct 2020 06:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.232, mailfrom: foss@0leil.net)
Received: from fiqs.lan (80-110-110-137.cgn.dynamic.surfer.at [80.110.110.137])
	(Authenticated sender: foss@0leil.net)
	by relay12.mail.gandi.net (Postfix) with ESMTPA id 4BBB5200008;
	Sun,  4 Oct 2020 13:12:49 +0000 (UTC)
From: "Quentin Schulz" <foss@0leil.net>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss@0leil.net>
Subject: [PATCH 3/3] docs: poky.yaml: fix identation in host packages variables
Date: Sun,  4 Oct 2020 15:12:42 +0200
Message-Id: <20201004131242.61278-3-foss@0leil.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004131242.61278-1-foss@0leil.net>
References: <20201004131242.61278-1-foss@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This unfortunately makes the variables probably unusable for proper
replacement in other indentation blocks.

Signed-off-by: Quentin Schulz <foss@0leil.net>
---
 documentation/poky.yaml | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 946387795..fc2adb357 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -71,18 +71,18 @@ FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip pe
 OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
      diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
      python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen Mesa-dri-devel
-     $ sudo pip3 install GitPython"
+     \n\      $ sudo pip3 install GitPython"
 CENTOS7_HOST_PACKAGES_ESSENTIAL : "-y epel-release
-     $ sudo yum makecache
-     $ sudo yum install gawk make wget tar bzip2 gzip python3 unzip perl patch \
+     \n\      $ sudo yum makecache
+     \n\      $ sudo yum install gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath socat \
      perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python36-pip xz \
      which SDL-devel xterm mesa-libGL-devel
-     $ sudo pip3 install GitPython jinja2"
+     \n\      $ sudo pip3 install GitPython jinja2"
 CENTOS8_HOST_PACKAGES_ESSENTIAL : "-y epel-release
-     $ sudo dnf config-manager --set-enabled PowerTools
-     $ sudo dnf makecache
-     $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch \
+     \n\      $ sudo dnf config-manager --set-enabled PowerTools
+     \n\      $ sudo dnf makecache
+     \n\      $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache \
      socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
      python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel xterm \
-- 
2.26.2

