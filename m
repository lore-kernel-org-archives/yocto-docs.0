Return-Path: <guenael.muller@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3131D4920A
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 10:43:27 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.37580.1731926601827623565
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Nov 2024 02:43:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FTsg2enw;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: guenael.muller@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-43161c0068bso15309785e9.1
        for <docs@lists.yoctoproject.org>; Mon, 18 Nov 2024 02:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1731926600; x=1732531400; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NhmmxRt0GC2EtDCL4N5B4xcqTyoduO8O00FV54kZpHs=;
        b=FTsg2enwezp6DHZ0HWWcwGHSU9q6CEzZqKA6ii8U+iinclo0+Cp7HSnU1MpggZ3q+L
         4/C21Mj0fKYz6QwoZuAZxKc8bcjWO43fbq8ODmZG15KaelTlkUnk8i0JrdnXsMp2RR10
         0PibIhTcs25PyRw3AqfCpZifJGhMXTbbv/6j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731926600; x=1732531400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NhmmxRt0GC2EtDCL4N5B4xcqTyoduO8O00FV54kZpHs=;
        b=gqvknDptRKTpygv9kPYPVLD8bUi8zbP9T3cmyLQwXVARfqwEESaZ/iuWzYXpnkxpGm
         L4rzPhez0Y/LfsMJIPFSboxLGBoyFdLaZGHX7iFBkzwVJ/jyZd9UbsPxidptp+wVKpmJ
         lnHlxvsbdAgsTsQwbXSFg3RR985q8fiPnz+0c2sSIaE10S5JJjPXdppyfnCUjcEQhrm+
         M80BFi3HHGDfNZwCU31aTLeFvinbvBl0JHnV89Ue/iRale+3k5qQfimzWwJ1Q56UPjbe
         d5tBXrVN21qESLLEEcupQT6kvGlndQkLdzh7flsT8zFd6BOrqJMG/AtbSSIcwvvunNvx
         Zghg==
X-Gm-Message-State: AOJu0YzCeqDdDmt5k73w4OWOOgQ4gNSF/hCmz2Mjzbj74ohxkZQsE+U9
	b798E5bZgxvM/SXfwcI0dCjAjcuxpkE47RYm0/o4nBxttKKNqn4lOhLFjv9wSm5Gfdq73TicUg8
	QRm41lTBJ
X-Google-Smtp-Source: AGHT+IHeZ0bNuMGBMsQWmZejEAcIa1NnxIFx6GnoPfzOOGT2Fj2dcuDjwpBB0BZ5djHxBNFND4dJfw==
X-Received: by 2002:a05:600c:a06:b0:431:44fe:fd9a with SMTP id 5b1f17b1804b1-432df74ebdcmr98686825e9.19.1731926600277;
        Mon, 18 Nov 2024 02:43:20 -0800 (PST)
Received: from localhost.localdomain (29.42.84.79.rev.sfr.net. [79.84.42.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382417f33b8sm4513859f8f.45.2024.11.18.02.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 02:43:20 -0800 (PST)
From: =?UTF-8?q?Gu=C3=A9na=C3=ABl=20Muller?= <guenael.muller@smile.fr>
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?Gu=C3=A9na=C3=ABl=20Muller?= <guenael.muller@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2] ref-manual: use standardized method accross both ubuntu and debian for locale install
Date: Mon, 18 Nov 2024 11:45:24 +0100
Message-Id: <20241118104524.25392-1-guenael.muller@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Nov 2024 10:43:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5756

Modify locale installation method to be standard accross all debian-based distributions.
Pre-existing method is available only on Ubuntu, locale-gen tool has no parameter in Debian.

Signed-off-by: Guénaël Muller <guenael.muller@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Tested-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/poky.yaml.in                       | 3 +--
 documentation/ref-manual/system-requirements.rst | 8 ++++++++
 2 files changed, 9 insertions(+), 2 deletions(-)

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
index 0fc92550a..b33518c7f 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -152,6 +152,14 @@ with a supported Ubuntu or Debian Linux distribution::
 
    $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
 
+You also need to ensure you have the locale ``en_US.UTF-8`` enabled::
+
+   $ locale --all-locales | grep en_US.utf8
+
+If this is not the case, you can reconfigure the ``locales`` package to add it::
+
+   $ sudo dpkg-reconfigure locales
+
 .. note::
 
    -  If your build system has the ``oss4-dev`` package installed, you
-- 
2.39.5


