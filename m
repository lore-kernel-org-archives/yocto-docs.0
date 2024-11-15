Return-Path: <guenael.muller@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90066D6DDF3
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 12:33:32 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.19833.1731674003729477621
 for <docs@lists.yoctoproject.org>;
 Fri, 15 Nov 2024 04:33:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Gqrf2bLc;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: guenael.muller@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-431688d5127so13913855e9.0
        for <docs@lists.yoctoproject.org>; Fri, 15 Nov 2024 04:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1731674002; x=1732278802; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jiRUAC7ypgLAcgqzN8xO8Fz1hUi3EBC/ZPcUR8zjupU=;
        b=Gqrf2bLch8mkzumxds36HGqgzjD3/jEylTIAnrf/iRT9nLZwe8N6sK4pd1olmfNUCn
         PmZ+A+gKwVmy3DFmEHNqIxaekrRlifw/yrudW0kwWO6o8jvYS04fHqd0+6WPzfXLLpmG
         y/gcyZw8bTTab/DkJjsMCOz61N2sPzSDJE+GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731674002; x=1732278802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jiRUAC7ypgLAcgqzN8xO8Fz1hUi3EBC/ZPcUR8zjupU=;
        b=Z7wJ7UHF5ShM3a+iSmZwtXVL13xaKU2bt44GdsiKNYA66MwmVZu2+s9j1+eRQJhPta
         rTwFtUX4MCInFzaazHaW/VrBnVQnVtiYaW739RuXcEcfO2FHVYLp+X3QWh9vywIfI68f
         wOJ9B9Kh80ZeeGJ1mlb5g+Zd6QQStLkpzcF+8jRZGD9ndtRYNd7Q6e0UXg1ZTknQ2o1R
         s/IVhmcwxI88b53geMRKmWCzwat0Y7a+IE4CbF/HRze8tmaogtgct6+K4ndTSiVr7AEg
         yoW4Lem+3HzAyvwtZptaffWkSMN7EAgEgZGzfAzQsZ6VRaoMJV6A3AbaONvH8F9ngL8e
         b3jg==
X-Gm-Message-State: AOJu0YyKM/WBGMo0jD5w8iuJYSO+y9RujkHn2fOW+j+jAqAcJQjMu/A1
	rrAXYg6AQ2Po9OP/O5iiATT3LlWqAUkBN0h9IeKUq5q/kaCFy8uthfSPonLfd0V2csr7psa27fB
	td48mOQ==
X-Google-Smtp-Source: AGHT+IERQIBjz637ibvl4K0zSX4i/nkJgY02/KQWUI7EvVoou72AdxlNpISWiTKWLIMk2J6+uBQTwQ==
X-Received: by 2002:a5d:59c8:0:b0:382:d0b:5dc5 with SMTP id ffacd0b85a97d-382258ed412mr1822996f8f.3.1731674001936;
        Fri, 15 Nov 2024 04:33:21 -0800 (PST)
Received: from localhost.localdomain (29.42.84.79.rev.sfr.net. [79.84.42.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38224f95be0sm2145099f8f.100.2024.11.15.04.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 04:33:21 -0800 (PST)
From: =?UTF-8?q?Gu=C3=A9na=C3=ABl=20Muller?= <guenael.muller@smile.fr>
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?Gu=C3=A9na=C3=ABl=20Muller?= <guenael.muller@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] ref-manual: use standardized method accross both ubuntu and debian for locale install
Date: Fri, 15 Nov 2024 13:33:27 +0100
Message-Id: <20241115123327.28081-1-guenael.muller@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 15 Nov 2024 12:33:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5750

Modify locale installation method to be standard accross all debian-based distributions.
Pre-existing method is available only on Ubuntu, locale-gen tool has no parameter in Debian.

Signed-off-by: Guénaël Muller <guenael.muller@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
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
index 0fc92550a..5b481dd83 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -152,6 +152,14 @@ with a supported Ubuntu or Debian Linux distribution::
 
    $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
 
+You also need to ensure you have locale ``en_US.UTF-8`` enabled::
+
+   $ locale --all-locales | grep en_US.utf8
+
+If this is not the case, You can reconfigure ``locales`` package to add it::
+
+    $ sudo dpkg-reconfigure locales
+
 .. note::
 
    -  If your build system has the ``oss4-dev`` package installed, you
-- 
2.39.5


