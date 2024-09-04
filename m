Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672A5CD4F21
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 17:28:19 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web10.56242.1725470892936888198
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Sep 2024 10:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V2NbIehC;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: twoerner@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-846c36009d5so1083187241.2
        for <docs@lists.yoctoproject.org>; Wed, 04 Sep 2024 10:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725470890; x=1726075690; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6l727VeH8NgtPFuAOiEpALoAHxuF+BFNc286FNo/ZIM=;
        b=V2NbIehCavCSC8DAP3Je2NxnTVvUs2tJoaCE7V6cycDCIIhtP2MI1/xMkXaNGxW2iN
         SJ+cCxE+OAvcJAUBi47zr08q1g3ZfcpTChPc0MSUmlUob6OpPcIBp1I4vdcq0ZP94mCP
         64u+x5aw9qm6iBnPVzTBVGJ6O5QOK3sfDqHIewEiJBGRVn2VLcKvHMTKH0Me/LfzFPvn
         xtETemxgZCNz14RemZAYzdc74wS2T82M0YoAPsRjgKBPI9bfo6MuhaMLP9KeU6RpaCKd
         3tnB+jjtv6Rg83x63m5gT7MGznoR+Gn9V7a41qn/6RrI8ezaQTn2JOMCyln9nPx1IE0F
         F/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725470890; x=1726075690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6l727VeH8NgtPFuAOiEpALoAHxuF+BFNc286FNo/ZIM=;
        b=QxWcdGSj56su2IB3EFPTJXLQzmxtMXTKc2tiq2F2aIG54XKXV2Vwd84gN1tI+/AbCq
         tEac8bvHjxOrvJjDN7zo8er3vt7qO010/X/8UmI2tWCLue2eelrHBjNEBRKkdVHsAqFL
         PqdXqZo1jJclDscbSV0XsD5fpW0IwAVelPrB1lVSSJGNEtbNXlQym4RFf36ngy7ZBIik
         WFB0Io27hHDbxAsWiYAWULpsjYp7z1ec3rSD6qXAxi66PK1TUAHDRi70SzR7NwUjSIlX
         wIakVetJ45VhjsvtkzyWUEBrtsmnJlFaHhbkXAtSbBlT2scLI7/XO4j4YnlPr0lF2lkA
         ADfw==
X-Gm-Message-State: AOJu0YxVIohN0R21hTAu9V0BaiGy8r/LnF9JZdFF/NakcBTjJejKMa0Z
	GnwO/QXvHiRb6Au5YEQqjsZemMc9Zjq7kWBZTD0ClfwhrFuxf2MZAlx/hg==
X-Google-Smtp-Source: AGHT+IHMnevd0LDgtv2GWgcPhtpp4Bau9ZkqQtvX3clpuF7H/Y/06vHSK5XxzX/kA2q85tvm30IDNg==
X-Received: by 2002:a05:6102:3ecc:b0:48f:db3d:593e with SMTP id ada2fe7eead31-49bad2b85d2mr7894251137.14.1725470890359;
        Wed, 04 Sep 2024 10:28:10 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a98efed959sm737585a.87.2024.09.04.10.28.09
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 10:28:09 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] docs: update VOLATILE_{LOG|TMP}_DIR
Date: Wed,  4 Sep 2024 13:27:48 -0400
Message-ID: <20240904172748.18526-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Sep 2024 17:28:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5351

A new mechanism was introduced to handle whether or not tmp and log are
tmpfs-based (i.e. in RAM) or persist as real directories in the root
filesystem. The variables VOLATILE_LOG_DIR and VOLATILE_TMP_DIR no longer
exist, and PERMS files are used instead.

oe-core: 8d1ae67b89c4 ("bitbake.conf: drop VOLATILE_TMP_DIR, use FILESYSTEM_PERMS_TABLES instead")
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../migration-guides/release-notes-5.0.rst    |  2 ++
 documentation/ref-manual/features.rst         |  4 +--
 documentation/ref-manual/variables.rst        | 32 ++++---------------
 3 files changed, 10 insertions(+), 28 deletions(-)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documentation/migration-guides/release-notes-5.0.rst
