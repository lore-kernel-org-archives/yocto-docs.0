Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5761C3ABBE
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 18:03:26 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.83160.1746554604232038538
 for <docs@lists.yoctoproject.org>;
 Tue, 06 May 2025 11:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NwiuhK9C;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: twoerner@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2241053582dso93644225ad.1
        for <docs@lists.yoctoproject.org>; Tue, 06 May 2025 11:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746554603; x=1747159403; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=At5Shc3auzfB/h3dS/DhZGh9sCb1ivm06f4mR1IF4UU=;
        b=NwiuhK9CpCIPN9iHrSwdWPQoa5CDXMfUeKhrhe0jpwUyXixRjd0YiQLWX7pJX6IE3q
         ACr0ntZEROifPNjJAKd8ARQThYuH/Ht1V/Qpu79gCUFfKdkk/e6dS/pecF521HzofWY1
         OlRD0v8KPfni9TeZRuJLE0/+xF4BkJJzVISpq8u6N9WTLSIXMOxXLnjpeJRW2/j1MeUI
         Rg6lLfVdUKPyWp+Zzj8HrdgHodlZxGt036n2FSf2qIr1H12Rf0BD0p1bdbzerJNJ6Y+y
         YR34WLbqKeFYJK8zmNSuzNQiWlvwAXSh/BiyHzAz8jip9iovSsW7knmMmkMp2bmtArFT
         izYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746554603; x=1747159403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=At5Shc3auzfB/h3dS/DhZGh9sCb1ivm06f4mR1IF4UU=;
        b=L1g/erWagG4149deHK92BPJwXJ1UdJUq6yOxb4MgLpJpSwLhE2In++bP/s0PZ8ghi1
         aXV46sdrMTkSkF279MQxHnceLYky2NBqz3znLJxWwUtXt6Jy+iOcLR5TMQSB40wXy8c2
         vuMQMxsV8sTCwbT/V94rZdqcpZxi1LkUcOkimPhf9TsnnxYZHu32GaFYBXAmkpAMHR7g
         uBqMo5t8LASG0mw+FMqn0lGN2igJ0R/nuKAprST8uWpPY4rqd0SNePlyxCnt5QDIOqz1
         TxmpUU/9TagWfjenh6ZGGpSZJRaseH1Qd+08x+4L10dDaZOBUET5t+hSUEZ+NwfLokXr
         SOPw==
X-Gm-Message-State: AOJu0Yx8DODrh55w1nWpCGyAgZbaQ/fM+l0AP5Ptf54v95r4cbpS2Prn
	Ti/wFlF8VHwc1fK4EDvvTr7LiESy1iELOdqRMSSJ58RP+GWvE29HCbXjgw==
X-Gm-Gg: ASbGncu07cj7snRDVFZo03AkZCYBo6jxJc37zMdIF/+qZHPpXCmohgo9aAOn8nA/XB9
	YulYZvPsWfVLCOk1fezpmFAInHoLFO2Vr9lyK2SNFz73bRPDBsVK3jc+ApenHXyIaMlg99GNfGr
	G/OtgrlperapJpZTGUhtgRtRxqt2BrwfE3b7+aIAXp8t+5bzTGY6O6LOPry5VhXZNZo0Cr003gp
	MP73koalloqt/NXrTnnp7rVwFjT7uOTJuV87P0o0RJFpWlaFCZJ4Oo66xh79+4/bNBoFbzBtOsi
	FuJyCtLykw9mc3H9QW+14R50O35+XFClTUwJmt5kV4MrTvd1Lji9n4t6cEoX8cmzDeoVskCv94+
	VHz7lATsy
X-Google-Smtp-Source: AGHT+IG3YavmAXnAqWf5cOd/oyZrO3/WS/Hynq06K+1oeWPHEOddb3qYFHTORjPmT07uyy9rqTwQ+A==
X-Received: by 2002:a05:622a:4c13:b0:477:6f28:8c16 with SMTP id d75a77b69052e-4922556049bmr1798061cf.6.1746554592427;
        Tue, 06 May 2025 11:03:12 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4922174cc55sm747671cf.39.2025.05.06.11.03.10
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 11:03:11 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] sphinx-lint: various fixes
Date: Tue,  6 May 2025 14:03:01 -0400
Message-ID: <20250506180301.32610-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 May 2025 18:03:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6800

