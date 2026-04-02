Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C834CC6B3D
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 09:19:11 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11615.1775121544653540489
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2026 02:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QOjHxEK/;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b982518b73fso104236466b.1
        for <docs@lists.yoctoproject.org>; Thu, 02 Apr 2026 02:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775121543; x=1775726343; darn=lists.yoctoproject.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EKruBMXLl0sIiIHwSM4KYwXd6Y9BdTqh+2+d3xbHYuA=;
        b=QOjHxEK/lNDsRlctC97mK7m05sewY47Mqh0E9TUsCq8yE++krmfl804EC08jKSRBCu
         v4LNUl0CcpAZeaAk9abPHHytKNtRVp4K8QsV951fKgmaMVFI9n7WYIVkSURYuPMWZNKF
         skekwodBgGqSOT4VtaL6JztFMsq2JVK+n8J52vUZBxtrbkSy/LNG4kb4iYR1vyVXupoN
         WQqdZh4C4iSDMHweqiP/VhjQro2xO50Q+onWEnGuw8xblqAdmRbgIvRxpo9a18TASVBx
         U+ml57S1v73vHX6OvqqWQwazd/V26uJktxj+E/sTAnR6uZajO4RuYh4uHqQpgpaiiT7/
         2TKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775121543; x=1775726343;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKruBMXLl0sIiIHwSM4KYwXd6Y9BdTqh+2+d3xbHYuA=;
        b=szA4jVBHOiEWScXxuRtMzjJ4tdaqc3ropwKM9znMlaaUB+RzvVTIW4cXMoP8YcOKpw
         pP5CeUUH7oZWq5dGP6119TPCWvtYH7ReIocpY93OVLwIS5yhf62ficFRZxRs7z20lN5B
         lrcMSoqkpD5IDp5I/chC9ajI3vqxooozb6wF8EeVi1xjzmfk9fUlUC/QmybFCDVzwqWU
         rNC8Z42FrX0zQN4lu4dKCE7drj4r0ZXl6Zr/0FQQk9G+rJIkIkRcZEiiq8qkhbgjrudi
         dLkyqrZkUXNEc6c7PSKKWwoiOPInuU7hhnliJFrXN56Y+R9+IZsZ1RFDod63FDTQlKD8
         9enw==
X-Gm-Message-State: AOJu0YyARGm9ptoUtML1H+uXyVZ/5UzOaGuFYpSnzGYOA8izFuryR5pp
	omrqVbwgo7Y3FBF/O+m6VE+03yWLzYhW7zQkNhZVDUheC/mik42jhQtj
X-Gm-Gg: ATEYQzy9FDEYjtxcQHduKwpu21Hu4woauzOVDnagAOGdRMdfRQRZRhaauJN/DPmerQP
	UNKYXFUdw+ZWwG02E6t9rB2RLdLzgBup3fKiibi6Rfjb7+ZkzygF70gkHBRKLr6xnJOf82cHEmp
	q43V6kV1qkH7Nudgeke8Njoao8QVhY/pOMWRpmOxxdNigYKC7nMHvDmDg/BUeiDLmi2Uf7+Vwlg
	s/D7CU+HSrztmNaFuFooz10IxL8VkkYeQQnGzDNIBNHjjBtMMQLzPLmsmpmIFHdxJD8WEgTdq6i
	2sVQMmEQgeTidXRScuftIDARrPq8XKvpzc1hqUJZh4WjSPUgO/o3r+9ZPFV68ksjkdwnNqa1Mh5
	B+AsdT3GR04AUVhVR9a6rpk4h3R8C9xnwIe8k1jgp9GF2JBqxgxx/qPmzb87ez4b4XxFM7rzMHZ
	zjos/7JtvIf9a1+E2fC31cxNcNI309Qw==
X-Received: by 2002:a17:907:8285:b0:b9b:1511:a865 with SMTP id a640c23a62f3a-b9c13cd8c3dmr328023566b.51.1775121542520;
        Thu, 02 Apr 2026 02:19:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:6634:a371:1e50:1bf3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6f20sm70923566b.38.2026.04.02.02.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 02:19:01 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Thu, 02 Apr 2026 11:18:53 +0200
