Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7ECF4484C
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 12:18:12 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.155086.1775823482490768223
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 05:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NY/utZIn;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66feeb8ff41so3475534a12.3
        for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 05:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775823481; x=1776428281; darn=lists.yoctoproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+PISjSAy1Ph+nv8vI6SKMzMluQkJDNz1jYF10OBbvA=;
        b=NY/utZInrXuCEobyq28LGdky13aX4pkf7G/vMGnlR7FFV0GjHevoWCOuGHo5ZOAjpd
         59FGQhx+u8wUE/2Awb1R/nAEep1/vYDFDam5Pr2nq5zTzp1U1BPz/kDBD8ts7ManhttZ
         xMB4IDBdmqonqrsZDyrOFuMBn+e0XjRb2oEpLmfxnkgyQc+BJTr4OO3TlMd4YrOrvF0C
         dyRkyaqab/BWp8BTO/9AovMpSxSlI2Y75MHbuvnZAMfYBA0YTggXyKEyNreoBgXKhK9r
         bevGtKROmVwItFx2iHqHqLqhZrg4P5tSpJ5p1Zkf0C4FntDORAURbDsp4PcFfoyAPree
         fD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775823481; x=1776428281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y+PISjSAy1Ph+nv8vI6SKMzMluQkJDNz1jYF10OBbvA=;
        b=S5jUr62yK8IRT0Y+laHwK1LgpXQbP24IY2kpInfK1suGu2xweam67zHf/5A2gzX4QB
         yYmR4skB8awJ53RQ17PX6quA2kR9EBNo1xO5JR+5Y5Q3EnrCAhudznTqxw4n4v+dlE+3
         nwhG49Qcvlm826LTikxCRTAeVaR4URlFsxSgWOxBPTyD1INUkXk087kXlDEVDVK8boco
         lhu6J5y0ffGohznG4sAC8mWz+qSbld7qSePcfB/UJWSxrG14SZ8NWAcoUZdoalY9FpIc
         2ZVWTgZjRUKphiDuN1Niohv1NlRyQUMEHKDxE9+xb5YFDVgzxvhBL6OzmgBoMLTUQfff
         gFUw==
X-Gm-Message-State: AOJu0YzL0s7NddBZPDUbLDRX8AqY0KZbj7Np3fAZwVhLInw+8eAAX8tp
	nbIEc8kI7nq+DerMTryi63q1b60z4l1fCQunwK4PVNY95gy/Y0C2mjMR
X-Gm-Gg: AeBDiesFFsFTRJVHWdijV0FrCYR6fbircVDDmjBAe01HaHRR/LgSyMp+qqJAF0K+ZY+
	tTQ/S7xT4TuP2tfaScONWBinl1YfB53gBVe4xZDmro4Oze3g5AHCPe2/nk9EB2UnLgIclDO5DPe
	PWjMllcIT/XUZZLxioWpRb6WgwVOkoUv0kmb/b1e19U9BZ7+vLnq6OIjzpMLqHaSHzjK0JlFKJQ
	zJ6JzKsbIF3gDzmfBi/TjfiAXFuwez647vNzleBsCfBkKsWouoHwSJ4vSTNVNrfjh2mcfTuLzKM
	UFCc+AAaPi+p1wAiVjOaV+177zLPth52d2zWC3TfOoKJhrwM6lQ48lGYyS4ocXXQtj3cYmzSTTl
	hzDyEtf+wz4Z+FPP/Rfrz7Fy1OjY1JQf5oQDRHaCk4NMizX8NzNXiCKLZ9t8P5caadSBGWaVvDc
	62CgwwsYYIb1w4gp0amwE7X6Gte6hHbg==
X-Received: by 2002:a17:907:3d0f:b0:b98:2c44:6631 with SMTP id a640c23a62f3a-b9d7248a89dmr169520366b.14.1775823480546;
        Fri, 10 Apr 2026 05:18:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:5694:dea1:688f:6eee])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de8d69fsm74881666b.4.2026.04.10.05.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 05:17:59 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Fri, 10 Apr 2026 14:17:48 +0200
