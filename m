Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33679C43217
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 09:12:11 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web09.17298.1667466724614440769
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Nov 2022 02:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H4YlZT0F;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: ptsneves@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id g7so1772631lfv.5
        for <docs@lists.yoctoproject.org>; Thu, 03 Nov 2022 02:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uTNe972p/gYl8zQZjoGEbkL1soR9wabXmutiI2XM1YU=;
        b=H4YlZT0F2jUksJQPtGKO4YJdA4XBzgwELdm4MZ5kwZyQFcAIvGQtX3UJt88TOCOCTq
         MP0yJ708TTbyMnjc5GA6m3/jC1xLrO+YrnzYFugwMzan6lkz8h0qCEDRA50Vl4fUQe7L
         yi621Qo/gbmjydAhmF9IQ/X/BsULMRLtXXIKueO1/9ekK1jPGEGi4E85NeIguUWEVwD+
         gc3Irg/G3OH6akwUAwepI8E9jK9KXtP0eEZrTHmUczFruVXU57/z1XxHl45zCKuVvN7d
         OoqEN8OCrz2+mkHCHWc4AvaMI/fMJjp8/KKzy4888E7rZUd/KrKPdOCsCRX2Hfq1nM2R
         n0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTNe972p/gYl8zQZjoGEbkL1soR9wabXmutiI2XM1YU=;
        b=29Q0lUlroLQp4fjLBQWCypeToUOm6LDzrrKcm8DwmiFqGFFjId4FC7oVQu35tW64hH
         RcuL26G1Cprrpm+svMLCnmqsiAEyPBopJBpaFxeATyNU1QFHcB3fXP9l45dej224Ll2C
         JHLpf5Sq13SgxSv/0sVMxLXFCeW0SDGJjNFtvkP1aMTrAKlOqSvGO+HBhcRr9EDO0RMR
         Io9TLH+3NfEY35QO4fpaHgkrWCDZWNZPHfaqn0lEBZQ0QAfrMexEuOaT1s0WqbqrQLzH
         fBFNUk3crSB4NJaUt6A4NJem3wOKTYt0XhJuxHtbbHd8N+2IU9grmBtQBt+kR9IpzNcQ
         kVgQ==
X-Gm-Message-State: ACrzQf1rir4+xdcC8QtoX2Jl4YM/SnfXJ0Gf+OhAKgl7XpF3gUyDTlJJ
	bJE8QK0lol+YqCPl8HKjO+X6oLWZPQ==
X-Google-Smtp-Source: AMsMyM6cqj0GB176VH3UQfUrRs8d/h9WSbjXd4LB+mXf4NmJF9nb1jYvBT+5GlsKCRkWiD7HVHM+uw==
X-Received: by 2002:a05:6512:3b95:b0:4a4:798d:c9a6 with SMTP id g21-20020a0565123b9500b004a4798dc9a6mr10745152lfv.463.1667466722142;
        Thu, 03 Nov 2022 02:12:02 -0700 (PDT)
Received: from pneves-XPS-15-9550.lan (031011128073.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.73])
        by smtp.gmail.com with ESMTPSA id h7-20020a05651c124700b0026e04cc88cfsm15220ljh.124.2022.11.03.02.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 02:12:01 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v2 1/1] manuals: remove xterm requirements
Date: Thu,  3 Nov 2022 10:11:59 +0100
Message-Id: <20221103091159.1607775-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 03 Nov 2022 09:12:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3455

According to [1] xterm is no longer required. Update the manual
accordingly. Related to Bug #14873.

[1] https://git.openembedded.org/openembedded-core/commit/?id=ddb825c87dd3e59d50841a993080a00d1459b1e7

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
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


