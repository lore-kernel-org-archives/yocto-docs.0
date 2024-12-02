Return-Path: <guenael.muller@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F93D7830C
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 11:03:38 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.171699.1733137413830277694
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Dec 2024 03:03:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Vlv2qQfk;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: guenael.muller@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434a90fed23so33775935e9.1
        for <docs@lists.yoctoproject.org>; Mon, 02 Dec 2024 03:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1733137412; x=1733742212; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PBvb85bWRsaA1tVdQsrDj5JQeMX5y1V94n7VAvjZ5Uk=;
        b=Vlv2qQfkEBwtqjYI7+p/RVOt8RdlMuFWBljuXPqHpEdqy/e8lgwzIbKyXWPWm4+8p2
         oaacMaN+6J8UNIhovNWNG8V8TBV31mQv2Y+YkM02IVVYwaDxGWnifnzozR73iJhrxx/b
         FCxZqlBuHZYcYkIbe3jLBoQmW0CM6+ejzoCZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733137412; x=1733742212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBvb85bWRsaA1tVdQsrDj5JQeMX5y1V94n7VAvjZ5Uk=;
        b=X8X7ztq2OXXrKW6kh9q54Lj5RAzT386/v2kXTCRB23JMYyt06Y+fj7Vtph5fF4A/YX
         R/jMpcMdPSsOarqQTvDBZzwlgewPDfMkgKs6LXmI1mcCxLOFRImA29soWzRv9J75+ImX
         cVhkpIKZh/81/K7vUgUxWH90D5b1l7yc2P7VFF60CgWtwrgQR33MUVNg0tagpx+kcDta
         3/lE6mGSxonvMGTJp49xpgQmLbxSNGFbAXi+9KBUGEn6RsbZIvsUwi00OOUoWKlfl6eZ
         uerBUBSmz4v2KYz3LCm3xk5O04fNZMrWrSiUZWnZp8+A701BqGNcioys6D8hUC/QmLKU
         CmdA==
X-Gm-Message-State: AOJu0Yw4J5URxLtBKmtCvwOTKoGc8oQThpx5nAac/lpsq9oV3rmtHTSq
	X2Bm4ECMj7auFqBGAq/I/EWGxCrCfPSdo0w6xvyJDKw1luEdLLojwxyT3XeiLrNcuXBe+QNd3g8
	D
X-Gm-Gg: ASbGncsj0AWXFlfXwQwLYCHBxQkcac7C3spudlvaGhqp9GiJtmjLrpAQOyiOZfXshHt
	iHAAqSIwKb5CqTNkZMoE6dDYEOzhANmVqk8sxz+7sHiolNDJ1zY7LxdJwRvGSzy4pbMM/UF7G6U
	8GHcGJp8tQOrZ7Qp7ac6jBxAYg7lbmeNz7DoR9s8bpZgeO97oNbeypP2ijMJ9zTW3I1kvZv4RgQ
	KlU4omffBDguOKz0KSMIFQFIFIrdmhBjs2XeRMQpO+LVQc6TG+RKDm0bUyFrXo0zOKCfnnYgj3M
	7ZQ0YwWZejYKHRWXrxK2
X-Google-Smtp-Source: AGHT+IEwB/2sFCKW53hOyBuyE6A69OrIR4EvJ2zXmWdX66BajC6+DKwjJe1dxLE9IVQz0OlN2AAMKw==
X-Received: by 2002:a05:600c:1c07:b0:434:a4fe:cd71 with SMTP id 5b1f17b1804b1-434a9dc50f1mr203141865e9.12.1733137412136;
        Mon, 02 Dec 2024 03:03:32 -0800 (PST)
Received: from localhost.localdomain (29.42.84.79.rev.sfr.net. [79.84.42.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa763a59sm179791645e9.11.2024.12.02.03.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:03:31 -0800 (PST)
From: =?UTF-8?q?Gu=C3=A9na=C3=ABl=20Muller?= <guenael.muller@smile.fr>
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?Gu=C3=A9na=C3=ABl=20Muller?= <guenael.muller@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v4] ref-manual: use standardized method accross both ubuntu and debian for locale install
Date: Mon,  2 Dec 2024 12:01:28 +0100
Message-Id: <20241202110128.27711-1-guenael.muller@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Dec 2024 11:03:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5864

Modify locale installation method to be standard accross all debian-based distributions.
Pre-existing method is available only on Ubuntu, locale-gen tool has no parameter in Debian.

Signed-off-by: Guénaël Muller <guenael.muller@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
Tested-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/poky.yaml.in                      |  3 +--
 .../ref-manual/system-requirements.rst          | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

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
index 0fc92550a..43c3c5834 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -152,8 +152,25 @@ with a supported Ubuntu or Debian Linux distribution::
 
    $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
 
+You also need to ensure you have the ``en_US.UTF-8`` locale enabled::
+
+   $ locale --all-locales | grep en_US.utf8
+
+If this is not the case, you can reconfigure the ``locales`` package to add it
+(requires an interactive shell)::
+
+   $ sudo dpkg-reconfigure locales
+
 .. note::
 
+   -  If you are not in an interactive shell, ``dpkg-reconfigure`` will
+      not work as expected. To add the locale you will need to edit
+      ``/etc/locale.gen`` file to add/uncomment the ``en_US.UTF-8`` locale.
+      A naive way to do this as root is::
+
+         $ echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
+         $ locale-gen
+
    -  If your build system has the ``oss4-dev`` package installed, you
       might experience QEMU build failures due to the package installing
       its own custom ``/usr/include/linux/soundcard.h`` on the Debian
-- 
2.39.5


