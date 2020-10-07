Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.1348.1602104892736604222
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Oct 2020 14:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XLBnz8sK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id z22so5323012wmi.0
        for <docs@lists.yoctoproject.org>; Wed, 07 Oct 2020 14:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dbWuQxu7ksI1bgCNb//no4P99Ew3gPm8HaMQgsQ/Rws=;
        b=XLBnz8sKnpSmWg9tunqwVQdifixSMeMrA6xxTHwmjnI/xgt8ZX1VhZ04pXX5axQYYm
         S/yI+EFVO4GrYQnvmi4P50IuFaKSiaZh2L4MkJ5mEVjX7qBiRDfCkV25oBj+JK49gH7E
         S3DR9wWvi+ElZYQBCRuv+hwdjRWI74ZcZQBFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dbWuQxu7ksI1bgCNb//no4P99Ew3gPm8HaMQgsQ/Rws=;
        b=TlRJ2VbV8ZT/m7ZFztXTXcssypD3WG96ZqdZx/A1d+yIBtZKw1+TNq18rFx+vmkrBm
         qwmwtDvz9Y33dVkhD45acOCg1fRCGa50mIQv76PXsCQW2xUrpGKC+rMgaOaKxxIk87H1
         065SutuLhPpOA3BMKnrvQ4nhFx617t9Jiqw8jxPxDXPGKUg1za2YA3ddZkiOwhQuEioV
         qnzd4TbOK6lel4rq/EuHLRw2xs77Zykph3sPisyJu1Jqp6BWoRawHK1GI3a+5ZIbDf6t
         mYqj92j/nnvZJJkJhNj7FOFesf0sa541jQ/+fXIhZoedkD0hVO9RY/gTWQEvsG+E/xcI
         nC3Q==
X-Gm-Message-State: AOAM533WxmrmSx2F4dD7RhAvmQ4wwGvQlVn7ag4V244VbMTP5SBMSkat
	E0BFwt/IbgVNjk+DbCJNzarNmjZA+lmBzA==
