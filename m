Return-Path: <johan.korsnes@remarkable.no>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974E5C38145
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 16:14:36 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web10.1177.1662653670579554323
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Sep 2022 09:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@remarkable.no header.s=google header.b=KGVdHxRn;
 spf=pass (domain: remarkable.no, ip: 209.85.208.195,
 mailfrom: johan.korsnes@remarkable.no)
Received: by mail-lj1-f195.google.com with SMTP id l12so12079510ljg.9
        for <docs@lists.yoctoproject.org>;
 Thu, 08 Sep 2022 09:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=InFLV9fD4Uu5JvDBsuDdJRw814iyv7/N5HYJLwx3PGs=;
        b=KGVdHxRnRnmFKEU6VDR8F3A0GmR6yHjVrvlguTP9GLX9OpOeAw6fwZqT6jilQRVS+n
         pdkgyNgBxc/b3Dy9wHWUh4LAvq/HyXOzFQaF2BSKoS63gi/UG3etUIZU9GYm1RcN/ray
         skpFCO3770o5MIHtzHtJjQutqVnAv4bTqSsZVDRkxGeLxC6Gd3VsAIY8zCJDr/XqNBdW
         W1Pxh0+4exOcKjcisCKhCfaLsjodG1Cx82yNHEkAQYx1g9yhA82o4u2RB9M2OhhFwIrv
         AaVsxNeWHCW53a6tiBMHnAHbDZeqck9QFtzKqmCMZbtrWJqq6y9PprZW5bV4HygsioQ8
         SASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=InFLV9fD4Uu5JvDBsuDdJRw814iyv7/N5HYJLwx3PGs=;
        b=vPVCY1CO+umdm7Yx9v7aME7a9oDTp1jTZqUZ5wLf/pEAV0WV9Z5xxiNhJiNhA0qL+Q
         BxrGFS1ZcDuKkcmcjf+c2qQy4YppiWWwdZOWkAEXOiAIP7twfTTzTeAofwXYOgbb8Bj6
         j3D33sgA0EWQMWjkJpFP4EmT3McUsnLQ4iaEo+iSH7fYF0iYsouwY6A+nZElGjCmshI/
         r9Sxr7xGyr9zNTYNCVUBz5iufeSIt/Wq6+pdd96yces35pHogZQQ8yngwn1oJ/Of1pkt
         u3tIZ18uHkc5OEU5yRLt/YxpiyFUY/B5gK8Vp4sVizv+4fwYK9Djcsm8cJq9FCzTbeJJ
         HPWw==
X-Gm-Message-State: ACgBeo1A/0PZbj+bA9WtaKPp/RAS65KoDFgy97o4n8RO5ORCdjJCCuxP
	JBDkNP7h23/LMMqus+fpKPBtHQdNHYT9iBg=
X-Google-Smtp-Source: 
 AA6agR4qrLpjPStw9ViMkU5/4j+X5MYNc1nIVdjN3M+DDiUKuyRYr+Pcf3ELvK+aBIt8Ae71iIr+7A==
X-Received: by 2002:a2e:804a:0:b0:26b:66d3:4d51 with SMTP id
 p10-20020a2e804a000000b0026b66d34d51mr1403237ljg.293.1662653668205;
        Thu, 08 Sep 2022 09:14:28 -0700 (PDT)
Received: from localhost.localdomain ([2a01:799:a1c:800:7e39:cdac:b50:465a])
        by smtp.gmail.com with ESMTPSA id
 c21-20020a056512239500b00498f23c249dsm202871lfv.74.2022.09.08.09.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 09:14:27 -0700 (PDT)
From: Johan Korsnes <johan.korsnes@remarkable.no>
To: docs@lists.yoctoproject.org
Cc: Johan Korsnes <johan.korsnes@remarkable.no>,
	He Zhe <zhe.he@windriver.com>,
	Ross Burton <ross.burton@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] ref-manual: variables: document KERNEL_IMAGETYPES
Date: Thu,  8 Sep 2022 18:13:33 +0200
Message-Id: <20220908161333.96614-1-johan.korsnes@remarkable.no>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 08 Sep 2022 16:14:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3146

Cc: He Zhe <zhe.he@windriver.com>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Johan Korsnes <johan.korsnes@remarkable.no>
---
 documentation/ref-manual/variables.rst | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index cf817e954..59a474f30 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3984,11 +3984,10 @@ system and gives an overview of their function and contents.
 
          KCONFIG_MODE = "alldefconfig"
 
-
    :term:`KERNEL_ALT_IMAGETYPE`
       Specifies an alternate kernel image type for creation in addition to
-      the kernel image type specified using the
-      :term:`KERNEL_IMAGETYPE` variable.
+      the kernel image type specified using the :term:`KERNEL_IMAGETYPE` and
+      :term:`KERNEL_IMAGETYPES` variables.
 
    :term:`KERNEL_ARTIFACT_NAME`
       Specifies the name of all of the build artifacts. You can change the
@@ -4174,7 +4173,13 @@ system and gives an overview of their function and contents.
 
       If you want to build an alternate kernel image type in addition to that
       specified by :term:`KERNEL_IMAGETYPE`, use the :term:`KERNEL_ALT_IMAGETYPE`
-      variable.
+      variable. For additional kernel image types, use the
+      :term:`KERNEL_IMAGETYPES` variable.
+
+   :term:`KERNEL_IMAGETYPES`
+      Lists additional types of kernel images to build for a device in addition
+      to image type specified in :term:`KERNEL_IMAGETYPE`. Usually set by the
+      machine configuration files.
 
    :term:`KERNEL_MODULE_AUTOLOAD`
       Lists kernel modules that need to be auto-loaded during boot.
-- 
2.37.3


