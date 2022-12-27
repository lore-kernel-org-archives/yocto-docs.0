Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87ADAC4167B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 19:49:59 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.166229.1672170590061190555
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Dec 2022 11:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=aGoBk3Ix;
 spf=pass (domain: underview.tech, ip: 209.85.167.182, mailfrom: vince@underview.tech)
Received: by mail-oi1-f182.google.com with SMTP id c133so13247086oif.1
        for <docs@lists.yoctoproject.org>; Tue, 27 Dec 2022 11:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rEhNiU0Eg5hU7keiDHsg8BveWpc7vBtGHtcn1foaDvk=;
        b=aGoBk3Ixu8yFS1cDyh+OqprfnMaiCXFmGv34k5Ps7AN8ocP0GnBlbtsUA+G83sdXQR
         FkJbmjzNDDadhC5yfYQIK6AZ8v4KU2bg/87WKadj11m43vDmHJ0l2OY6+jV3j1VE0fzJ
         61kgcB3lZOxcYXlCcapqsRMqjrY605O97W9Tb6ihAtxLgl2XDuPDx/HBluI6vrrm0tL5
         V8JAkYHyLJ/xJp48lhIEYPdzdHvE/G7zlPy8Ua5pQMyywqjjTf9D1t59eUzwBFoZ2Lup
         dGkS6DCjtWKFTMlzfvdtZHnk7fPwvW4EVDgP/0G8nRKejPDweL8ALHoB1pcZ1lqf4SvC
         kw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEhNiU0Eg5hU7keiDHsg8BveWpc7vBtGHtcn1foaDvk=;
        b=OGSXxGHNhS317gJ1c0OJUaTTNrkn9baOv6giFt85l/OrhHfW+CfmcjbTYurfN397hU
         iGLhyDcHclHyAcD7UiqS4NkPpfgdwRo4eg8OZOmzy5xDyKU6EHpuJts425sm/Nj1DK/Q
         w+sBYISE4B2+0a0KhkwBgn1A1NZYCi/whLqUVkzilLJ3T1m2Wbp/3B54KkkPvF0IPjIW
         zmjwUCKaCWtKBZmjPAElkXrtE945c6QvQmYQaLG0YF9HS8iFBEw2LlgZn31ma0PhP3f/
         cZaMdMIwcfFZG9VeZknoQZZ5E3RSjtMCyoFzghO2IU8r4MWJ3FkWmFUCZaezjmDRWB+U
         t9Eg==
X-Gm-Message-State: AFqh2kpFSFmcQRbhhT+vueaM3ZRpzS+1Bm3dGtuOQzfd/Z+LXVbAxzJd
	CwzM79IAiERCglVc88vayv4mEv5MGwcAh5GV274=
X-Google-Smtp-Source: AMrXdXvJMTdeWD+bvZMFKkf2hA0iIu/47ITbyadeTJgGz/yr4EJ8pS2M7P8pYC/n6hwAaRFww56gew==
X-Received: by 2002:a05:6808:2103:b0:361:2ee6:fb5a with SMTP id r3-20020a056808210300b003612ee6fb5amr13395300oiw.52.1672170589055;
        Tue, 27 Dec 2022 11:49:49 -0800 (PST)
Received: from localhost.localdomain (99-113-4-128.lightspeed.hstntx.sbcglobal.net. [99.113.4.128])
        by smtp.googlemail.com with ESMTPSA id z9-20020a056808028900b00359ba124b07sm6173726oic.36.2022.12.27.11.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 11:49:48 -0800 (PST)
From: Vincent Davis Jr <vince@underview.tech>
To: docs@lists.yoctoproject.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH] ref-manual/system-requirements.rst: support Arch Linux
Date: Tue, 27 Dec 2022 13:49:32 -0600
Message-Id: <20221227194932.3783-1-vince@underview.tech>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Dec 2022 19:49:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3561

Add support for packages need to build
OE system image on Arch Linux.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 documentation/poky.yaml.in                    |  2 ++
 .../ref-manual/system-requirements.rst        | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index cdccf6f3c..fd3c77576 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -40,6 +40,8 @@ CENTOS8_HOST_PACKAGES_ESSENTIAL : "-y epel-release
      socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
      python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel \
      rpcgen mesa-libGL-devel zstd lz4"
+ARCH_LINUX_HOST_PACKAGES_ESSENTIAL : "base-devel wget curl git diffstat unzip texinfo \
+     python chrpath zip xterm sdl rpcsvc-proto socat cpio inetutils"
 PIP3_HOST_PACKAGES_DOC : "$ sudo pip3 install sphinx sphinx_rtd_theme pyyaml"
 MIN_PYTHON_VERSION : "3.8.0"
 MIN_TAR_VERSION : "1.28"
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 1f9b3b1b5..8d5856a0c 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -55,6 +55,8 @@ distributions:
 
 -  OpenSUSE Leap 15.3
 
+-  Arch Linux
+
 .. note::
 
    -  While the Yocto Project Team attempts to ensure all Yocto Project
@@ -191,6 +193,23 @@ supported AlmaLinux-8 Linux distribution:
       $ sudo dnf install make python3-pip which inkscape texlive-fncychap
       &PIP3_HOST_PACKAGES_DOC;
 
+
+Arch Linux Packages
+-------------------
+
+Here are the required packages by function given a
+supported Arch Linux distribution:
+
+-  *Essentials:* Packages needed to build an image on a headless system::
+
+      $ sudo pacman -S &ARCH_LINUX_HOST_PACKAGES_ESSENTIAL;
+
+-  *Documentation:* Packages needed if you are going to build out the
+   Yocto Project documentation manuals::
+
+      $ sudo pacman -S make python-pip which inkscape texlive-latexextra
+      &PIP3_HOST_PACKAGES_DOC;
+
 .. _system-requirements-buildtools:
 
 Required Git, tar, Python, make and gcc Versions
-- 
2.38.1