X-Google-Smtp-Source: ABdhPJxc7k0cYJept6uWEHfbrtOgj2mQbBnDbWfhs/FnaDqkYK12HQTx+LgqBjyutCOlE7cL3rq9tQ==
X-Received: by 2002:a1c:4604:: with SMTP id t4mr5335525wma.48.1602104888806;
        Wed, 07 Oct 2020 14:08:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id i3sm4371941wrs.4.2020.10.07.14.08.08
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 14:08:08 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] docs: Fix license CC-BY-2.0-UK -> CC-BY-SA-2.0-UK
Date: Wed,  7 Oct 2020 22:08:07 +0100
Message-Id: <20201007210807.3192142-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the license identifier tags were added, an incorrect string was used
and the Share-Alike clause was lost. Fix this to match the license
description in the files and add back the lost piece (its clear from
the history it should be there)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/adt-manual/adt-command.rst                        | 2 +-
 documentation/adt-manual/adt-intro.rst                          | 2 +-
 documentation/adt-manual/adt-manual-intro.rst                   | 2 +-
 documentation/adt-manual/adt-manual.rst                         | 2 +-
 documentation/adt-manual/adt-package.rst                        | 2 +-
 documentation/adt-manual/adt-prepare.rst                        | 2 +-
 documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst     | 2 +-
 documentation/bsp-guide/bsp-guide.rst                           | 2 +-
 documentation/bsp-guide/bsp.rst                                 | 2 +-
 documentation/bsp-guide/history.rst                             | 2 +-
 documentation/conf.py                                           | 2 +-
 documentation/dev-manual/dev-manual-common-tasks.rst            | 2 +-
 documentation/dev-manual/dev-manual-intro.rst                   | 2 +-
 documentation/dev-manual/dev-manual-qemu.rst                    | 2 +-
 documentation/dev-manual/dev-manual-start.rst                   | 2 +-
 documentation/dev-manual/dev-manual.rst                         | 2 +-
 documentation/dev-manual/history.rst                            | 2 +-
 documentation/index.rst                                         | 2 +-
 documentation/kernel-dev/history.rst                            | 2 +-
 documentation/kernel-dev/kernel-dev-advanced.rst                | 2 +-
 documentation/kernel-dev/kernel-dev-common.rst                  | 2 +-
 documentation/kernel-dev/kernel-dev-concepts-appx.rst           | 2 +-
 documentation/kernel-dev/kernel-dev-faq.rst                     | 2 +-
 documentation/kernel-dev/kernel-dev-intro.rst                   | 2 +-
 documentation/kernel-dev/kernel-dev-maint-appx.rst              | 2 +-
 documentation/kernel-dev/kernel-dev.rst                         | 2 +-
 documentation/overview-manual/history.rst                       | 2 +-
 documentation/overview-manual/overview-manual-concepts.rst      | 2 +-
 .../overview-manual/overview-manual-development-environment.rst | 2 +-
 documentation/overview-manual/overview-manual-intro.rst         | 2 +-
 documentation/overview-manual/overview-manual-yp-intro.rst      | 2 +-
 documentation/overview-manual/overview-manual.rst               | 2 +-
 documentation/profile-manual/history.rst                        | 2 +-
 documentation/profile-manual/profile-manual-arch.rst            | 2 +-
 documentation/profile-manual/profile-manual-examples.rst        | 2 +-
 documentation/profile-manual/profile-manual-intro.rst           | 2 +-
 documentation/profile-manual/profile-manual-usage.rst           | 2 +-
 documentation/profile-manual/profile-manual.rst                 | 2 +-
 documentation/ref-manual/faq.rst                                | 2 +-
 documentation/ref-manual/history.rst                            | 2 +-
 documentation/ref-manual/migration-1.3.rst                      | 2 +-
 documentation/ref-manual/migration.rst                          | 2 +-
 documentation/ref-manual/ref-classes.rst                        | 2 +-
 documentation/ref-manual/ref-devtool-reference.rst              | 2 +-
 documentation/ref-manual/ref-features.rst                       | 2 +-
 documentation/ref-manual/ref-images.rst                         | 2 +-
 documentation/ref-manual/ref-kickstart.rst                      | 2 +-
 documentation/ref-manual/ref-manual.rst                         | 2 +-
 documentation/ref-manual/ref-qa-checks.rst                      | 2 +-
 documentation/ref-manual/ref-release-process.rst                | 2 +-
 documentation/ref-manual/ref-structure.rst                      | 2 +-
 documentation/ref-manual/ref-system-requirements.rst            | 2 +-
 documentation/ref-manual/ref-tasks.rst                          | 2 +-
 documentation/ref-manual/ref-terms.rst                          | 2 +-
 documentation/ref-manual/ref-variables.rst                      | 2 +-
 documentation/ref-manual/ref-varlocality.rst                    | 2 +-
 documentation/ref-manual/resources.rst                          | 2 +-
 documentation/releases.rst                                      | 2 +-
 documentation/sdk-manual/history.rst                            | 2 +-
 documentation/sdk-manual/sdk-appendix-customizing-standard.rst  | 2 +-
 documentation/sdk-manual/sdk-appendix-customizing.rst           | 2 +-
 documentation/sdk-manual/sdk-appendix-obtain.rst                | 2 +-
 documentation/sdk-manual/sdk-extensible.rst                     | 2 +-
 documentation/sdk-manual/sdk-intro.rst                          | 2 +-
 documentation/sdk-manual/sdk-manual.rst                         | 2 +-
 documentation/sdk-manual/sdk-using.rst                          | 2 +-
 documentation/sdk-manual/sdk-working-projects.rst               | 2 +-
 documentation/sphinx-static/theme_overrides.css                 | 2 +-
 documentation/test-manual/history.rst                           | 2 +-
 documentation/test-manual/test-manual-intro.rst                 | 2 +-
 documentation/test-manual/test-manual-test-process.rst          | 2 +-
 .../test-manual/test-manual-understand-autobuilder.rst          | 2 +-
 documentation/test-manual/test-manual.rst                       | 2 +-
 documentation/toaster-manual/history.rst                        | 2 +-
 documentation/toaster-manual/toaster-manual-intro.rst           | 2 +-
 documentation/toaster-manual/toaster-manual-reference.rst       | 2 +-
 documentation/toaster-manual/toaster-manual-setup-and-use.rst   | 2 +-
 documentation/toaster-manual/toaster-manual-start.rst           | 2 +-
 documentation/toaster-manual/toaster-manual.rst                 | 2 +-
 documentation/transitioning-to-a-custom-environment.rst         | 2 +-
 documentation/what-i-wish-id-known.rst                          | 2 +-
 81 files changed, 81 insertions(+), 81 deletions(-)