A 'make sphinx-lint' pass found the following issues:
	trailing-whitespace
	missing-space-after-literal
	role-with-double-backticks
	missing-space-before-role (role missing opening tag colon)

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/dev-manual/devtool.rst                 | 2 +-
 documentation/dev-manual/start.rst                   | 4 ++--
 documentation/migration-guides/migration-5.2.rst     | 2 +-
 documentation/migration-guides/release-notes-5.2.rst | 4 ++--
 documentation/ref-manual/variables.rst               | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/documentation/dev-manual/devtool.rst b/documentation/dev-manual/devtool.rst
index 2f17d5093048..c82dc9c3334a 100644
--- a/documentation/dev-manual/devtool.rst
+++ b/documentation/dev-manual/devtool.rst
@@ -552,7 +552,7 @@ the two modes:
 
       This instance of VSCode uses plugins that are useful for the development
       of the application. ``devtool ide-sdk`` generates the necessary
-      ``extensions.json``, ``settings.json``, ``tasks.json``and ``launch.json``
+      ``extensions.json``, ``settings.json``, ``tasks.json`` and ``launch.json``
       configuration files for all the involved plugins.
 
       When the source code folder present in the workspace folder is opened in
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 0f015d434041..21d3dce58c14 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -860,7 +860,7 @@ Initializing the Build Environment
 Before you can use Yocto you need to setup the build environment.
 From within the ``poky`` directory, source the :ref:`ref-manual/structure:\`\`oe-init-build-env\`\`` environment
 setup script to define Yocto Project's build environment on your build host::
-    
-    $ source oe-init-build-env 
+
+    $ source oe-init-build-env
 
 Note, that this step will have to be repeated every time you open a new shell.
diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index 9e9f466ade1e..77a11fe27047 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -83,7 +83,7 @@ systemd changes
    files by starting them via
    `Also <https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#Also=>`__,
    the other service files were automatically added to the :term:`FILES` variable of
-   the same package. Example: 
+   the same package. Example:
 
    a.service contains::
 
diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index 03f454bfc080..f0223b5f7290 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -25,7 +25,7 @@ New Features / Enhancements in |yocto-ver|
       :ref:`Shared State <overview-manual/concepts:Shared State>` for the
       dependencies. See :doc:`/test-manual/reproducible-builds`.
 
-   -  ``systemd``: Add term:`WATCHDOG_RUNTIME_SEC`: for controlling the
+   -  ``systemd``: Add :term:`WATCHDOG_RUNTIME_SEC`: for controlling the
       ``RuntimeWatchdogSec`` option in ``/etc/systemd/system.conf``.
 
    -  :term:`FIT_UBOOT_ENV` to allow including a u-boot script as a text in a
@@ -671,7 +671,7 @@ New Features / Enhancements in |yocto-ver|
    -  New ``bbverbnote`` log utility which can be used to print on the console
       (equivalent to the ``bb.verbnote`` Python implementation).
 
-   -  :ref:``ref-classes-grub-efi``: Add :term:`GRUB_TITLE` variable to set
+   -  :ref:`ref-classes-grub-efi`: Add :term:`GRUB_TITLE` variable to set
       custom GRUB titles.
 
    -  ``gawk``: Enable high precision arithmetic support by default (``mpfr``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d17f81036b7d..6a7c265d6b60 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6131,7 +6131,7 @@ system and gives an overview of their function and contents.
       By default, no API key is used, which results in larger delays between API
       requests and limits the number of queries to the public rate limits posted
       at the `NVD developer's page <https://nvd.nist.gov/developers/start-here>`__.
-      
+
       NVD API keys can be requested through the
       `Request an API Key <https://nvd.nist.gov/developers/request-an-api-key>`__
       page. You can set this variable to the NVD API key in your ``local.conf`` file.
@@ -10404,7 +10404,7 @@ system and gives an overview of their function and contents.
 
          UBOOT_FIT_TEE_IMAGE ?= "tee-raw.bin"
 
-      If a relative path is provided, the file is expected to be relative to 
+      If a relative path is provided, the file is expected to be relative to
       U-Boot's :term:`B` directory. An absolute path can be provided too,
       e.g.::
 
-- 
2.44.0.501.g19981daefd7c


