Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7926C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 20:43:16 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.4932.1678912988334423648
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Mar 2023 13:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cJUPDBCi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 911D1240006;
	Wed, 15 Mar 2023 20:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678912986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uVyMUiqpANqhY5+B+gtvtoK/mSnd99WS6JZag0TtZyo=;
	b=cJUPDBCi4tdqQ2BYJbYvMHTBM+weEM5HjIgG9xGNvHHDDHRZKrJjmbJFSkzoRHGYZsU7o/
	SIHv9djGMBmduCMicyAsHcfLG1qTTpl4UCVfLwmVy9qX+StSALRHsNMMCmA1lqTadihIEG
	+CQbB2TN21H7o0/2IGM9bltFt7+sU+dPDeon4QEXQKDRP0n+H7prGGWljTaSsk9ksQMny9
	q3w6qvMU6DrCPPOGi2ZJPRyxQhF7/7hhuaRH51k0E+uIe9RApxZvBJN1kjE79peoCH2t2r
	F1256UMAOtZ3+rYfCstbeHbSzPoDkA76tggVd4yhnhNJjgvpqltLgDONQu839w==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Randy MacLeod <randy.macleod@windriver.com>
Subject: [PATCH 1/2] poky.yaml.in, system-requirements.rst: update system requirements
Date: Wed, 15 Mar 2023 21:42:46 +0100
Message-Id: <20230315204247.443297-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Mar 2023 20:43:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3797

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Update system requirements after making tests on basic Docker
  containers of:
  - Ubuntu 22.04
  - Fedora 37
  - OpenSuse Leap 15.4
  - AlmaLinux 9

- Including the need to have the en_US.UTF-8 locale on the system.

- Rename the CENTOS8_HOST_PACKAGES_ESSENTIAL macro to ALMALINUX_HOST_PACKAGES_ESSENTIAL
  As for the other distros, stop refering to a specific version of AlmaLinux. We mention
  the supported versions in the system-requirements.rst file anyway.

- Remove the unused CENTOS7_HOST_PACKAGES_ESSENTIAL macro

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Randy MacLeod <randy.macleod@windriver.com>
---
 documentation/poky.yaml.in                    | 21 +++++++------------
 .../ref-manual/system-requirements.rst        | 10 ++++-----
 2 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index cdccf6f3ca..44654aa62f 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -13,33 +13,28 @@ YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
 UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc \
      build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
      xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
-     python3-subunit mesa-common-dev zstd liblz4-tool"
+     python3-subunit mesa-common-dev zstd liblz4-tool file locales
+     \n\      $ sudo locale-gen en_US.UTF-8"
 FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
      python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
      python3-jinja2 SDL-devel rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
-     perl-File-Copy perl-locale zstd lz4"
+     perl-File-Copy perl-locale zstd lz4 hostname glibc-langpack-en"
 OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
      diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
      python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel rpcgen Mesa-dri-devel \
-     zstd lz4
+     zstd lz4 bzip2 gzip hostname
      \n\      $ sudo pip3 install GitPython"
-CENTOS7_HOST_PACKAGES_ESSENTIAL : "-y epel-release
-     \n\      $ sudo yum makecache
-     \n\      $ sudo yum install gawk make wget tar bzip2 gzip python3 unzip perl patch \
-     diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath socat \
-     perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip xz \
-     which SDL-devel mesa-libGL-devel zstd lz4
-     \n\      $ sudo pip3 install GitPython jinja2"
-CENTOS8_HOST_PACKAGES_ESSENTIAL : "-y epel-release
-     \n\      $ sudo dnf config-manager --set-enabled PowerTools
+ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
+     \n\      $ sudo yum install dnf-plugins-core
+     \n\      $ sudo dnf config-manager --set-enabled crb
      \n\      $ sudo dnf makecache
      \n\      $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache \
      socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
      python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel \
-     rpcgen mesa-libGL-devel zstd lz4"
+     rpcgen mesa-libGL-devel zstd lz4 cpio glibc-langpack-en"
 PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml"
 MIN_PYTHON_VERSION : "3.8.0"
 MIN_TAR_VERSION : "1.28"
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 38d4aaf5a7..1bbe7b894d 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -168,16 +168,16 @@ supported openSUSE Linux distribution:
       &PIP3_HOST_PACKAGES_DOC;
 
 
-AlmaLinux-8 Packages
---------------------
+AlmaLinux Packages
+------------------
 
 Here are the required packages by function given a
-supported AlmaLinux-8 Linux distribution:
+supported AlmaLinux Linux distribution:
 
 -  *Essentials:* Packages needed to build an image for a headless
    system::
 
-      $ sudo dnf install &CENTOS8_HOST_PACKAGES_ESSENTIAL;
+      $ sudo dnf install &ALMALINUX8_HOST_PACKAGES_ESSENTIAL;
 
    .. note::
 
@@ -186,7 +186,7 @@ supported AlmaLinux-8 Linux distribution:
          easy installation of packages not included in enterprise Linux
          by default. You need to install these packages separately.
 
-      -  The ``PowerTools`` repo provides additional packages such as
+      -  The ``PowerTools/CRB`` repo provides additional packages such as
          ``rpcgen`` and ``texinfo``.
 
       -  The ``makecache`` command consumes additional Metadata from
-- 
2.34.1