diff --git a/documentation/adt-manual/adt-command.rst b/documentation/adt-manual/adt-command.rst
index de854772b..d348adfcc 100644
--- a/documentation/adt-manual/adt-command.rst
+++ b/documentation/adt-manual/adt-command.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 **********************
 Using the Command Line
diff --git a/documentation/adt-manual/adt-intro.rst b/documentation/adt-manual/adt-intro.rst
index 5372f4f54..92c157099 100644
--- a/documentation/adt-manual/adt-intro.rst
+++ b/documentation/adt-manual/adt-intro.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 *****************************************
 The Application Development Toolkit (ADT)
diff --git a/documentation/adt-manual/adt-manual-intro.rst b/documentation/adt-manual/adt-manual-intro.rst
index 4e98da16d..2c840fdf0 100644
--- a/documentation/adt-manual/adt-manual-intro.rst
+++ b/documentation/adt-manual/adt-manual-intro.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ************
 Introduction
diff --git a/documentation/adt-manual/adt-manual.rst b/documentation/adt-manual/adt-manual.rst
index 695230c5c..b61f59e0f 100644
--- a/documentation/adt-manual/adt-manual.rst
+++ b/documentation/adt-manual/adt-manual.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ===========================================
 Yocto Project Application Developer's Guide
diff --git a/documentation/adt-manual/adt-package.rst b/documentation/adt-manual/adt-package.rst
index 787d406e6..a722453ec 100644
--- a/documentation/adt-manual/adt-package.rst
+++ b/documentation/adt-manual/adt-package.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ************************************************************
 Optionally Customizing the Development Packages Installation
diff --git a/documentation/adt-manual/adt-prepare.rst b/documentation/adt-manual/adt-prepare.rst
index 9b6bd0514..5a85cbfe6 100644
--- a/documentation/adt-manual/adt-prepare.rst
+++ b/documentation/adt-manual/adt-prepare.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 *************************************
 Preparing for Application Development
diff --git a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
index 7e24b9e68..14a3e1751 100644
--- a/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
+++ b/documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 =========================
 Yocto Project Quick Build
diff --git a/documentation/bsp-guide/bsp-guide.rst b/documentation/bsp-guide/bsp-guide.rst
index 435a399d5..a4394a85e 100644
--- a/documentation/bsp-guide/bsp-guide.rst
+++ b/documentation/bsp-guide/bsp-guide.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 =====================================================
 Yocto Project Board Support Package Developer's Guide
diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bsp.rst
index 024a240c2..61b295827 100644
--- a/documentation/bsp-guide/bsp.rst
+++ b/documentation/bsp-guide/bsp.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ************************************************
 Board Support Packages (BSP) - Developer's Guide
diff --git a/documentation/bsp-guide/history.rst b/documentation/bsp-guide/history.rst
index b52006adf..d7cd8ef7f 100644
--- a/documentation/bsp-guide/history.rst
+++ b/documentation/bsp-guide/history.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ***********************
 Manual Revision History
diff --git a/documentation/conf.py b/documentation/conf.py
index 80d5e8e83..ebc26aa3b 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -1,6 +1,6 @@
 # Configuration file for the Sphinx documentation builder.
 #
-# SPDX-License-Identifier: CC-BY-2.0-UK
+# SPDX-License-Identifier: CC-BY-SA-2.0-UK
 #
 # This file only contains a selection of the most common options. For a full
 # list see the documentation:
diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 179979c76..bef8bf840 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ************
 Common Tasks
diff --git a/documentation/dev-manual/dev-manual-intro.rst b/documentation/dev-manual/dev-manual-intro.rst
index 3225c6ca4..da08b7b6e 100644
--- a/documentation/dev-manual/dev-manual-intro.rst
+++ b/documentation/dev-manual/dev-manual-intro.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ******************************************
 The Yocto Project Development Tasks Manual
diff --git a/documentation/dev-manual/dev-manual-qemu.rst b/documentation/dev-manual/dev-manual-qemu.rst
index 2833689d5..9337a3542 100644
--- a/documentation/dev-manual/dev-manual-qemu.rst
+++ b/documentation/dev-manual/dev-manual-qemu.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 *******************************
 Using the Quick EMUlator (QEMU)
