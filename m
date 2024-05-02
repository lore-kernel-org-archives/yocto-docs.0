Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6D0C04FFE
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 06:55:33 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.7641.1714632933247747905
 for <docs@lists.yoctoproject.org>;
 Wed, 01 May 2024 23:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ptUTOcPw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDD9820008;
	Thu,  2 May 2024 06:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714632932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WvpEl5YIdX8mPvqJggM1qQs3p4N2Dbjl5nTAO9dpGD8=;
	b=ptUTOcPwXFSSyd8tOgHO/2tZ+57WDfdllLunTM+ZaQF9WM0B4uY3Rt6LY0I239XKB9/oz5
	V+6AIQc6i7mS68L7jYRrmQhkhoKtX0x8RPjBfokHY3H6ROZBkiIatoAR0GXD4aWkDkNllM
	yp7Ihff3WiYNDjEw7Vfs/CexHwjtk5a2un3cBdA28xzPZDMzDcPYvUebJQnQUS54Om+fIJ
	mSRfAf3IbCO/QTCWiV7esJURSMf/yahrUhK3SdltRmCiEJ1WuHPM10YpYuQQrpP+WEuh/L
	j22aSPjFKDslV6Ab11v71XXByQUgqpm7PSShih2n8y0Rlcp4Labr/pKKAjGWbw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [scarthgap][PATCH 2/5] documentation/poky.yaml.in: drop mesa/sdl from essential host packages
Date: Thu,  2 May 2024 08:55:25 +0200
Message-Id: <20240502065528.22559-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502065528.22559-1-michael.opdenacker@bootlin.com>
References: <20240502065528.22559-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 06:55:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5187

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

They used to be required for qemu graphics support, but neither is being
for anything anymore.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/poky.yaml.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 17cbe26e36..0c04b615ea 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -12,18 +12,18 @@ YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
 YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
 UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc \
      build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
-     xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
-     python3-subunit mesa-common-dev zstd liblz4-tool file locales libacl1
+     xz-utils debianutils iputils-ping python3-git python3-jinja2 \
+     python3-subunit zstd liblz4-tool file locales libacl1
      \n\   $ sudo locale-gen en_US.UTF-8"
 FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
      python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
-     python3-jinja2 SDL-devel rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
+     python3-jinja2 rpcgen perl-FindBin perl-File-Compare \
      perl-File-Copy perl-locale zstd lz4 hostname glibc-langpack-en libacl"
 OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
      diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
-     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel rpcgen Mesa-dri-devel \
+     python3-pexpect xz which python3-Jinja2 rpcgen \
      zstd lz4 bzip2 gzip hostname libacl1
      \n\   $ sudo pip3 install GitPython"
 ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
@@ -33,8 +33,8 @@ ALMALINUX_HOST_PACKAGES_ESSENTIAL : "-y epel-release
      \n\   $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache \
      socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
-     python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel \
-     rpcgen mesa-libGL-devel zstd lz4 cpio glibc-langpack-en libacl"
+     python3-GitPython python3-jinja2 python3-pexpect xz which \
+     rpcgen zstd lz4 cpio glibc-langpack-en libacl"
 PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml"
 MIN_PYTHON_VERSION : "3.8.0"
 MIN_TAR_VERSION : "1.28"
-- 
2.34.1


