Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web12.11156.1584807349554363375
 for <docs@lists.yoctoproject.org>;
 Sat, 21 Mar 2020 09:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=esbUEBb8;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: cengic@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id w4so9784328lji.11
        for <docs@lists.yoctoproject.org>; Sat, 21 Mar 2020 09:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O22ai8S6FhjEYqubrqnmYk8PwDcQwNa5FatxQrL9jOw=;
        b=esbUEBb8fWEal78SMnLGVOcLQAubGnRT1KHTRt7FUN+8LwLQ4dlNmgQA6eLvsSRBSJ
         bvyviHc9MJdir+J6yZBmYoINRpfD1kH98asu2BxT6cUtHXjSndX2Bd+2irvFt0OjbR9g
         6yX5Ldq3erH5H6yL0qh6u5EdH0Bu/E3YsdIMb/dHtaV+cI57jl0SDX27X8VdCWHSifiz
         CWDj3AqS4kiPTgPJJh7YNSK4KjCAQ78aXlIBWsYaKzBFTfshMrM3FGJXYsVeg4+8sRsk
         AugG453puIuh0CKr3KyTZm31mVXLktSS7l3kP+leTuVuY41KMSj6KT4Cp+tCj5zbqFD2
         gIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O22ai8S6FhjEYqubrqnmYk8PwDcQwNa5FatxQrL9jOw=;
        b=pcbSSRZouJHkcdYysRERWfpxa5lbonfDkEfgQfkS3+++QZyX3Dd+LDdmciGu46mnkG
         cNCuYQ7DCRZ6TpJGtjRxhE9mL/Fb5JmHo6oFfKbH6b3KipPECHpAQWDcn1uc8VI9lPdW
         Wl1qByMIeSEmcA4JJEmao+TD6xMKzwhROfLcN8QRsh1RL2KcF5jV3E31ga/UgIvh3OCV
         oXzKAaaa1RgI+QgJvXHD770t7C3h4tLuvgdmZkT2fkEMYMy3QeSvW+Bf2SYoH7Kxz6LL
         Tlcbb9y/eu0KwX1XKzMQ6GL+X4dqkWAzeoBUhdqioKF9yWMAqq4wgHfH9oEWrgAqyyoN
         EQOw==
X-Gm-Message-State: ANhLgQ2B9kq/BdorXgO2mJZz3sc/VIyAOvLe0oFdbPvEkpYju5+Fe+jW
	28pVamzdOyZ4vXi75ILAGqyZKqKgLXs=
X-Google-Smtp-Source: ADFU+vstZjYK9+c/mI/6IGgrIbZrBPjhs7z8hnUeWd03cf4Fljyyz6n1IJfNiMuk4baO+Zuo+seorQ==
X-Received: by 2002:a2e:b558:: with SMTP id a24mr1021394ljn.56.1584807347450;
        Sat, 21 Mar 2020 09:15:47 -0700 (PDT)
Return-Path: <cengic@gmail.com>
Received: from localhost.localdomain (c83-248-75-173.bredband.comhem.se. [83.248.75.173])
        by smtp.gmail.com with ESMTPSA id m14sm1831503lfo.25.2020.03.21.09.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2020 09:15:46 -0700 (PDT)
From: "Goran Cengic" <cengic@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Goran Cengic <cengic@gmail.com>
Subject: [PATCH v3] documentation: add rpcgen tool to required packages
Date: Sat, 21 Mar 2020 17:15:42 +0100
Message-Id: <20200321161542.5198-1-cengic@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On recent distros the following error appears without rpcgen host tool:
  ERROR: The following required tools (as specified by HOSTTOOLS)
  appear to be unavailable in PATH, please install them in order to
  proceed:
    rpcgen

Signed-off-by: Goran Cengic <cengic@gmail.com>
---
 documentation/poky.ent | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/poky.ent b/documentation/poky.ent
index 581c87679..eb5de9514 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -65,11 +65,11 @@
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
      python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
-     python3-jinja2 SDL-devel xterm">
+     python3-jinja2 SDL-devel xterm rpcgen">
 <!ENTITY OPENSUSE_HOST_PACKAGES_ESSENTIAL "python gcc gcc-c++ git chrpath make wget python-xml \
      diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
-     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1
-     $ sudo pip3 install GitPython libSDL-devel xterm">
+     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen
+     $ sudo pip3 install GitPython">
 <!ENTITY CENTOS_HOST_PACKAGES_ESSENTIAL "-y epel-release
      $ sudo yum makecache
      $ sudo yum install gawk make wget tar bzip2 gzip python unzip perl patch \
-- 
2.25.1