diff --git a/documentation/dev-manual/dev-manual-start.rst b/documentation/dev-manual/dev-manual-start.rst
index d9c1e4de0..333c6a566 100644
--- a/documentation/dev-manual/dev-manual-start.rst
+++ b/documentation/dev-manual/dev-manual-start.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ***********************************
 Setting Up to Use the Yocto Project
diff --git a/documentation/dev-manual/dev-manual.rst b/documentation/dev-manual/dev-manual.rst
index c62906715..8f09224fe 100644
--- a/documentation/dev-manual/dev-manual.rst
+++ b/documentation/dev-manual/dev-manual.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ======================================
 Yocto Project Development Tasks Manual
diff --git a/documentation/dev-manual/history.rst b/documentation/dev-manual/history.rst
index 8b149a6ef..1ba312422 100644
--- a/documentation/dev-manual/history.rst
+++ b/documentation/dev-manual/history.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ***********************
 Manual Revision History
diff --git a/documentation/index.rst b/documentation/index.rst
index 821316915..2891a9862 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 .. The Yocto Project documentation master file, created by
    sphinx-quickstart on Mon Apr 13 09:38:33 2020.
diff --git a/documentation/kernel-dev/history.rst b/documentation/kernel-dev/history.rst
index 3ffb7eacb..761b506ac 100644
--- a/documentation/kernel-dev/history.rst
+++ b/documentation/kernel-dev/history.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ***********************
 Manual Revision History
diff --git a/documentation/kernel-dev/kernel-dev-advanced.rst b/documentation/kernel-dev/kernel-dev-advanced.rst
index 36133caae..eeb8f8792 100644
--- a/documentation/kernel-dev/kernel-dev-advanced.rst
+++ b/documentation/kernel-dev/kernel-dev-advanced.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 *******************************************************
 Working with Advanced Metadata (``yocto-kernel-cache``)
diff --git a/documentation/kernel-dev/kernel-dev-common.rst b/documentation/kernel-dev/kernel-dev-common.rst
index d4b60a9dc..64235f380 100644
--- a/documentation/kernel-dev/kernel-dev-common.rst
+++ b/documentation/kernel-dev/kernel-dev-common.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ************
 Common Tasks
diff --git a/documentation/kernel-dev/kernel-dev-concepts-appx.rst b/documentation/kernel-dev/kernel-dev-concepts-appx.rst
index 04cb1172b..5b6ebef5a 100644
--- a/documentation/kernel-dev/kernel-dev-concepts-appx.rst
+++ b/documentation/kernel-dev/kernel-dev-concepts-appx.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ************************
 Advanced Kernel Concepts
diff --git a/documentation/kernel-dev/kernel-dev-faq.rst b/documentation/kernel-dev/kernel-dev-faq.rst
index b5e6a84eb..70bf4a2d4 100644
--- a/documentation/kernel-dev/kernel-dev-faq.rst
+++ b/documentation/kernel-dev/kernel-dev-faq.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 **********************
 Kernel Development FAQ
diff --git a/documentation/kernel-dev/kernel-dev-intro.rst b/documentation/kernel-dev/kernel-dev-intro.rst
index 21d43d5e8..447cddba2 100644
--- a/documentation/kernel-dev/kernel-dev-intro.rst
+++ b/documentation/kernel-dev/kernel-dev-intro.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ************
 Introduction
diff --git a/documentation/kernel-dev/kernel-dev-maint-appx.rst b/documentation/kernel-dev/kernel-dev-maint-appx.rst
index 5514dac87..17883327d 100644
--- a/documentation/kernel-dev/kernel-dev-maint-appx.rst
+++ b/documentation/kernel-dev/kernel-dev-maint-appx.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ******************
 Kernel Maintenance
diff --git a/documentation/kernel-dev/kernel-dev.rst b/documentation/kernel-dev/kernel-dev.rst
index 332e089b0..55b42ed99 100644
--- a/documentation/kernel-dev/kernel-dev.rst
+++ b/documentation/kernel-dev/kernel-dev.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 =============================================
 Yocto Project Linux Kernel Development Manual
diff --git a/documentation/overview-manual/history.rst b/documentation/overview-manual/history.rst
index 0273d28b9..6fc700a01 100644
--- a/documentation/overview-manual/history.rst
+++ b/documentation/overview-manual/history.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ***********************
 Manual Revision History
