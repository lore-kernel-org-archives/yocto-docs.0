Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.10335.1617706442729656231
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 03:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFE3D31B
	for <docs@lists.yoctoproject.org>; Tue,  6 Apr 2021 03:54:01 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 980BD3F73D
	for <docs@lists.yoctoproject.org>; Tue,  6 Apr 2021 03:54:01 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] poky.yaml: change gcc-multilib to gcc
Date: Tue,  6 Apr 2021 11:53:59 +0100
Message-Id: <20210406105359.2666372-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

None of the other distributions install compilers for 32-bit compilation,
and this package isn't available on arm64 Ubuntu systems.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/poky.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index de264c963..85b6347be 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -11,7 +11,7 @@ YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
 YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
-UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git-core diffstat unzip texi=
nfo gcc-multilib \
+UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git-core diffstat unzip texi=
nfo gcc \
      build-essential chrpath socat cpio python3 python3-pip python3-pexp=
ect \
      xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl=
1-mesa libsdl1.2-dev \
      pylint3 xterm python3-subunit mesa-common-dev"
--=20
2.25.1

