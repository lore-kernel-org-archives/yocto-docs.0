Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D919FC77B7F
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 09:01:48 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.14417.1683104502264817393
 for <docs@lists.yoctoproject.org>;
 Wed, 03 May 2023 02:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=U2NzrHMP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A94F44000D;
	Wed,  3 May 2023 09:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683104500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ON4jfcf5Dqi8FI3ZvDM1z94ZNC4RJFE7UpSnasGpdEY=;
	b=U2NzrHMPu6BH2yksFER6UGz1uDDHGkL1K6OCRfvZN6VOieAC7kFPPnNVgCO+LGpKz+bSdH
	nXLWXmsLTGEOC4Bi79XCnXyyUW7YwiJXxH+2Jlqjt51T3T4RJIUF/1H3Nel5RDZmOVLCfM
	LUf+ThOTs7gpiV98z5loUz22yn7J5KPAQ8cM0zFfj4ybLTsLEFB5zpJV3mGFr+eQAPr474
	s2QiHhh3LvlQLDnW9NGbpmZ+zNO8TgsJHLDUc9CTacfM+HOcL7Vr2N4TJB6mKhKloH2rVb
	ZK4KNzeQVgKfJnivEXLuf89PFUsIhmC1dm3a7jbpVFevw1vXzrmETR+qAb+RNA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] poky.yaml.in: simplify host package requirements
Date: Wed,  3 May 2023 11:01:36 +0200
Message-Id: <20230503090136.2483595-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 May 2023 09:01:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3895

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Some of the listed host packages were no longer necessary.

[YOCTO #14873]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/poky.yaml.in | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 1c072c1d05..7f71412fee 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -10,31 +10,19 @@ BITBAKE_SERIES : ""
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
 YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
-UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc \
-     build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
-     xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
-     python3-subunit mesa-common-dev zstd liblz4-tool file locales
+UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat build-essential chrpath cpio \
+     python3 zstd liblz4-tool file locales
      \n\   $ sudo locale-gen en_US.UTF-8"
-FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip perl patch \
-     diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
-     ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
-     python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
-     python3-jinja2 SDL-devel rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
-     perl-File-Copy perl-locale zstd lz4 hostname glibc-langpack-en"
-OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
-     diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
-     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel rpcgen Mesa-dri-devel \
-     zstd lz4 bzip2 gzip hostname
-     \n\   $ sudo pip3 install GitPython"
+FEDORA_HOST_PACKAGES_ESSENTIAL : "bzip2 perl patch diffutils diffstat git gcc g++ chrpath \
+     which glibc-langpack-en which cpio file hostname patch rpcgen wget zstd lz4 xz"
+OPENSUSE_HOST_PACKAGES_ESSENTIAL : "git python3 gcc gcc-c++ zstd bzip2 chrpath diffstat \
+     gzip hostname lz4 make patch rpcgen tar wget python3-curses xz" 
 ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
      \n\   $ sudo yum install dnf-plugins-core
      \n\   $ sudo dnf config-manager --set-enabled crb
      \n\   $ sudo dnf makecache
-     \n\   $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch \
-     diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache \
-     socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
-     python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel \
-     rpcgen mesa-libGL-devel zstd lz4 cpio glibc-langpack-en"
+     \n\   $ sudo dnf install bzip2 perl patch diffutils diffstat git gcc g++ chrpath \
+     which glibc-langpack-en which cpio file hostname patch rpcgen wget zstd lz4 xz"
 PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml"
 MIN_PYTHON_VERSION : "3.8.0"
 MIN_TAR_VERSION : "1.28"
-- 
2.34.1