diff --git a/documentation/overview-manual/overview-manual-concepts.rst b/documentation/overview-manual/overview-manual-concepts.rst
index 6ce5f80af..d9f50e519 100644
--- a/documentation/overview-manual/overview-manual-concepts.rst
+++ b/documentation/overview-manual/overview-manual-concepts.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 **********************
 Yocto Project Concepts
diff --git a/documentation/overview-manual/overview-manual-development-environment.rst b/documentation/overview-manual/overview-manual-development-environment.rst
index bb2c8e72e..4bedd6df6 100644
--- a/documentation/overview-manual/overview-manual-development-environment.rst
+++ b/documentation/overview-manual/overview-manual-development-environment.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 *****************************************
 The Yocto Project Development Environment
diff --git a/documentation/overview-manual/overview-manual-intro.rst b/documentation/overview-manual/overview-manual-intro.rst
index 3f206fd54..8885eb89f 100644
--- a/documentation/overview-manual/overview-manual-intro.rst
+++ b/documentation/overview-manual/overview-manual-intro.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 **********************************************
 The Yocto Project Overview and Concepts Manual
diff --git a/documentation/overview-manual/overview-manual-yp-intro.rst b/documentation/overview-manual/overview-manual-yp-intro.rst
index 5cdab7ca4..9073582ac 100644
--- a/documentation/overview-manual/overview-manual-yp-intro.rst
+++ b/documentation/overview-manual/overview-manual-yp-intro.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 *****************************
 Introducing the Yocto Project
diff --git a/documentation/overview-manual/overview-manual.rst b/documentation/overview-manual/overview-manual.rst
index 80ce9aae7..f20b20e32 100644
--- a/documentation/overview-manual/overview-manual.rst
+++ b/documentation/overview-manual/overview-manual.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ==========================================
 Yocto Project Overview and Concepts Manual
diff --git a/documentation/profile-manual/history.rst b/documentation/profile-manual/history.rst
index 3ffb7eacb..761b506ac 100644
--- a/documentation/profile-manual/history.rst
+++ b/documentation/profile-manual/history.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ***********************
 Manual Revision History
diff --git a/documentation/profile-manual/profile-manual-arch.rst b/documentation/profile-manual/profile-manual-arch.rst
index 9e1e400e4..73cd0c29e 100644
--- a/documentation/profile-manual/profile-manual-arch.rst
+++ b/documentation/profile-manual/profile-manual-arch.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 *************************************************************
 Overall Architecture of the Linux Tracing and Profiling Tools
diff --git a/documentation/profile-manual/profile-manual-examples.rst b/documentation/profile-manual/profile-manual-examples.rst
index 32ccd37b8..97a9e9e21 100644
--- a/documentation/profile-manual/profile-manual-examples.rst
+++ b/documentation/profile-manual/profile-manual-examples.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 *******************
 Real-World Examples
diff --git a/documentation/profile-manual/profile-manual-intro.rst b/documentation/profile-manual/profile-manual-intro.rst
index 994b1c508..0d435e0c0 100644
--- a/documentation/profile-manual/profile-manual-intro.rst
+++ b/documentation/profile-manual/profile-manual-intro.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ******************************************
 Yocto Project Profiling and Tracing Manual
diff --git a/documentation/profile-manual/profile-manual-usage.rst b/documentation/profile-manual/profile-manual-usage.rst
index 32b04f6ff..d3c020a1c 100644
--- a/documentation/profile-manual/profile-manual-usage.rst
+++ b/documentation/profile-manual/profile-manual-usage.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 .. highlight:: shell
 
 ***************************************************************
diff --git a/documentation/profile-manual/profile-manual.rst b/documentation/profile-manual/profile-manual.rst
index 2c8fcf3e6..5ec5b9e75 100644
--- a/documentation/profile-manual/profile-manual.rst
+++ b/documentation/profile-manual/profile-manual.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ==========================================
 Yocto Project Profiling and Tracing Manual
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 2d2aaad0a..69852824a 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ***
 FAQ
diff --git a/documentation/ref-manual/history.rst b/documentation/ref-manual/history.rst
index e962d9297..dc0a2ae79 100644
--- a/documentation/ref-manual/history.rst
+++ b/documentation/ref-manual/history.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ***********************
 Manual Revision History
