Return-Path: <aatrapps@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3EBBC43334
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 18:31:48 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.1858.1656441107892351442
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jun 2022 11:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dN1ZtMwe;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: aatrapps@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id cu16so21334301qvb.7
        for <docs@lists.yoctoproject.org>;
 Tue, 28 Jun 2022 11:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hDZHv/ZsUhS2tC+g3V5xg9i2AelHb6JEBy/Er9HrApI=;
        b=dN1ZtMweO7MXreO4fuAlBgXd4/3EFbPUZeUC+BRzXbcdgNsVDSAbKH5BiNbrKsyUB0
         032D0u8zxbBX6QAx8juzxRD5R9+cAObOccIBKgtaZwQL1wN7XkIXoac3+GYIb6S0u3Yz
         57ETFLorrblE08po0xy6TZYGvYWatwa/rIURykRqTDpvRuhzz6UNg7XkH9NpbZtaB1Ei
         ibWXDE2n3ddlwzTw/7o3rBn492YCv0VKWs8TCK1U36pIe14v6NxAnEWtTVlAKaTy4kYY
         JVxJqa6PH6Efvn6Vdoh8M7qLNIN7RcJ7hbrIt66rf7eZ3YE+Bbz3JS6+SpaVNAZ8MfEL
         W+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hDZHv/ZsUhS2tC+g3V5xg9i2AelHb6JEBy/Er9HrApI=;
        b=T8uE6KJvrIRQlt/8bgI9rvgEoE7QwhlXQ3N3ppA4XPmcBEE6aSUknGVgrXNzeeatXI
         kuqoHSDtusATW3SWS/uO90hJk4+C6p8ml1nmUzaRFJENXY0EVwgW+zhpgi4Jmo6J0iZi
         n3lJ7dUYW55Z7zOq1zaBj0O3kgZwWaUl+ssZIHVQFvLkqjbn5TtlnvZ01kmJBNMnHmdY
         UeAtmivnprzhffMUbz05Pr4AfWbB4fK+K+0rTZQgT56LT9xpiB+MyCb2KcIFsB3KImnT
         QCPG44O5J5IE4Vm8nTS6f977mYigKctGvwtEjO8+68wktshmJ9LcqqXqD80kdFS1WiJa
         0wKA==
X-Gm-Message-State: AJIora9BNUUAxqvv8Vz9d/XgioB6ttrQkaNtOP2UoTGvjZf7N/8YaSfa
	fnUPtz+pG1sENWbr1QQXWfM7Xj/gVMs=
X-Google-Smtp-Source: 
 AGRyM1uxosxXDyGgZ8971U3kadTEsP4AsyEveZCVaV1uAOO1dDjXDRzu2ZhunQpmd+r9SC0344Ch6w==
X-Received: by 2002:a0c:80c4:0:b0:472:91eb:2353 with SMTP id
 62-20020a0c80c4000000b0047291eb2353mr2502932qvb.12.1656441106689;
        Tue, 28 Jun 2022 11:31:46 -0700 (PDT)
Received: from localhost.localdomain (ool-4578ffd8.dyn.optonline.net.
 [69.120.255.216])
        by smtp.gmail.com with ESMTPSA id
 h15-20020a05620a244f00b006a684c87f4bsm12813140qkn.68.2022.06.28.11.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 11:31:46 -0700 (PDT)
From: Aatir Manzur <aatrapps@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Aatir Manzur <aatrapps@gmail.com>
Subject: [PATCH] docs: add CONVERSION_CMD definition
Date: Tue, 28 Jun 2022 14:31:43 -0400
Message-Id: <20220628183143.31627-1-aatrapps@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jun 2022 18:31:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3040

Signed-off-by Aatir Manzur <aatrapps@gmail.com>
---
 documentation/migration-guides/migration-2.2.rst | 2 +-
 documentation/migration-guides/migration-2.4.rst | 2 +-
 documentation/migration-guides/migration-3.4.rst | 2 +-
 documentation/ref-manual/variables.rst           | 9 +++++++++
 4 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/documentation/migration-guides/migration-2.2.rst b/documentation/migration-guides/migration-2.2.rst
index fe7bc2cf5..16e48cc87 100644
--- a/documentation/migration-guides/migration-2.2.rst
+++ b/documentation/migration-guides/migration-2.2.rst
@@ -442,7 +442,7 @@ The following miscellaneous changes have occurred:
 -  :ref:`ref-classes-image`: Renamed COMPRESS(ION) to CONVERSION. This change
    means that ``COMPRESSIONTYPES``, ``COMPRESS_DEPENDS`` and
    ``COMPRESS_CMD`` are deprecated in favor of ``CONVERSIONTYPES``,
-   ``CONVERSION_DEPENDS`` and ``CONVERSION_CMD``. The ``COMPRESS*``
+   ``CONVERSION_DEPENDS`` and :term:`CONVERSION_CMD`. The ``COMPRESS*``
    variable names will still work in the 2.2 release but metadata that
    does not need to be backwards-compatible should be changed to use the
    new names as the ``COMPRESS*`` ones will be removed in a future
diff --git a/documentation/migration-guides/migration-2.4.rst b/documentation/migration-guides/migration-2.4.rst
index ef5f32e6e..964ed9293 100644
--- a/documentation/migration-guides/migration-2.4.rst
+++ b/documentation/migration-guides/migration-2.4.rst
@@ -301,7 +301,7 @@ The following are additional changes:
    likely be removed in the next Yocto Project release.
 
 -  The ``vmdk``, ``vdi``, and ``qcow2`` image file types are now used in
-   conjunction with the "wic" image type through ``CONVERSION_CMD``.
+   conjunction with the "wic" image type through :term:`CONVERSION_CMD`.
    Consequently, the equivalent image types are now ``wic.vmdk``,
    ``wic.vdi``, and ``wic.qcow2``, respectively.
 
diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index 8db43a145..c600129ec 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -252,7 +252,7 @@ Miscellaneous
 
 - The previously deprecated ``COMPRESS_CMD`` and
   ``CVE_CHECK_CVE_WHITELIST`` variables have been removed. Use
-  ``CONVERSION_CMD`` and ``CVE_CHECK_WHITELIST`` (replaced by
+  :term:`CONVERSION_CMD` and ``CVE_CHECK_WHITELIST`` (replaced by
   :term:`CVE_CHECK_IGNORE` in version 3.5) respectively
   instead.
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8f7b01c12..bc59b574d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1297,6 +1297,15 @@ system and gives an overview of their function and contents.
       the recipe will be skipped, and if the build system attempts to build
       the recipe then an error will be triggered.
 
+   :term:`CONVERSION_CMD`
+      This variable is used for storing image conversion commands. 
+      Image conversion can convert an image into different objects like:
+      - compressed version of the image
+      - checksums for the image
+      An exmple of :term:`CONVERSION_CMD` 
+      from :ref:`image-types <ref-classes-image_types>` class is:
+      CONVERSION_CMD:lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+
    :term:`COPY_LIC_DIRS`
       If set to "1" along with the
       :term:`COPY_LIC_MANIFEST` variable, the
-- 
2.31.0


