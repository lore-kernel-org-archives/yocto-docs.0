Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BEF1073CB4
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 13:05:46 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105732.1775653542416131309
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Apr 2026 06:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AwOPSpy0;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66c17372965so11642711a12.1
        for <docs@lists.yoctoproject.org>; Wed, 08 Apr 2026 06:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775653541; x=1776258341; darn=lists.yoctoproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8CT4MSw/cez2MBpf40u1n11Y1qX9oYfP8rQ93P8yKs=;
        b=AwOPSpy0jj5s6sa+rRV4MjHIthqBGM7zzPUDMFaLKbM8fXo6AcKzlR1I2i3HkFErEE
         HZp/JVqM+oo7A8ixAn5ZmOSIzj/DoMnOCcjxwCH14mZVfXwtclmydWya6rsaLI7BfqFZ
         1ZqmZMVa6Is+QPTBOdL6wRgtwIhIuzb/EwHPrGd4xkvNwdNH2MjQgMxYGCgo/vRmgIoU
         +Q/NhEqeeZr2SLD9qduL08zrJjhS9aXywNbiaZBdPDFyzxnLZS0RUrSzbgnpZ8sogfjr
         JwuLHr4oYKamIJr/jbHzYFvLx1vaLZIq2Tx4w92s2TlEodeHo0ekF56UNDMivMpWH6qt
         c/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775653541; x=1776258341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p8CT4MSw/cez2MBpf40u1n11Y1qX9oYfP8rQ93P8yKs=;
        b=nSvK1jQG2ZPaqFVaZIhOBaXwAm3Nov1UhELhEUY1q4QTAinSsAmjNZl7o95Hwy/6YS
         qMjOxIoNJeZM/wRjDSaz11ckftBa0bMqlWF29uWUnFZRGOg1kNXavhbRZ11WY1nBM4n7
         NQ+xAISCSq02J8bE3Gy7nib/ZHypAvFVWFnDdHl7boStK5z2ck5iCoy7tRAYJo402dj+
         rgqlkZBr1K6uhtsshnxxe+XBrrr3nyclqtLg0UMfPn4wnbEy0BL9b2BymF8T3f6Ek0fX
         VXSgNMAzAmB+JLQnCmQ4GOpMyuWZKsiqobsf517cYUSxcGK/y6HpA20c91hI+grUfRw5
         xuiQ==
X-Gm-Message-State: AOJu0YxajoqLrCepUgmLaADY/e5/BOQUENU/n5H0M2zJBIYhw3hr3nTF
	VDNN2hEml3bzQjBYakYu6gfmorUI+ljC1eTGw087zzOXEe6XS0JAA/hU66SB+Q==
X-Gm-Gg: AeBDiesTW37k5A+73zLslcuPf+PGdIqczaWzA6FcFynItAjXmAaWkUsPUJhjnijy9O4
	7d+2ux1dtEZ/kGvwkuwP8TI2NQwqR9nTZKAjG6dvx/PI6QXX4OtYM3cZDkoTR1YTozRDs5cGNFl
	8A2lxLj4/FnylGYgp3dDZtRiKhmp0f+cSf98nzM30KuMo7h1S70/vlJ4vvnQi16ikD+g4kiQwF/
	WnxrEYNKd+aZLg25vN29SwErp+5qNO96dd6LmlUvo+Jm1q5N2yxZktuBFPwyzYkP/NysyzrsTvh
	6QvFopdhm0JfAMKlS6nku7qSNEm/atsGc2dloZmG9Z/Dq04EGmufL5pstXwqGRMZ0l5+cT9G83Q
	dKdo6BI5GMNM5VUKr+wKcfjTBX0JIU+ZX1ZJvO/5qC8e8BeRLCA4l0wtu/xHDIt2qfwZi/vord8
	MYGRtfCcc4ngshwyjLdO5T5lucg+oGzQ==
X-Received: by 2002:a17:907:3e25:b0:b9c:5672:852 with SMTP id a640c23a62f3a-b9c67a2e990mr1113730266b.40.1775653540638;
        Wed, 08 Apr 2026 06:05:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:dab4:c153:72eb:4100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca94715sm656643166b.21.2026.04.08.06.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:05:40 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Wed, 08 Apr 2026 15:05:29 +0200
Subject: [PATCH 5/6] ref-manual/variables.rst: update STAGING_DIR*
 descriptions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-staging_and_packaging_vars-v1-5-387f482308e5@gmail.com>
References: <20260408-staging_and_packaging_vars-v1-0-387f482308e5@gmail.com>
In-Reply-To: <20260408-staging_and_packaging_vars-v1-0-387f482308e5@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775653534; l=4634;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=6ioe3m5Ek/2wMrtiSZ34Su86Got8GxR8CEd5FDskwFE=;
 b=kj7ikMR2Qz9XSpH8YlOrSfuje2jhdLlwZJah0E+wCRAsPO2P9ZyLUab1qiJLOzGocFFJ8e8xX
 0Q6ZNd/mbN9DPCcguP5KlGaD+VByvLfb2CciLCt6cdKBVg8bn7Ku3os
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Apr 2026 13:05:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9204

Slightly reword to emphasize the sysroots' roles during the build.
Drop double back-quote from the uses of '-native' to make it a bit
easier on the eyes.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 documentation/ref-manual/variables.rst | 45 +++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index aa142a701..67176917c 100644
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

-- 
2.43.0