diff --git a/documentation/ref-manual/migration-1.3.rst b/documentation/ref-manual/migration-1.3.rst
index ebbc23887..5793f9b6e 100644
--- a/documentation/ref-manual/migration-1.3.rst
+++ b/documentation/ref-manual/migration-1.3.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 Moving to the Yocto Project 1.3 Release
 =======================================
diff --git a/documentation/ref-manual/migration.rst b/documentation/ref-manual/migration.rst
index 6c6119dae..20288b0de 100644
--- a/documentation/ref-manual/migration.rst
+++ b/documentation/ref-manual/migration.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ******************************************
 Migrating to a Newer Yocto Project Release
diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
index b007e3482..756df2a60 100644
--- a/documentation/ref-manual/ref-classes.rst
+++ b/documentation/ref-manual/ref-classes.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 *******
 Classes
diff --git a/documentation/ref-manual/ref-devtool-reference.rst b/documentation/ref-manual/ref-devtool-reference.rst
index eaca45ae2..1fe8997f5 100644
--- a/documentation/ref-manual/ref-devtool-reference.rst
+++ b/documentation/ref-manual/ref-devtool-reference.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ***************************
 ``devtool`` Quick Reference
diff --git a/documentation/ref-manual/ref-features.rst b/documentation/ref-manual/ref-features.rst
index ae5a0e3b2..60d905d05 100644
--- a/documentation/ref-manual/ref-features.rst
+++ b/documentation/ref-manual/ref-features.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ********
 Features
diff --git a/documentation/ref-manual/ref-images.rst b/documentation/ref-manual/ref-images.rst
index c88d4d75c..eaa6c4949 100644
--- a/documentation/ref-manual/ref-images.rst
+++ b/documentation/ref-manual/ref-images.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ******
 Images
diff --git a/documentation/ref-manual/ref-kickstart.rst b/documentation/ref-manual/ref-kickstart.rst
index 45222de05..c031ef287 100644
--- a/documentation/ref-manual/ref-kickstart.rst
+++ b/documentation/ref-manual/ref-kickstart.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 *******************************************
 OpenEmbedded Kickstart (``.wks``) Reference
diff --git a/documentation/ref-manual/ref-manual.rst b/documentation/ref-manual/ref-manual.rst
index a106af21d..033f4ba28 100644
--- a/documentation/ref-manual/ref-manual.rst
+++ b/documentation/ref-manual/ref-manual.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ==============================
 Yocto Project Reference Manual
diff --git a/documentation/ref-manual/ref-qa-checks.rst b/documentation/ref-manual/ref-qa-checks.rst
index 3e76ac150..4ac65c0f8 100644
--- a/documentation/ref-manual/ref-qa-checks.rst
+++ b/documentation/ref-manual/ref-qa-checks.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 *****************************
 QA Error and Warning Messages
diff --git a/documentation/ref-manual/ref-release-process.rst b/documentation/ref-manual/ref-release-process.rst
index be041e725..172385ca4 100644
--- a/documentation/ref-manual/ref-release-process.rst
+++ b/documentation/ref-manual/ref-release-process.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 *****************************************************
 Yocto Project Releases and the Stable Release Process
diff --git a/documentation/ref-manual/ref-structure.rst b/documentation/ref-manual/ref-structure.rst
index 48a443331..ef07354ec 100644
--- a/documentation/ref-manual/ref-structure.rst
+++ b/documentation/ref-manual/ref-structure.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 **************************
 Source Directory Structure
diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index 56218e4eb..54f38f6d3 100644
--- a/documentation/ref-manual/ref-system-requirements.rst
+++ b/documentation/ref-manual/ref-system-requirements.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 *******************
 System Requirements
diff --git a/documentation/ref-manual/ref-tasks.rst b/documentation/ref-manual/ref-tasks.rst
index dcdff05dc..2569306fc 100644
--- a/documentation/ref-manual/ref-tasks.rst
+++ b/documentation/ref-manual/ref-tasks.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 *****
 Tasks
diff --git a/documentation/ref-manual/ref-terms.rst b/documentation/ref-manual/ref-terms.rst
index 600cc23c3..556bc6b19 100644
--- a/documentation/ref-manual/ref-terms.rst
+++ b/documentation/ref-manual/ref-terms.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 *******************
 Yocto Project Terms
diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index 35baf9b81..316e8aabf 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ******************
 Variables Glossary