Subject: [PATCH] ref-manual/variables.rst: update staging and packaging
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-staging_and_packaging_updates-v1-1-a4b47cc9c43e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHw0zmkC/yXMSwqDMBAA0KvIrBuI8dPaqxSRMZnGoRBDxoog3
 t2gy7d5OwglJoF3sUOilYXnkFE+CrATBk+KXTYYbVpda6NkQc/BDxjcENH+bv2jw4VEvRrUXWn
 tc6QK8hETfXm7/k9/HCdNi0xxbwAAAA==
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775121541; l=9386;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=D52ETGqas6iMZcFaN+J1uKha/IN57rtBtb14k2Jnjoo=;
 b=SpXElYquB5PwgrlcEXQm3axhDKbu/vFnDqhHWB7FB6W81vOZPZWxHeYqjrqKkyEFI1KKc102P
 LDwakCuKCISCbl64R0Ssjmtsb+8zbAWpnb70Y0jomqy0Qd8o5MiBWBa
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Apr 2026 09:19:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9163

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
Updates of staging and packaging variables' descriptions following
design and implementation changes of the last few years.
---
 documentation/ref-manual/variables.rst | 76 ++++++++++++++++------------------
 1 file changed, 36 insertions(+), 40 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 60e608c0c..a6b9b438d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1712,9 +1712,9 @@ system and gives an overview of their function and contents.
          (set via :term:`RRECOMMENDS`) are always ignored.
 
    :term:`COMPONENTS_DIR`
-      Stores sysroot components for each recipe. The OpenEmbedded build
+      Stores sysroot components provided by each recipe. The OpenEmbedded build
       system uses :term:`COMPONENTS_DIR` when constructing recipe-specific
-      sysroots for other recipes.
+      sysroots for recipes.
 
       The default is
       "``${``\ :term:`STAGING_DIR`\ ``}-components``."
@@ -2225,7 +2225,7 @@ system and gives an overview of their function and contents.
 
       The practical effect of the previous assignment is that all files
       installed by bar will be available in the appropriate staging sysroot,
-      given by the :term:`STAGING_DIR* <STAGING_DIR>` variables, by the time
+      given by the :term:`STAGING_DIR* <STAGING_DIR_HOST>` variables, by the time
       the :ref:`ref-tasks-configure` task for ``foo`` runs. This mechanism is
       implemented by having :ref:`ref-tasks-configure` depend on the
       :ref:`ref-tasks-populate_sysroot` task of each recipe listed in
@@ -7493,19 +7493,17 @@ system and gives an overview of their function and contents.
       Points to a shared, global-state directory that holds data generated
       during the packaging process. During the packaging process, the
       :ref:`ref-tasks-packagedata` task packages data
-      for each recipe and installs it into this temporary, shared area.
+      for each recipe and installs it into this shared area.
       This directory defaults to the following, which you should not
       change::
 
-         ${STAGING_DIR_HOST}/pkgdata
+         ${TMPDIR}/pkgdata/${MACHINE}
 
       For examples of how this data is used, see the
       ":ref:`overview-manual/concepts:automatically added runtime dependencies`"
       section in the Yocto Project Overview and Concepts Manual and the
       ":ref:`dev-manual/debugging:viewing package information with ``oe-pkgdata-util```"
-      section in the Yocto Project Development Tasks Manual. For more
-      information on the shared, global-state directory, see
-      :term:`STAGING_DIR_HOST`.
+      section in the Yocto Project Development Tasks Manual.
 
    :term:`PKGDEST`
       Points to the parent directory for files to be packaged after they
@@ -8347,13 +8345,13 @@ system and gives an overview of their function and contents.
       section.
 
    :term:`RECIPE_SYSROOT`
-      This variable points to the directory that holds all files populated from
+      This variable points to the directory populated with all files provided by
       recipes specified in :term:`DEPENDS`. As the name indicates,
-      think of this variable as a custom root (``/``) for the recipe that will be
+      think of this variable as a custom root (``/``) for the recipe, that will be
       used by the compiler in order to find headers and other files needed to complete
       its job.
 
-      This variable is related to :term:`STAGING_DIR_HOST` or :term:`STAGING_DIR_TARGET`
+      This variable is used to define :term:`STAGING_DIR_HOST` or :term:`STAGING_DIR_TARGET`
       according to the type of the recipe and the build target.
 
       To better understand this variable, consider the following examples:
@@ -8367,11 +8365,11 @@ system and gives an overview of their function and contents.
       Do not modify it.
 
    :term:`RECIPE_SYSROOT_NATIVE`
-      This is similar to :term:`RECIPE_SYSROOT` but the populated files are from
-      ``-native`` recipes. This allows a recipe built for the target machine to
-      use ``native`` tools.
+      This is similar to :term:`RECIPE_SYSROOT` but files in it are provided by
+      native recipes. This allows a recipe built for the target machine to
+      use native tools.
 
