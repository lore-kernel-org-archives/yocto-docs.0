Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.494.1582741003688706118
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Feb 2020 10:16:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ix9nYGUw;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id i6so192336pfc.1
        for <docs@lists.yoctoproject.org>; Wed, 26 Feb 2020 10:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=mMWu98sXyYqMmSpYP+fNEGQZwAC0K+0U97kHi4V1Jkc=;
        b=Ix9nYGUwoFgby1VW3wXdzS2ztmVBwhZi5+vt5YePtYvXJxrJ08Omr+zIAp5X8beHgG
         ymW9ZCHr3a1S7YZiyNfaU00iEJaKh2oZiKGdnr2RRkv2i/BtV3kuI8Wm0cl5ViAscK46
         jicwNP3QF9OXrgUIECpEh0LcBpxOa+Tpe84VRsc9gs2dX5lRxfojr0Ybvwqc8czAFL9w
         w3+CRTU1wxrjyK6JzPewORh3+CNvdwvbggPuNSAvQtb9S7BUcjRnS2pSFNlwLHqtixVZ
         0w4N3h4ngeoSPO/c/kNShM5RCmGLZvdSbA6LQ6QADAySCupKJM9RtQsBtjHLgGha5YYA
         eHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=mMWu98sXyYqMmSpYP+fNEGQZwAC0K+0U97kHi4V1Jkc=;
        b=U6mxpx3+jvFjNJy/AHWNUyWGrWc9hJrzZDi41o7Lgbx3NxjbZ84k1kAPempOsr7wdL
         3YJ0qj7dOz2yfOLE1TVEtwfP54mNJKEtlhPsqlNWuF8BTt2CaxSrCczjedcbSznUYDOb
         eR/qc+8WFliskq0jsYJ63A+yH2XvKEImS2daVEiMiuwFjzxeum9M5dR4Vp9cvZWeYLcd
         ybFGD8Y7krtHLvgDrUOKq7gfB15N8ehwFnGGgyAFP+LHLuKA2S8KlDzF1puZ27d+d4fI
         WXNHN4nhTM/ur62SiWh6yHSoJ6umy0maD2uaVbWr9n25T5QQt/3KJfoiZ/5y7IDVkIeI
         uUOw==
X-Gm-Message-State: APjAAAW6sQ/xwjiNZKJ9/BJD7TvbPQJYA4UU2VnO2yDUvjhbWmptDYCF
	1pwN5WQnkcYUmfH5fTaM70GBL2bQ
X-Google-Smtp-Source: APXvYqyoQA1ABRG0BgS6hl38LTgugYW0fNXA551s1IJHkpz8jQyvyvPcr+EdIstUJLC0XUkERBfgcA==
X-Received: by 2002:a63:7d59:: with SMTP id m25mr115460pgn.356.1582741002621;
        Wed, 26 Feb 2020 10:16:42 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:35a0:cc10:e86b:4673])
        by smtp.gmail.com with ESMTPSA id h185sm3901840pfg.135.2020.02.26.10.16.40
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 10:16:41 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] yocto-docs: remove refrence to mpc8315e-rdb
Date: Wed, 26 Feb 2020 10:16:39 -0800
Message-Id: <20200226181639.15503-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/bsp-guide/bsp.xml                       | 8 --------
 documentation/dev-manual/dev-manual-common-tasks.xml  | 2 --
 documentation/kernel-dev/kernel-dev-common.xml        | 4 ----
 documentation/kernel-dev/kernel-dev-concepts-appx.xml | 1 -
 documentation/ref-manual/ref-variables.xml            | 2 --
 documentation/sdk-manual/sdk-appendix-obtain.xml      | 3 +--
 6 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/documentation/bsp-guide/bsp.xml b/documentation/bsp-guide/bsp.xml
index 3a3186f19..258b4c674 100644
--- a/documentation/bsp-guide/bsp.xml
+++ b/documentation/bsp-guide/bsp.xml
@@ -1075,10 +1075,6 @@
                                     Texas Instruments Beaglebone
                                     (<filename>beaglebone-yocto</filename>)
                                     </para></listitem>
-                                <listitem><para>
-                                    Freescale MPC8315E-RDB
-                                    (<filename>mpc8315e-rdb</filename>)
-                                    </para></listitem>
                                 <listitem><para>
                                     Ubiquiti Networks EdgeRouter Lite
                                    (<filename>edgerouter</filename>)
@@ -2183,7 +2179,6 @@
      KBRANCH_genericx86-64  = "v5.0/standard/base"
      KBRANCH_edgerouter = "v5.0/standard/edgerouter"
      KBRANCH_beaglebone-yocto = "v5.0/standard/beaglebone"
-     KBRANCH_mpc8315e-rdb = "v5.0/standard/fsl-mpc8315e-rdb"
 
      KMACHINE_genericx86 ?= "common-pc"
      KMACHINE_genericx86-64 ?= "common-pc-64"
@@ -2193,19 +2188,16 @@
      SRCREV_machine_genericx86-64 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
      SRCREV_machine_edgerouter ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
      SRCREV_machine_beaglebone-yocto ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-     SRCREV_machine_mpc8315e-rdb ?= "8b62af7f252af10588276802c4c6d7c502e875be"
 
      COMPATIBLE_MACHINE_genericx86 = "genericx86"
      COMPATIBLE_MACHINE_genericx86-64 = "genericx86-64"
      COMPATIBLE_MACHINE_edgerouter = "edgerouter"
      COMPATIBLE_MACHINE_beaglebone-yocto = "beaglebone-yocto"
-     COMPATIBLE_MACHINE_mpc8315e-rdb = "mpc8315e-rdb"
 
      LINUX_VERSION_genericx86 = "5.0.3"
      LINUX_VERSION_genericx86-64 = "5.0.3"
      LINUX_VERSION_edgerouter = "5.0.3"
      LINUX_VERSION_beaglebone-yocto = "5.0.3"
