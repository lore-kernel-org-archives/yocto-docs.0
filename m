Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web08.1901.1619809524142035834
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 12:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PKPpEoWG;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: drew.moseley@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id j19so12073631qtx.13
        for <docs@lists.yoctoproject.org>; Fri, 30 Apr 2021 12:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qk5fBlji+Fzpo562gqHkOQdI0hTx7FxGOsnKshblvAc=;
        b=PKPpEoWGAUrCNTOJ2zmMkpibRawfEzhOr2yqQNxTpD5zW92g6nUcXIAJD2hf0bmeAV
         0qRVVvGemOHGVF8ve59xv+9L1DCFoOjeJPIO+27DL5PMfoV/03k8+5ueeR4Qr7QgWiU1
         RogMtxKAAHTbYXO07xyxAAE7Tmk2M/CKknmgE7xRHeqefQlKewLryY31lZ2YZ8T7Bdxb
         45dYUppxfoenxwxTvlBKuG8AKw2J0MwhOf5ZS7MM7NmTZ60i4HEPMKyf8UrRHUv8PizO
         84JC+wvpaZRLxUbAOsi3zaZP0Gipm7bmxqsKC4CiZofwcMrBsRta7wOf7p1Cwt4wMZiz
         uggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qk5fBlji+Fzpo562gqHkOQdI0hTx7FxGOsnKshblvAc=;
        b=bKpcVvvonrhJbnk7ExxoNuMcrSfyimS2cYnQzqOgqbjh8/eIsNNvu/U/6fx923fYUd
         ZcozVcQDGXhFcNMC8dubw+Ipofdxk0Q9QQuzD8qzbZnPLEyjJSG1zgFv7oOu6O2D8UO3
         QJd/Jyn9bLsO6oxlRljrEdhscAGu+5GuAdMNVK3Xi6A4TocVzem9YRPOJpTTZnKSEhKg
         6VFcnwLKaWQIlByZ03225bZLXCWgbp/gGT/3uCRml8K2JPNuOYba92TaDfg4PpF0/l7f
         AzvXDGHdrQT0Tfx+LwlnzF+K4drlxQhYUFUxg7didF/6cXTLllZkvpPVRIzFLXF2vrRk
         JibQ==
X-Gm-Message-State: AOAM531W6RE3FTz87jdETUUPE89RGm4bq6WDrb7j0WbIPgfXNWKuT0MY
	fvs/H0xOJDCixiinV6Xdpvz79NgSOgVG2A==
X-Google-Smtp-Source: ABdhPJwWH1GIEp52BgvdsDRBkRYpzXQzgQ1MTXIOjNj/IXxVYkKwUo9ShNQ5o/Yuj8sMNDl5BGoxVg==
X-Received: by 2002:ac8:6685:: with SMTP id d5mr5926396qtp.60.1619809522672;
        Fri, 30 Apr 2021 12:05:22 -0700 (PDT)
Return-Path: <drew.moseley@gmail.com>
Received: from aruba.home.moseleynet.net ([24.96.56.90])
        by smtp.googlemail.com with ESMTPSA id 198sm2189229qkf.20.2021.04.30.12.05.22
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 12:05:22 -0700 (PDT)
From: "Drew Moseley" <drew.moseley@gmail.com>
X-Google-Original-From: drew@moseleynet.net
To: docs@lists.yoctoproject.org
Subject: [PATCH] docs: Fix a few incorrect option specifications.
Date: Fri, 30 Apr 2021 15:04:32 -0400
Message-Id: <20210430190432.100307-1-drew@moseleynet.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Drew Moseley <drew@moseleynet.net>

Signed-off-by: Drew Moseley <drew@moseleynet.net>
---
 documentation/ref-manual/migration-2.2.rst | 2 +-
 documentation/sdk-manual/extensible.rst    | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/migration-2.2.rst b/documentation/ref-manual/migration-2.2.rst
index a9d3cde7b7..a60ce8d52b 100644
--- a/documentation/ref-manual/migration-2.2.rst
+++ b/documentation/ref-manual/migration-2.2.rst
@@ -422,7 +422,7 @@ The following miscellaneous changes have occurred:
    :term:`SRCREV` by default when fetching from a Git
    repository. You can override this in either case to use
    ``${``\ :term:`AUTOREV`\ ``}`` instead by using the
-   ``-a`` or ``DASHDASHautorev`` command-line option
+   ``-a`` or ``--autorev`` command-line option
 
 -  ``distcc``: GTK+ UI is now disabled by default.
 
diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 04bafaed9e..81727e6f28 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -953,7 +953,7 @@ following methods when you run ``devtool add``:
    Specifying the name like this produces a recipe that only builds for
    the build host.
 
--  Specify the "DASHDASHalso-native" option with the ``devtool add``
+-  Specify the "--also-native" option with the ``devtool add``
    command. Specifying this option creates a recipe file that still
    builds for the target but also creates a variant with a "-native"
    suffix that builds for the build host.
@@ -964,7 +964,7 @@ following methods when you run ``devtool add``:
    that builds code for the target, you can typically accomplish this by
    building the native and target parts separately rather than within
    the same compilation process. Realize though that with the
-   "DASHDASHalso-native" option, you can add the tool using just one
+   "--also-native" option, you can add the tool using just one
    recipe file.
 
 Adding Node.js Modules
@@ -1100,7 +1100,7 @@ arguments listed in the previous paragraph. The command determines the
 exact options being passed, and shows them to you along with any custom
 arguments specified through ``EXTRA_OECONF`` or
 ``PACKAGECONFIG_CONFARGS``. If applicable, the command also shows you
-the output of the configure script's "DASHDASHhelp" option as a
+the output of the configure script's "--help" option as a
 reference.
 
 Sharing Files Between Recipes
-- 
2.31.1

