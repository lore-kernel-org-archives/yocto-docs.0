Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EA7C41513
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 06:50:08 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.112080.1697439000893320904
 for <docs@lists.yoctoproject.org>;
 Sun, 15 Oct 2023 23:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DPZoDQN4;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: bhstalel@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4054f790190so45105465e9.2
        for <docs@lists.yoctoproject.org>; Sun, 15 Oct 2023 23:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697438999; x=1698043799; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0XpPp1yOJtpyWexmQTzLat9JdgNfn3JIbbhRPyAXTuM=;
        b=DPZoDQN4MTWF56yttu2Mz59lpnHHuG7J3HYMm2Cm1wyv/s9sqI5RIUMKjx7Si90Vng
         htp6IBx6esEfU9tpAEJgbLxIa4QLQKjj4X36hvwf3xcr9m0WSrFFSqzOOCBDQzzYC7Tj
         NkdRT47Fi+WUxMvwy5wRMegJ6NGtp0wrb6JDZ0724auLVjdqs9roRXPBPI2ncGXUI6ED
         QCMsAJRoHQJO0TBBezNjvkYdvA/c0vPzmcdCgnKNhgN1uRZLKEAunLNWqhWm+peah2H/
         Ba1HURtvdeDPRPb89XR0FHW0Zm60n8TUnUi5P7BL7V+p4nacUS3pI+8EU5jhsMBPaQK3
         yXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697438999; x=1698043799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XpPp1yOJtpyWexmQTzLat9JdgNfn3JIbbhRPyAXTuM=;
        b=MkSnXCWzfGVrLmMzK3VTbSW3AoCriY570gXy4JzqUxdgJJcNIz1lg7V0RPhXPX/m5x
         BS83YOgUgHjWE3qe/KjVn1pt2jksB6hRDMn4859rP3hRBxsNzmI78WyZFECS8CJ4Hu1E
         Htw5FzDpMKaPvmiACiIzSflwcDyQwXCbldsqY7TJ4+VaxytODWapG9cFpCgBx0hPfOuv
         CtRlKWcjVViogrTgGtGWtwDD9D4yGF7SWFyJRWw/FAZ6KPkLhc5EmxFVHCWTOqauYLOb
         npKCpATLodqudIbPC8Eh3+sJnG0M3o1LszQBcslXFNwDAaRXg6Eqk5It7z7IMPUg2Lnq
         yvSw==
X-Gm-Message-State: AOJu0Yzh35jtRCAY0Yl2svIn2bwjVQrqwefBtO6Cx5uHv1roDrP1V25j
	CkDUXmVAedgYeJtdsuQZGOD2gOxLP3k=
X-Google-Smtp-Source: AGHT+IGEn/eMcbr22UjXN6k9L9HQpx50+KWQx12+kJbXrwZcCT0I+YNZtqzzR1o5qPIXe4sxw0xKsA==
X-Received: by 2002:a05:6000:1d94:b0:32d:8094:f4c8 with SMTP id bk20-20020a0560001d9400b0032d8094f4c8mr14088219wrb.19.1697438998907;
        Sun, 15 Oct 2023 23:49:58 -0700 (PDT)
Received: from localhost.localdomain ([197.27.115.232])
        by smtp.gmail.com with ESMTPSA id d7-20020adfef87000000b0032db4e660d9sm1583254wro.56.2023.10.15.23.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 23:49:58 -0700 (PDT)
From: Talel BELHAJSALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [PATCH] Update PACKAGECONFIG term and add custom example
Date: Mon, 16 Oct 2023 07:47:14 +0100
Message-Id: <20231016064714.3038862-1-bhstalel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 06:50:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4373

PACKAGECONFIG's first and second flag value will be added to PACKAGECONFIG_CONFARGS
and then it will be added to the appropriate variable (EXTRA_OECMAKE, or ...)
So we need to only mention PACKAGECONFIG_CONFARGS and it will lead to other variables.

I added a custom example that can help understanding very well PACKAGECONFIG.

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
---
 documentation/ref-manual/variables.rst | 40 ++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 11523bb9e..c52271e8b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6059,13 +6059,11 @@ system and gives an overview of their function and contents.
       omit any argument you like but must retain the separating commas. The
       order is important and specifies the following:
 
-      #. Extra arguments that should be added to the configure script
-         argument list (:term:`EXTRA_OECONF` or
-         :term:`PACKAGECONFIG_CONFARGS`) if
-         the feature is enabled.
+      #. Extra arguments that should be added to :term:`PACKAGECONFIG_CONFARGS`
+         if the feature is enabled.
 
-      #. Extra arguments that should be added to :term:`EXTRA_OECONF` or
-         :term:`PACKAGECONFIG_CONFARGS` if the feature is disabled.
+      #. Extra arguments that should be added to :term:`PACKAGECONFIG_CONFARGS`
+         if the feature is disabled.
 
       #. Additional build dependencies (:term:`DEPENDS`)
          that should be added if the feature is enabled.
@@ -6123,6 +6121,36 @@ system and gives an overview of their function and contents.
 
             PACKAGECONFIG:append:pn-recipename = " f4"
 
+      Consider the following example of a :ref:`ref-classes-cmake` recipe with a systemd service
+      in which :term:`PACKAGECONFIG` plays a good rule to transform the systemd service
+      into a feature that can be easily enabled or disabled via :term:`PACKAGECONFIG`::
+
+         example.c
+         example.service
+         CMakeLists.txt
+
+      The `CMakeLists.txt` file contains::
+
+         if(WITH_SYSTEMD)
+            install(FILES ${PROJECT_SOURCE_DIR}/example.service DESTINATION /etc/systemd/systemd)
+         endif(WITH_SYSTEMD)
+
+      In order to enable the installation of `example.service` we need to ensure
+      that `-DWITH_SYSTEMD=ON` is passed to the `cmake` command execution.
+      Recipes that have `CMakeLists.txt`, generally, inherit :ref:`ref-classes-cmake`, that runs `cmake`
+      with :term:`EXTRA_OECMAKE` which :term:`PACKAGECONFIG_CONFARGS` will be appended to.
+      Now, knowing that :term:`PACKAGECONFIG_CONFARGS` is automatically filled with either
+      the first or second element of :term:`PACKAGECONFIG` flag value, the recipe would be like::
+
+         inherit cmake
+         PACKAGECONFIG = "systemd"
+         PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF"
+
+      A side note to this recipe is to check if `systemd` is in fact the used :term:`INIT_MANAGER`
+      or not::
+
+         PACKAGECONFIG = "${@'systemd' if d.getVar('INIT_MANAGER') == 'systemd' else ''}"
+
    :term:`PACKAGECONFIG_CONFARGS`
       A space-separated list of configuration options generated from the
       :term:`PACKAGECONFIG` setting.
-- 
2.25.1


