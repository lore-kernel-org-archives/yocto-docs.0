Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762B0C43217
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 16:31:51 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web12.8687.1667320303678682947
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Nov 2022 09:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XxzoiZuB;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: ptsneves@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id u2so21711425ljl.3
        for <docs@lists.yoctoproject.org>; Tue, 01 Nov 2022 09:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AniTqJfFM+TwtIMbp8b5jvBkzT1tL9cBcjZKV5juU/Q=;
        b=XxzoiZuBqbyJbzCDh5FXafSCWr6U5MkKJ4u7qp7cEhPJApjpFWfCTUYRLqhZQObccf
         9QFqOghxNHu/FKwB+AHH5HFG/3liPEJipLLWNQw64BrnLOiWPIU8+6PKQaLgmw7KI0FO
         CYHr8ed/BInzRoxdyHurJ2It1elYxZ6kX9Pu1tvBXOp+mRZyITXN4QtSJyCgy2MAm8w+
         AE5oPtBjjogFpRmkAC4O7Kiyqzg85HUAJ0Onr0yR3hwJLcB+LGm/Y10GK2ixd8MD9gzp
         xS3bro6q5w1FOh+8QkfzU9lW6zHwLvK4EszQ+DKLwlC+6xgGqnSCnIR3E+zGdpmoLLFc
         Qw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AniTqJfFM+TwtIMbp8b5jvBkzT1tL9cBcjZKV5juU/Q=;
        b=WQuDkl/b/muNpjotwpi9utPDPM7WKnIoh8vCT5syPAR5BHESC/wgaab0qgf8mmx1l8
         aF4s8BRvGgli1tsxdWFdKZ1bsYO48l4osyPe1vzdNNJvz0O9iP5INzeqpRRkxjN/6U84
         8KzQRHkQd0kMu6Kp6sV5BzSjuYLbYa/vw4i6Ut9mfngfwzvL3c3gONZpQqzPttinFNy7
         76TstuUoqW5lKSLpqsWwDRNPseZFHHUKDphBwIl598AwZDmQ+v/SFuoFnTxOnyfbBAcl
         1+yptvfVJfnjbLenQrID5ybzHOv8GHZXUuNyS9it2m7deYJrHfMxbMe01amVZusiAbqV
         itPg==
X-Gm-Message-State: ACrzQf1ZUdsH6yqCl7A4Ecf3CmpM0tz/nAuvZNKcKqzEw4JaVVA8DwQI
	wnICConoKaJGtFCkSmI7NmJ9r9a78Q==
X-Google-Smtp-Source: AMsMyM6HqOZ0/p9T24j/1nq6sm4bswIjKNbRQfanCOZRUiU93d02CqUy24qMH1rVxJGz0AaMfFv5Qw==
X-Received: by 2002:a2e:9953:0:b0:277:1888:dab8 with SMTP id r19-20020a2e9953000000b002771888dab8mr7538990ljj.131.1667320301718;
        Tue, 01 Nov 2022 09:31:41 -0700 (PDT)
Received: from pneves-XPS-15-9550.lan (031011128073.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.73])
        by smtp.gmail.com with ESMTPSA id t17-20020a056512209100b004b0b131453csm1039291lfr.49.2022.11.01.09.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 09:31:41 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH 1/1] manuals: remove xterm requirements
Date: Tue,  1 Nov 2022 17:31:35 +0100
Message-Id: <20221101163135.1602755-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Nov 2022 16:31:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3453

According to [1] xterm is no longer required. Update the manual
accordingly. Related to Bug #14873.

[1] https://git.openembedded.org/openembedded-core/commit/?id=ddb825c87dd3e59d50841a993080a00d1459b1e7
---
 documentation/poky.yaml.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 6b942f095..3582ac164 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -13,16 +13,16 @@ YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
 UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc \
      build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
      xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
-     pylint3 xterm python3-subunit mesa-common-dev zstd liblz4-tool"
+     pylint3 python3-subunit mesa-common-dev zstd liblz4-tool"
 FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
      python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
-     python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
+     python3-jinja2 SDL-devel rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
      perl-File-Copy perl-locale zstd lz4"
 OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
      diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
-     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen Mesa-dri-devel \
+     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel rpcgen Mesa-dri-devel \
      zstd lz4
      \n\      $ sudo pip3 install GitPython"
 CENTOS7_HOST_PACKAGES_ESSENTIAL : "-y epel-release
@@ -30,7 +30,7 @@ CENTOS7_HOST_PACKAGES_ESSENTIAL : "-y epel-release
      \n\      $ sudo yum install gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath socat \
      perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip xz \
-     which SDL-devel xterm mesa-libGL-devel zstd lz4
+     which SDL-devel mesa-libGL-devel zstd lz4
      \n\      $ sudo pip3 install GitPython jinja2"
 CENTOS8_HOST_PACKAGES_ESSENTIAL : "-y epel-release
      \n\      $ sudo dnf config-manager --set-enabled PowerTools
@@ -38,7 +38,7 @@ CENTOS8_HOST_PACKAGES_ESSENTIAL : "-y epel-release
      \n\      $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache \
      socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
-     python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel xterm \
+     python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel \
      rpcgen mesa-libGL-devel zstd lz4"
 PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml"
 MIN_PYTHON_VERSION : "3.6.0"
-- 
2.34.1