diff --git a/documentation/ref-manual/ref-varlocality.rst b/documentation/ref-manual/ref-varlocality.rst
index a95504b57..5f7dba877 100644
--- a/documentation/ref-manual/ref-varlocality.rst
+++ b/documentation/ref-manual/ref-varlocality.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ****************
 Variable Context
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-manual/resources.rst
index 2b82b7910..f90182b9e 100644
--- a/documentation/ref-manual/resources.rst
+++ b/documentation/ref-manual/resources.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ****************************************
 Contributions and Additional Information
diff --git a/documentation/releases.rst b/documentation/releases.rst
index 49c33b3b5..536c3a6d2 100644
--- a/documentation/releases.rst
+++ b/documentation/releases.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 =========================
  Current Release Manuals
diff --git a/documentation/sdk-manual/history.rst b/documentation/sdk-manual/history.rst
index af027c97f..8c10f6d2e 100644
--- a/documentation/sdk-manual/history.rst
+++ b/documentation/sdk-manual/history.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ***********************
 Manual Revision History
diff --git a/documentation/sdk-manual/sdk-appendix-customizing-standard.rst b/documentation/sdk-manual/sdk-appendix-customizing-standard.rst
index f6f2b6640..90b634529 100644
--- a/documentation/sdk-manual/sdk-appendix-customizing-standard.rst
+++ b/documentation/sdk-manual/sdk-appendix-customizing-standard.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ****************************
 Customizing the Standard SDK
diff --git a/documentation/sdk-manual/sdk-appendix-customizing.rst b/documentation/sdk-manual/sdk-appendix-customizing.rst
index 7743e3c00..5a33f6385 100644
--- a/documentation/sdk-manual/sdk-appendix-customizing.rst
+++ b/documentation/sdk-manual/sdk-appendix-customizing.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ******************************
 Customizing the Extensible SDK
diff --git a/documentation/sdk-manual/sdk-appendix-obtain.rst b/documentation/sdk-manual/sdk-appendix-obtain.rst
index 97ab9169e..a51c22e39 100644
--- a/documentation/sdk-manual/sdk-appendix-obtain.rst
+++ b/documentation/sdk-manual/sdk-appendix-obtain.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 *****************
 Obtaining the SDK
diff --git a/documentation/sdk-manual/sdk-extensible.rst b/documentation/sdk-manual/sdk-extensible.rst
index 0f92ac9f0..5ff75ada2 100644
--- a/documentation/sdk-manual/sdk-extensible.rst
+++ b/documentation/sdk-manual/sdk-extensible.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ************************
 Using the Extensible SDK
diff --git a/documentation/sdk-manual/sdk-intro.rst b/documentation/sdk-manual/sdk-intro.rst
index 82b7bcf3c..5a346fa6e 100644
--- a/documentation/sdk-manual/sdk-intro.rst
+++ b/documentation/sdk-manual/sdk-intro.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ************
 Introduction
diff --git a/documentation/sdk-manual/sdk-manual.rst b/documentation/sdk-manual/sdk-manual.rst
index d7776b7c4..177826edf 100644
--- a/documentation/sdk-manual/sdk-manual.rst
+++ b/documentation/sdk-manual/sdk-manual.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ========================================================================================
 Yocto Project Application Development and the Extensible Software Development Kit (eSDK)
diff --git a/documentation/sdk-manual/sdk-using.rst b/documentation/sdk-manual/sdk-using.rst
index 09a194cab..4b151e45c 100644
--- a/documentation/sdk-manual/sdk-using.rst
+++ b/documentation/sdk-manual/sdk-using.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 **********************
 Using the Standard SDK
diff --git a/documentation/sdk-manual/sdk-working-projects.rst b/documentation/sdk-manual/sdk-working-projects.rst
index 2c20a1ec5..5c828fd58 100644
--- a/documentation/sdk-manual/sdk-working-projects.rst
+++ b/documentation/sdk-manual/sdk-working-projects.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ********************************
 Using the SDK Toolchain Directly
