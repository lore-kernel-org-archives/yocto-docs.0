Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DB3C25B4F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 06:57:34 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.7660.1714633047991058377
 for <docs@lists.yoctoproject.org>;
 Wed, 01 May 2024 23:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aSuKh55+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C28F6000B;
	Thu,  2 May 2024 06:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714633046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LAy0zghROObxXp5PdnSfiLfKof0GG845C2OtGJrr090=;
	b=aSuKh55+Qac5xSUibuiKrrfOuw1J2pwUEqB1bYaKNTdm0OT/LCrHe040N3xH4oXdF60G9b
	u8SsOiInQ551+rb6ETBTqIUGFtldqc2POynWmekwfONSTNclXV9o9Bk0KzJ77SQZq+BEC1
	O0+5QSXk0rg34YLqcSmpySFS4bNL8wdgA33+gNsLVrQQXY36oyowtnk4r6mYgF9vk2d/jG
	q35ey3b8C25lNrwImCHACvrxvH7Hmw85PNAZGJWHDyoVVKkAZaIGSSDqQf6YJTHfYbeHW+
	5z+6aNAwCw86SENc4FEYzW2AaDSTL0rcoddDG1yF4ZTzhVYKCivJe3/cQtEdIg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [kirkstone][PATCH 4/6] documentation/poky.yaml.in: drop mesa/sdl from essential host packages
Date: Thu,  2 May 2024 08:57:19 +0200
Message-Id: <20240502065721.22607-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502065721.22607-1-michael.opdenacker@bootlin.com>
References: <20240502065721.22607-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 06:57:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5197

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

They used to be required for qemu graphics support, but neither is being
for anything anymore.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/poky.yaml.in | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index b9cdd844e4..16bbce5afc 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -12,19 +12,19 @@ YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
 YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
 UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc \
      build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
-     xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
-     python3-subunit mesa-common-dev zstd liblz4-tool file locales
+     xz-utils debianutils iputils-ping python3-git python3-jinja2 \
+     python3-subunit zstd liblz4-tool file locales libacl1
      \n\   $ sudo locale-gen en_US.UTF-8"
 FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
      python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
-     python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
-     perl-File-Copy perl-locale zstd lz4"
+     python3-jinja2 rpcgen perl-FindBin perl-File-Compare \
+     perl-File-Copy perl-locale zstd lz4 hostname glibc-langpack-en libacl"
 OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
      diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
-     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel rpcgen Mesa-dri-devel \
-     zstd lz4 bzip2 gzip hostname
+     python3-pexpect xz which python3-Jinja2 rpcgen \
+     zstd lz4 bzip2 gzip hostname libacl1
      \n\   $ sudo pip3 install GitPython"
 ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
      \n\   $ sudo yum install dnf-plugins-core
@@ -33,8 +33,8 @@ ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
      \n\   $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache \
      socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
-     python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel xterm \
-     rpcgen mesa-libGL-devel zstd lz4"
+     python3-GitPython python3-jinja2 python3-pexpect xz which \
+     rpcgen zstd lz4 cpio glibc-langpack-en libacl"
 PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml"
 MIN_PYTHON_VERSION : "3.6.0"
 MIN_TAR_VERSION : "1.28"
-- 
2.34.1