-     LINUX_VERSION_mpc8315e-rdb = "5.0.3"
             </literallayout>
             This particular append file works for all the
             machines that are part of the
diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index 9da92e86a..e32329b88 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -7609,7 +7609,6 @@
                 available Wic images as follows:
                 <literallayout class='monospaced'>
      $ wic list images
-       mpc8315e-rdb                  		Create SD card image for MPC8315E-RDB
        genericx86                    		Create an EFI disk image for genericx86*
        beaglebone-yocto              		Create SD card image for Beaglebone
        edgerouter                    		Create SD card image for Edgerouter
@@ -7797,7 +7796,6 @@
                 files:
                 <literallayout class='monospaced'>
      $ wic list images
-       mpc8315e-rdb                  		Create SD card image for MPC8315E-RDB
        genericx86                    		Create an EFI disk image for genericx86*
        beaglebone-yocto              		Create SD card image for Beaglebone
        edgerouter                    		Create SD card image for Edgerouter
diff --git a/documentation/kernel-dev/kernel-dev-common.xml b/documentation/kernel-dev/kernel-dev-common.xml
index d94ed1942..579a03537 100644
--- a/documentation/kernel-dev/kernel-dev-common.xml
+++ b/documentation/kernel-dev/kernel-dev-common.xml
@@ -659,26 +659,22 @@
      KMACHINE_genericx86-64 ?= "common-pc-64"
      KBRANCH_edgerouter = "standard/edgerouter"
      KBRANCH_beaglebone = "standard/beaglebone"
-     KBRANCH_mpc8315e-rdb = "standard/fsl-mpc8315e-rdb"
 
      SRCREV_machine_genericx86    ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
      SRCREV_machine_genericx86-64 ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
      SRCREV_machine_edgerouter ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
      SRCREV_machine_beaglebone ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
-     SRCREV_machine_mpc8315e-rdb ?= "2d1d010240846d7bff15d1fcc0cb6eb8a22fc78a"
 
 
      COMPATIBLE_MACHINE_genericx86 = "genericx86"
      COMPATIBLE_MACHINE_genericx86-64 = "genericx86-64"
      COMPATIBLE_MACHINE_edgerouter = "edgerouter"
      COMPATIBLE_MACHINE_beaglebone = "beaglebone"
-     COMPATIBLE_MACHINE_mpc8315e-rdb = "mpc8315e-rdb"
 
      LINUX_VERSION_genericx86 = "4.12.7"
      LINUX_VERSION_genericx86-64 = "4.12.7"
      LINUX_VERSION_edgerouter = "4.12.10"
      LINUX_VERSION_beaglebone = "4.12.10"
-     LINUX_VERSION_mpc8315e-rdb = "4.12.10"
                 </literallayout>
                 This append file contains statements used to support
                 several BSPs that ship with the Yocto Project.
diff --git a/documentation/kernel-dev/kernel-dev-concepts-appx.xml b/documentation/kernel-dev/kernel-dev-concepts-appx.xml
index 6d675a6d5..62c68527d 100644
--- a/documentation/kernel-dev/kernel-dev-concepts-appx.xml
+++ b/documentation/kernel-dev/kernel-dev-concepts-appx.xml
@@ -543,7 +543,6 @@
      yocto-kernel-cache/features/kgdb/hardware.cfg
      yocto-kernel-cache/ktypes/base/hardware.cfg
      yocto-kernel-cache/bsp/mti-malta32/hardware.cfg
-     yocto-kernel-cache/bsp/fsl-mpc8315e-rdb/hardware.cfg
      yocto-kernel-cache/bsp/qemu-ppc32/hardware.cfg
      yocto-kernel-cache/bsp/qemuarma9/hardware.cfg
      yocto-kernel-cache/bsp/mti-malta64/hardware.cfg
diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 7ab37de31..c8ee50a09 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -7471,7 +7471,6 @@
      KBRANCH_genericx86-64  = "standard/base"
      KBRANCH_edgerouter = "standard/edgerouter"
      KBRANCH_beaglebone = "standard/beaglebone"
-     KBRANCH_mpc8315e-rdb = "standard/fsl-mpc8315e-rdb"
                     </literallayout>
                         The <filename>KBRANCH</filename> statements identify
                         the kernel branch to use when building for each
@@ -8789,7 +8788,6 @@
      MACHINE ?= "genericx86"
      MACHINE ?= "genericx86-64"
      MACHINE ?= "beaglebone"
-     MACHINE ?= "mpc8315e-rdb"
      MACHINE ?= "edgerouter"
                     </literallayout>
                     The last five are Yocto Project reference hardware boards, which
diff --git a/documentation/sdk-manual/sdk-appendix-obtain.xml b/documentation/sdk-manual/sdk-appendix-obtain.xml
index 765c0f218..86b6d7dd0 100644
--- a/documentation/sdk-manual/sdk-appendix-obtain.xml
+++ b/documentation/sdk-manual/sdk-appendix-obtain.xml
@@ -297,8 +297,7 @@
 
          <replaceable>arch</replaceable> is a string representing the target architecture:
                    beaglebone-yocto, beaglebone-yocto-lsb, edgerouter, edgerouter-lsb,
-                   genericx86, genericx86-64, genericx86-64-lsb, genericx86-lsb,
-                   mpc8315e-rdb, mpc8315e-rdb-lsb, and qemu*.
+                   genericx86, genericx86-64, genericx86-64-lsb, genericx86-lsb and qemu*.
 
 <!-->
          <replaceable>date_time</replaceable> is a date and time stamp.
-- 
2.17.1