Subject: [PATCH v2 5/6] ref-manual/variables.rst: update STAGING_DIR*
 descriptions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-staging_and_packaging_vars-v2-5-211bce1349b1@gmail.com>
References: <20260410-staging_and_packaging_vars-v2-0-211bce1349b1@gmail.com>
In-Reply-To: <20260410-staging_and_packaging_vars-v2-0-211bce1349b1@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775823472; l=4770;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=R5cF2uptC6IFEi43BDgNVhRYZXcT5IOzhDdAEWrMNkQ=;
 b=DKhS1chIUlfp9o3ClWBefas4wQ09e3B4pIG4LBLIz3YSHDyQQ+sV0+zgcFEkSVvmKRDdYdq+M
 5T2ZhL7FqNTBJKkR5jGrzsCPyyhpWpwW+QiwTDLAY/gCg4AsUbyUWH3
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 12:18:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9228

Slightly reword to emphasize the sysroots' roles during the build.
Drop double back-quote from the uses of '-native' to make it a bit
easier on the eyes.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 documentation/ref-manual/variables.rst | 49 +++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index aa142a701..af1475fb4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10178,31 +10178,31 @@ system and gives an overview of their function and contents.
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
+      For most recipes, this sysroot is populated by their
+      :ref:`ref-tasks-populate_sysroot` task (when sharing files
+      between recipes). Exceptions include native recipes, for which the files from
+      :ref:`ref-tasks-populate_sysroot` task are instead copied to
+      :term:`STAGING_DIR_NATIVE`. Depending on the type of recipe and the build target,
+      :term:`STAGING_DIR_HOST` can have the following values:
 
       -  For recipes building for the target machine, the value is
-         "${:term:`STAGING_DIR`}/${:term:`MACHINE`}".
+         ``"${RECIPE_SYSROOT}"``, check :term:`RECIPE_SYSROOT`.
 
-      -  For native recipes building for the build host, the value is empty
-         given the assumption that when building for the build host, the
-         build host's own directories should be used.
+      -  For native recipes (building for the :term:`build host`), the value is empty
+         given the assumption that when building for the :term:`build host`, the
+         :term:`build host`'s own directories should be used.
 
          .. note::
 
-            ``-native`` recipes are not installed into host paths like such
-            as ``/usr``. Rather, these recipes are installed into
-            :term:`STAGING_DIR_NATIVE`. When compiling ``-native`` recipes,
+            Native recipe files are not installed into host paths such
+            as ``/usr``. Rather, such files are installed into
+            :term:`STAGING_DIR_NATIVE`. When compiling native recipes,
             standard build environment variables such as
             :term:`CPPFLAGS` and
-            :term:`CFLAGS` are set up so that both host paths
+            :term:`CFLAGS` are set up so that both :term:`build host`'s paths
             and :term:`STAGING_DIR_NATIVE` are searched for libraries and
             headers using, for example, GCC's ``-isystem`` option.
 
@@ -10210,16 +10210,15 @@ system and gives an overview of their function and contents.
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
+            (the :term:`build host`'s root) play the role of :term:`STAGING_DIR_HOST`
+            makes conceptual sense for native recipes, as they make use
+            of the :term:`build host`'s headers and libraries.
 
    :term:`STAGING_DIR_NATIVE`
-      Specifies the path to the sysroot directory used when building
-      components that run on the build host itself.
+      Specifies the path to the recipe's input sysroot directory, populated with
+      files provided by native recipes (recipes building components that
+      run on the :term:`build host` itself).
 
       The default value is ``"${RECIPE_SYSROOT_NATIVE}"``,
       check :term:`RECIPE_SYSROOT_NATIVE`.

-- 
2.43.0


