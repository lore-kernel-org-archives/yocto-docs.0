Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F05BC4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 09:35:07 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.16475.1714383297780642174
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 02:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g1zN1Onp;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41b2119da94so34566335e9.0
        for <docs@lists.yoctoproject.org>; Mon, 29 Apr 2024 02:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714383296; x=1714988096; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UnvtwdtMjIXGGeUBKW/Ek8HltD7FdRBqSUkYuMbvrD0=;
        b=g1zN1Onp7IhaAe7UH3F25UPS0beja2ovHL0rFevmTBWhLpjg4LDMwmJW7cuMP7pM/p
         ORFOqmWQeaoDPI7UL1QHgJZc16f9dK94p/wgXXZvzy7E1zk/60TUUWjOobqCGXy+q4Mr
         xgVzOaUe+VssmBZUybyV/AqrD1Cdpa0OzH2LnN1V2TQYpzeb2sFETvr3f0eHto9b8x0S
         Y/+aXNhRzkZxEHRLrrssA96rQcU5enuOxyO3ja6A1qWfQn38KbPdXh7WRxOfjIDDn6ts
         1KL6EvsYKSoORGPWw68LUtkjvBhQ3/BaiHoX9DRip+BNf39pxt7hgGy9fSRuKdBCTwrY
         KC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714383296; x=1714988096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnvtwdtMjIXGGeUBKW/Ek8HltD7FdRBqSUkYuMbvrD0=;
        b=imFUkOZeMZmoQQlkBZ+tDxyTVydgdEX+9EGKoTc/D2BOeFEQbhIFsPR42OPwCIBaU8
         2OvuERAZIlqCqRLRpe8SUiqkSwod1VSH/QFjoE28L/IsGOL7YCH61sli5ed9WLhw0Ie+
         O12L9lwTS2+Kl3ZyVGwKIxCYEOOGx5lGMZ3z+3pbFbt7LUc/2P/x9krnLNkcdCKQllPA
         4V7e458kQm4EQ0KhmCfUk+H1B5SLWZaemtjO3YTliX9MMWIZr/22wAJs9lfReWt/3nJV
         LD8uEJbJNmYQWgPj4twhTsQga9yn9CvtQ2RIAuzebp9ZNTSOiFtuMUWY+W/77dcLdQU6
         XrLw==
X-Gm-Message-State: AOJu0YwRUGwTNaHekqXlmL/vFCD/n1Pld3ltsNOJxFPPsR4c534wPko+
	90E8rhnHd3SPMsCi04ZeS2q6eED9VDO2hUVEluA0WlhbiTh8PfLbQEC3iQ==
X-Google-Smtp-Source: AGHT+IFPHeE2cwhsECiWXhd0dGxBPKysH5MsRrKb4+hRvN0kWE5axroKfanSHuzR9sAZuSuL++cdwg==
X-Received: by 2002:a05:600c:190c:b0:41b:147a:36dc with SMTP id j12-20020a05600c190c00b0041b147a36dcmr8217142wmq.15.1714383295901;
        Mon, 29 Apr 2024 02:34:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b00418f99170f2sm38613468wms.32.2024.04.29.02.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 02:34:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] documentation/poky.yaml.in: drop mesa/sdl from essential host packages
Date: Mon, 29 Apr 2024 11:34:47 +0200
Message-Id: <20240429093447.4163638-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Apr 2024 09:35:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5179

They used to be required for qemu graphics support, but neither is being
for anything anymore.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/poky.yaml.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 7a686ac4e..5a1b8ef59 100644
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
2.39.2


