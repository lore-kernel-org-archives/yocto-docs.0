Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.10637.1590848691503536160
 for <docs@lists.yoctoproject.org>;
 Sat, 30 May 2020 07:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CEi+CDFj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id f5so6980443wmh.2
        for <docs@lists.yoctoproject.org>; Sat, 30 May 2020 07:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HG+7qhVfv9uLpcFES8mzo4NpXmJ8sER3PSBpd4Lc7Rc=;
        b=CEi+CDFjXPomi8Gm9G7fH57FC3n6R2od1QgESg3+bs51By3j98KZ22CC6IRoXGYNCZ
         rngRW3r1AK+oA+hK8xHyhhsyMIQcfpTLkjCBvPWzNQRuxrWgpbbe3dTms+Ngio+oJtGe
         inDZvLi0FWWoEtL9l5dlzW5913R8NKpcobpa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HG+7qhVfv9uLpcFES8mzo4NpXmJ8sER3PSBpd4Lc7Rc=;
        b=c++tnbCDq/VemC5gAS+LIagBNYjM8z67a+uNbwfS9vRMX+QnMsWeJHDWg5H/AzJMMK
         F8f1dGVhLhMKE0tnUSxokbqYPNWvJ/KQ5xqrSI8dmwQf+cWt1Y5Ze3QDgZhnGVmbgznl
         KRxp74DVDxmxojDhM4+jyTB7DaK6ALRrkoUNIkbaD2JamnHeaLwZOdcUwmq7SAXGMJJ3
         BhFITFxgTKWx3WljMbJ9h+DCzaobsUlRjEl3VvRR5JWQ2d2eRPZh2BBlvdPourRXOxD+
         a8NTH4MPYg/iKKZwIHKRDLENBjypqU3jMIZ7oIaXbrhrQmRr4+hFwPFpfq+8B8zPvAAE
         +lPA==
X-Gm-Message-State: AOAM530CfG4n2ml+i4JW18aZRUqsI1iNyj2eYbTlfMhTkWFwZTXRt80H
	QYOmfolFzhKH9C5C9v4S+PoAnIs3CLOvxg==
X-Google-Smtp-Source: ABdhPJwzM1lV4RCZqK0l6JB44Bfdwn0UFsJLVbrZ0GMn0HfnX+QjGRsp9e20mm+REhTovcpHCLuYRg==
X-Received: by 2002:a7b:c145:: with SMTP id z5mr14383378wmi.189.1590848689489;
        Sat, 30 May 2020 07:24:49 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id u4sm3846834wmb.48.2020.05.30.07.24.48
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2020 07:24:48 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] poky.ent: Update XXX_HOST_PACKAGES_ESSENTIAL to include mesa for other distros
Date: Sat, 30 May 2020 15:24:47 +0100
Message-Id: <20200530142447.3013614-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/poky.ent | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/poky.ent b/documentation/poky.ent
index 0e8339afd..aec8d455e 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -67,7 +67,7 @@
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
      python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
-     python3-jinja2 SDL-devel xterm rpcgen">
+     python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel">
 <!ENTITY OPENSUSE_HOST_PACKAGES_ESSENTIAL "python gcc gcc-c++ git chrpath make wget python-xml \
      diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
      python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen Mesa-dri-devel
@@ -77,7 +77,7 @@
      $ sudo yum install gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath socat \
      perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python36-pip xz \
-     which SDL-devel xterm
+     which SDL-devel xterm mesa-libGL-devel
      $ sudo pip3 install GitPython jinja2">
 <!ENTITY CENTOS8_HOST_PACKAGES_ESSENTIAL "-y epel-release
      $ sudo dnf config-manager --set-enabled PowerTools
@@ -86,4 +86,4 @@
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache \
      socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
      python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel xterm \
-     rpcgen">
+     rpcgen mesa-libGL-devel">
-- 
2.25.1