diff --git a/documentation/sphinx-static/theme_overrides.css b/documentation/sphinx-static/theme_overrides.css
index 55da38a2b..d235cb826 100644
--- a/documentation/sphinx-static/theme_overrides.css
+++ b/documentation/sphinx-static/theme_overrides.css
@@ -1,5 +1,5 @@
 /*
-    SPDX-License-Identifier: CC-BY-2.0-UK
+    SPDX-License-Identifier: CC-BY-SA-2.0-UK
 */
 
 body {
diff --git a/documentation/test-manual/history.rst b/documentation/test-manual/history.rst
index 76d43091a..89d4aad21 100644
--- a/documentation/test-manual/history.rst
+++ b/documentation/test-manual/history.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ***********************
 Manual Revision History
diff --git a/documentation/test-manual/test-manual-intro.rst b/documentation/test-manual/test-manual-intro.rst
index 53ad650b3..25b79f7a0 100644
--- a/documentation/test-manual/test-manual-intro.rst
+++ b/documentation/test-manual/test-manual-intro.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 *****************************************
 The Yocto Project Test Environment Manual
diff --git a/documentation/test-manual/test-manual-test-process.rst b/documentation/test-manual/test-manual-test-process.rst
index 96e71bf31..b0817b091 100644
--- a/documentation/test-manual/test-manual-test-process.rst
+++ b/documentation/test-manual/test-manual-test-process.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ***********************************
 Project Testing and Release Process
diff --git a/documentation/test-manual/test-manual-understand-autobuilder.rst b/documentation/test-manual/test-manual-understand-autobuilder.rst
index 2fcae5000..de267776c 100644
--- a/documentation/test-manual/test-manual-understand-autobuilder.rst
+++ b/documentation/test-manual/test-manual-understand-autobuilder.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 *******************************************
 Understanding the Yocto Project Autobuilder
diff --git a/documentation/test-manual/test-manual.rst b/documentation/test-manual/test-manual.rst
index bd5b1b096..2891f06d8 100644
--- a/documentation/test-manual/test-manual.rst
+++ b/documentation/test-manual/test-manual.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 =====================================
 Yocto Project Test Environment Manual
diff --git a/documentation/toaster-manual/history.rst b/documentation/toaster-manual/history.rst
index 027b343d0..05b63e5b9 100644
--- a/documentation/toaster-manual/history.rst
+++ b/documentation/toaster-manual/history.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ***********************
 Manual Revision History
diff --git a/documentation/toaster-manual/toaster-manual-intro.rst b/documentation/toaster-manual/toaster-manual-intro.rst
index 0b7cd41c8..408c6fa3c 100644
--- a/documentation/toaster-manual/toaster-manual-intro.rst
+++ b/documentation/toaster-manual/toaster-manual-intro.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ************
 Introduction
diff --git a/documentation/toaster-manual/toaster-manual-reference.rst b/documentation/toaster-manual/toaster-manual-reference.rst
index e95536e05..e5e3531e8 100644
--- a/documentation/toaster-manual/toaster-manual-reference.rst
+++ b/documentation/toaster-manual/toaster-manual-reference.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 **********************
 Concepts and Reference
diff --git a/documentation/toaster-manual/toaster-manual-setup-and-use.rst b/documentation/toaster-manual/toaster-manual-setup-and-use.rst
index 01c0dce41..97c5af6a0 100644
--- a/documentation/toaster-manual/toaster-manual-setup-and-use.rst
+++ b/documentation/toaster-manual/toaster-manual-setup-and-use.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 .. Set default pygment highlighting to 'shell' for this document
 .. highlight:: shell
 
diff --git a/documentation/toaster-manual/toaster-manual-start.rst b/documentation/toaster-manual/toaster-manual-start.rst
index 2d612b893..267f9f4cd 100644
--- a/documentation/toaster-manual/toaster-manual-start.rst
+++ b/documentation/toaster-manual/toaster-manual-start.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 .. Set default pygments highlighting to shell for this document
 .. highlight:: shell
 
diff --git a/documentation/toaster-manual/toaster-manual.rst b/documentation/toaster-manual/toaster-manual.rst
index f6f59411b..b003f1cea 100644
--- a/documentation/toaster-manual/toaster-manual.rst
+++ b/documentation/toaster-manual/toaster-manual.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 ===================
 Toaster User Manual
diff --git a/documentation/transitioning-to-a-custom-environment.rst b/documentation/transitioning-to-a-custom-environment.rst
index 160152b09..b87fec689 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 =============================================================
 Transitioning to a custom environment for systems development
diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index 495ebdc20..593c6fe14 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -1,4 +1,4 @@
-.. SPDX-License-Identifier: CC-BY-2.0-UK
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
 
 =========================================
 What I wish I'd known about Yocto Project
-- 
2.25.1

