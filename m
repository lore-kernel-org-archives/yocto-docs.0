Return-Path: <guenael.muller@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113E0D6EBFD
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 10:35:54 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.113645.1732876548773164971
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 02:35:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WLSnpXAi;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: guenael.muller@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43494a20379so15649895e9.0
        for <docs@lists.yoctoproject.org>; Fri, 29 Nov 2024 02:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1732876547; x=1733481347; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MH+UOZ7MLPOhlgCUk52CG0ZgjR1g0lHUPoB7cgSYFQY=;
        b=WLSnpXAijbOtuA67LxaRBUAW/UvrgU9rR6/reLUDKy1qk9YbABEL1MXAlF5EWEmbft
         J6vzsdfyAcSmBxc/meKA+zmy5uC2fWRkqPAc2T1wjg7knhhi1LKb3zELQkG6YoQzMk65
         Apwh9BDCtwoNpTpsXAWrdH80mkDQGLCNzLsh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732876547; x=1733481347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MH+UOZ7MLPOhlgCUk52CG0ZgjR1g0lHUPoB7cgSYFQY=;
        b=Bh1ATetUW/IaorLqqkpAGW9PjLpHhZHTybHt6RB/bGWewHQ6MYlFA+Mya9TbUdYXVX
         oZ6/77BmRCfy/j1YTDxiK6QcNCRqivFVERKgjo/NYqkeGaW/6W2uDp63Oi+aVxRmnBeF
         ywuxLDDgCU3ezsIVlcNSILVHAxIAibLKsJ9e5FTOk3CkSgYoYQyqr0do3IXY2aw4GAAP
         CAIZeuJMu+7Svf1hNYIl8z3yI9Yq78EzH23RBcVENSz5Hbd2ZVCjv9lTxL/2YufTLQ4l
         4ILg+KBIh0QNoJbeh7OcDw0z1ssHJWgBg3khsVLoxgG61qCZQZ5Zd/nGbiR8f2lo9/+Q
         GUNA==
X-Gm-Message-State: AOJu0YygeN4WYZZ5IfG6H2337JvAgd8P0eKCvM2phvd3SQaBTEzDKiWy
	a3J8Afx/B/vjvaIA4Bwvg0tbP1z1KWZWdXqR2hCk1pSbTrYWWX4rsxdws8Zh67kwv0Grcp5UlKl
	K
X-Gm-Gg: ASbGncupPAiz7fIOLK1gvxf1EwzvQ9FZ1xDFc34qWHp2GlgmFb6DXAClXedMmPhVzEL
	bQz72P4huSXjpYVRcoRjZSbPlYODbGWuxPj8Kxvg3/ajfAAZ/aQOB5VnPyaW9gZ0ddZohkdkbn9
	fyso0eODuukYTDCpFS2E1hQx2be2O+AaNC/9HXQSKMK2Q40r1wwJtKivYoiLwHY68OxCFZIfiCj
	IkJVWHXJIe1gurpZlKlIXmqrs18meX5d0uW9hBOxo9iVfqHwXv6aiFZD/WOezjvZQC0zStK3OnR
	Oef7LtpWTpXDCgiZupmb
X-Google-Smtp-Source: AGHT+IHEx+yH2ni1CowqxS6IEdw44wbXtFKT4GMwV/vTk2vWyhBL6BjM3wxJuF0t4j2q7h8c6xO3UQ==
X-Received: by 2002:a05:600c:3546:b0:42f:823d:dde9 with SMTP id 5b1f17b1804b1-434a9df6de4mr86168805e9.21.1732876546499;
        Fri, 29 Nov 2024 02:35:46 -0800 (PST)
Received: from localhost.localdomain (29.42.84.79.rev.sfr.net. [79.84.42.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa76b52bsm80154835e9.18.2024.11.29.02.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 02:35:46 -0800 (PST)
From: =?UTF-8?q?Gu=C3=A9na=C3=ABl=20Muller?= <guenael.muller@smile.fr>
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?Gu=C3=A9na=C3=ABl=20Muller?= <guenael.muller@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v3] ref-manual: use standardized method accross both ubuntu and debian for locale install
Date: Fri, 29 Nov 2024 11:36:44 +0100
Message-Id: <20241129103644.33021-1-guenael.muller@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Nov 2024 10:35:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5848

Modify locale installation method to be standard accross all debian-based distributions.
Pre-existing method is available only on Ubuntu, locale-gen tool has no parameter in Debian.

Signed-off-by: Guénaël Muller <guenael.muller@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
Tested-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/poky.yaml.in                       |  3 +--
 documentation/ref-manual/system-requirements.rst | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index c770318f2..66f758fe8 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -13,8 +13,7 @@ YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
 UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc \
      build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
      xz-utils debianutils iputils-ping python3-git python3-jinja2 \
-     python3-subunit zstd liblz4-tool file locales libacl1
-     \n\   $ sudo locale-gen en_US.UTF-8"
+     python3-subunit zstd liblz4-tool file locales libacl1"
 FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 0fc92550a..f53b9fdbd 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -152,8 +152,22 @@ with a supported Ubuntu or Debian Linux distribution::
 
    $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
 
+You also need to ensure you have the ``en_US.UTF-8`` locale enabled::
+
+   $ locale --all-locales | grep en_US.utf8
+
+If this is not the case, you can reconfigure the ``locales`` package to add it (interactive mode only)::
+
+   $ sudo dpkg-reconfigure locales
+
 .. note::
 
+   -  If your are not using the interactive mode, ``dpkg-reconfigure`` will not work as expected. To add the locale
+      you will need to edit ``/etc/locale.gen`` file to add/uncomment the ``en_US.UTF-8`` locale. A naive way to do this as root is::
+
+         $ echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
+         $ locale-gen
+
    -  If your build system has the ``oss4-dev`` package installed, you
       might experience QEMU build failures due to the package installing
       its own custom ``/usr/include/linux/soundcard.h`` on the Debian
-- 
2.39.5