-      This variable is related to :term:`STAGING_DIR_NATIVE`.
+      This variable is used to define :term:`STAGING_DIR_NATIVE`.
 
       The default value is ``"${WORKDIR}/recipe-sysroot-native"``.
       Do not modify it.
@@ -10160,8 +10158,7 @@ system and gives an overview of their function and contents.
       directory for the build host.
 
    :term:`STAGING_DIR`
-      Helps construct the ``recipe-sysroot*`` directories, which are used
-      during packaging.
+      Used for constructing directory trees used during staging.
 
       For information on how staging for recipe-specific sysroots occurs,
       see the :ref:`ref-tasks-populate_sysroot`
@@ -10181,31 +10178,31 @@ system and gives an overview of their function and contents.
          those files into the sysroot.
 
    :term:`STAGING_DIR_HOST`
-      Specifies the path to the sysroot directory for the system on which
-      the component is built to run (the system that hosts the component).
-      For most recipes, this sysroot is the one in which that recipe's
-      :ref:`ref-tasks-populate_sysroot` task copies
-      files. Exceptions include ``-native`` recipes, where the
-      :ref:`ref-tasks-populate_sysroot` task instead uses
-      :term:`STAGING_DIR_NATIVE`. Depending on
-      the type of recipe and the build target, :term:`STAGING_DIR_HOST` can
-      have the following values:
+      Specifies the path to the recipe's input sysroot directory, populated with files
+      for the system on which the component is built to run
+      (the system that hosts the component).
+      For most recipes, this sysroot is the one into which that recipe's files from
+      :ref:`ref-tasks-populate_sysroot` task will be copied (when sharing files
+      between recipes). Exceptions include native recipes, for which the files from
+      :ref:`ref-tasks-populate_sysroot` task are instead copied to
+      :term:`STAGING_DIR_NATIVE`. Depending on the type of recipe and the build target,
+      :term:`STAGING_DIR_HOST` can have the following values:
 
       -  For recipes building for the target machine, the value is
-         "${:term:`STAGING_DIR`}/${:term:`MACHINE`}".
+         ``"${RECIPE_SYSROOT}"``, check :term:`RECIPE_SYSROOT`.
 
-      -  For native recipes building for the build host, the value is empty
+      -  For native recipes (building for the build host), the value is empty
          given the assumption that when building for the build host, the
          build host's own directories should be used.
 
          .. note::
 
-            ``-native`` recipes are not installed into host paths like such
-            as ``/usr``. Rather, these recipes are installed into
-            :term:`STAGING_DIR_NATIVE`. When compiling ``-native`` recipes,
+            Native recipes' files are not installed into host paths such
+            as ``/usr``. Rather, such recipes' files are installed into
+            :term:`STAGING_DIR_NATIVE`. When compiling native recipes,
             standard build environment variables such as
             :term:`CPPFLAGS` and
-            :term:`CFLAGS` are set up so that both host paths
+            :term:`CFLAGS` are set up so that both build host's paths
             and :term:`STAGING_DIR_NATIVE` are searched for libraries and
             headers using, for example, GCC's ``-isystem`` option.
 
@@ -10213,16 +10210,15 @@ system and gives an overview of their function and contents.
             should be viewed as input variables by tasks such as
             :ref:`ref-tasks-configure`,
             :ref:`ref-tasks-compile`, and
-            :ref:`ref-tasks-install`. Having the real system
-            root correspond to :term:`STAGING_DIR_HOST` makes conceptual sense
-            for ``-native`` recipes, as they make use of host headers and
-            libraries.
-
-      Check :term:`RECIPE_SYSROOT` and :term:`RECIPE_SYSROOT_NATIVE`.
+            :ref:`ref-tasks-install`. Having the real system root
+            (the build host's root) play the role of :term:`STAGING_DIR_HOST`
+            makes conceptual sense for native recipes, as they make use
+            of the build host's headers and libraries.
 
    :term:`STAGING_DIR_NATIVE`
-      Specifies the path to the sysroot directory used when building
-      components that run on the build host itself.
+      Specifies the path to the recipe's input sysroot directory, populated with
+      files provided by native recipes (recipes building components that
+      run on the build host itself).
 
       The default value is ``"${RECIPE_SYSROOT_NATIVE}"``,
       check :term:`RECIPE_SYSROOT_NATIVE`.

---
base-commit: dc1574b9f71532c469f355af2ff5ff5664083e48
change-id: 20260402-staging_and_packaging_updates-85a091cc7be3

Best regards,
-- 
Adam Blank <adam.blank.g@gmail.com>