index 800ba20a27b5..191debd0174a 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -335,6 +335,8 @@ New Features / Enhancements in 5.0
    -  Add minimal VS Code configuration to avoid VS Code's indexer from choking
       on build directories.
 
+   - VOLATILE_LOG_DIR and VOLATILE_TMP_DIR were removed in favour of the
+     FILESYSTEM_PERMS_TABLES mechanism.
 
 Known Issues in 5.0
 ~~~~~~~~~~~~~~~~~~~
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 2ea946b31d36..97c05cc2839f 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -323,8 +323,8 @@ The image features available for all images are:
 
    .. note::
 
-      To make the ``/var/log`` directory on the target persistent, use the
-      :term:`VOLATILE_LOG_DIR` variable by setting it to "no".
+      To make the ``/var/log`` directory on the target persistent, remove
+     ``files/fs-perms-volatile-log.txt`` from :term:`FILESYSTEM_PERMS_TABLES`.
 
 -  *ptest-pkgs:* Installs ptest packages for all ptest-enabled recipes.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 32c9e7407dbc..994ee23e2709 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -13,7 +13,6 @@ system and gives an overview of their function and contents.
 :term:`K <KARCH>` :term:`L <LABELS>` :term:`M <MACHINE>`
 :term:`N <NATIVELSBSTRING>` :term:`O <OBJCOPY>` :term:`P`
 :term:`R <RANLIB>` :term:`S` :term:`T`
-:term:`U <UBOOT_CONFIG>` :term:`V <VOLATILE_LOG_DIR>`
 :term:`W <WARN_QA>` :term:`X <XSERVER>`
 
 .. glossary::
@@ -2994,11 +2993,12 @@ system and gives an overview of their function and contents.
       and users across an entire work project. It is best to do this in the
       packages themselves but this is not always possible.
 
-      By default, the OpenEmbedded build system uses the ``fs-perms.txt``,
-      which is located in the ``meta/files`` folder in the :term:`Source Directory`.
-      If you create your own file
-      permissions setting table, you should place it in your layer or the
-      distro's layer.
+      By default, the OpenEmbedded build system uses
+      ``fs-perms.txt``, ``fs-perms-volatile-log.txt``, and
+      ``files/fs-perms-volatile-tmp.txt`` which are located in the
+      ``meta/files`` folder in the :term:`Source Directory`. If you create
+      your own file permissions setting table, you should place it in your
+      layer or the distro's layer.
 
       You define the :term:`FILESYSTEM_PERMS_TABLES` variable in the
       ``conf/local.conf`` file, which is found in the :term:`Build Directory`,
@@ -9983,26 +9983,6 @@ system and gives an overview of their function and contents.
 
          PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} base-passwd"
 
-   :term:`VOLATILE_LOG_DIR`
-      Specifies the persistence of the target's ``/var/log`` directory,
-      which is used to house postinstall target log files.
-
-      By default, :term:`VOLATILE_LOG_DIR` is set to "yes", which means the
-      file is not persistent. You can override this setting by setting the
-      variable to "no" to make the log directory persistent.
-
-   :term:`VOLATILE_TMP_DIR`
-      Specifies the persistence of the target's ``/tmp`` directory.
-
-      By default, :term:`VOLATILE_TMP_DIR` is set to "yes", in which case
-      ``/tmp`` links to a directory which resides in RAM in a ``tmpfs``
-      filesystem.
-
-      If instead, you want the ``/tmp`` directory to be persistent, set the
-      variable to "no" to make it a regular directory in the root filesystem.
-
-      This supports both sysvinit and systemd based systems.
-
    :term:`WARN_QA`
       Specifies the quality assurance checks whose failures are reported as
       warnings by the OpenEmbedded build system. You set this variable in
-- 
2.44.0.501.g19981daefd7c


