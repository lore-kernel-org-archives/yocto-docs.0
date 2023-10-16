Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8354CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 17:12:11 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.132796.1697476324194409966
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 10:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H0eEW1sq;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: bhstalel@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9becde9ea7bso447437166b.0
        for <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 10:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697476322; x=1698081122; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+qqjPjvilrrkyfpcLBmajsw93JjI2pUZxXp7ZVQZYAQ=;
        b=H0eEW1sq7lVz9m+NNw6Sq8azZf+xIYyEUVPaDLy6A8R1DKyZW2vN8MnCjnEAkJj7/2
         xJlJPz4kWj0+Q1kVz4TxwwxdoI84TOGCKhtskNIickP70FGWauHz/YRlQfjH5BCPxIAT
         kVfxJaDZviDl+KEX8FeX0E8/ap53523ePKM98xFYf80DKx87fT4uk/yXkZhYtjH3oBnS
         AFby++VKzI6BjnxDQJWDaQDp839a0OuHp0kSm5ewpwHqixFFudD2jxDdnYsG//YfrE8z
         DQRqL8QyQmK4u9XZ2eVaifcjbXnraqGqwffIjQO7UdYsdJaSwoRUGD5TCrtTo6AqEtAd
         ON6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697476322; x=1698081122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qqjPjvilrrkyfpcLBmajsw93JjI2pUZxXp7ZVQZYAQ=;
        b=Ed8TD/pVCKK8g++TQbU9E+347IWX3qMZF3bLKJ6Y+Zg1EACJS8IKB0iyeTKm85PnZE
         t5Dg/yjSocYF2BSny8CtzH+TmuNY5EvYgQ72qE4/mSMn+pt37HtOJqyPd+lZaU/amC0O
         pKzIt/poNiMGUQ/8U3YLLw37Dturz0vbq17pS1StvlrLF/KTIzkbYp2L0XvnpCPc5NGb
         +Kbod4H3ZFT3xWfrz8itCfLW5MkEl1ewrJZmAsNDg3DRqhE6QtkLJJhFYkb9Rq7zow4R
         uq1gGIZ8oweNG55tVYy9TTJvWzmfZGhoJnVL6+d8V6WDBhHc0RmDN9lorAzUiw2K/j9j
         j9tA==
X-Gm-Message-State: AOJu0YxSY7iEJcYJbIorkrHNpxC9X9mNiD8G7DHoBzy8hhpXknZk0gn7
	5FRirsO6awnTvSHFNtdxBvvyvNClXc0=
X-Google-Smtp-Source: AGHT+IHuzKAsChrJTvOSWTIKPgYEdG20RqxNtiUnyOSz5gCVKsFUigaQyxauMe57XREJg0SY/cjV0Q==
X-Received: by 2002:a17:907:3da5:b0:9b2:bcea:e517 with SMTP id he37-20020a1709073da500b009b2bceae517mr67645ejc.10.1697476322050;
        Mon, 16 Oct 2023 10:12:02 -0700 (PDT)
Received: from talel.sofia.local ([193.95.99.58])
        by smtp.gmail.com with ESMTPSA id u6-20020a1709064ac600b00991d54db2acsm4344489ejt.44.2023.10.16.10.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 10:12:01 -0700 (PDT)
From: Talel BELHAJSALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [PATCH] ref-manual: Fix PACKAGECONFIG term and add an example
Date: Mon, 16 Oct 2023 18:11:53 +0100
Message-Id: <20231016171153.3075747-1-bhstalel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 17:12:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4383

PACKAGECONFIG's first and second flag value will be added to PACKAGECONFIG_CONFARGS
and then it will be added to the appropriate variable (EXTRA_OECMAKE, or ...)
So we need to only mention PACKAGECONFIG_CONFARGS and it will lead to other variables.

I added a custom example that can help understanding very well PACKAGECONFIG.

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
---
 documentation/ref-manual/variables.rst | 40 ++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 11523bb9e..2f286d26c 100644
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
+      in which :term:`PACKAGECONFIG` is used to transform the systemd service
+      into a feature that can be easily enabled or disabled via :term:`PACKAGECONFIG`::
+
+         example.c
+         example.service
+         CMakeLists.txt
+
+      The ``CMakeLists.txt`` file contains::
+
+         if(WITH_SYSTEMD)
+            install(FILES ${PROJECT_SOURCE_DIR}/example.service DESTINATION /etc/systemd/systemd)
+         endif(WITH_SYSTEMD)
+
+      In order to enable the installation of ``example.service`` we need to ensure
+      that `-DWITH_SYSTEMD=ON` is passed to the ``cmake`` command execution.
+      Recipes that have ``CMakeLists.txt`` generally inherit :ref:`ref-classes-cmake`, that runs ``cmake``
+      with :term:`EXTRA_OECMAKE`, which :term:`PACKAGECONFIG_CONFARGS` will be appended to.
+      Now, knowing that :term:`PACKAGECONFIG_CONFARGS` is automatically filled with either
+      the first or second element of :term:`PACKAGECONFIG` flag value, the recipe would be like::
+
+         inherit cmake
+         PACKAGECONFIG = "systemd"
+         PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF"
+
+      A side note to this recipe is to check if ``systemd`` is in fact the used :term:`INIT_MANAGER`
+      or not::
+
+         PACKAGECONFIG = "${@'systemd' if d.getVar('INIT_MANAGER') == 'systemd' else ''}"
+
    :term:`PACKAGECONFIG_CONFARGS`
       A space-separated list of configuration options generated from the
       :term:`PACKAGECONFIG` setting.
-- 
2.25.1


