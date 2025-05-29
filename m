Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9D7C54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 03:23:13 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.12891.1748488980134462916
 for <docs@lists.yoctoproject.org>;
 Wed, 28 May 2025 20:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TfxoyAAM;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: dixitparmar19@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234c5b57557so5024635ad.3
        for <docs@lists.yoctoproject.org>; Wed, 28 May 2025 20:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748488979; x=1749093779; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uwsj4JX7RmTayN0r2hLV9HJFK27PacTRxFb7INSU1aQ=;
        b=TfxoyAAMvvnmkbwqGk1q4wQUpDSHaJOJ+iY9Io5u27pMEahF7Q9ooHgatawSyH4VJS
         h5kZ0DjNZWFWr2HVc9uQfKZ+A+G0G37bTeyTF6L84lZWKj9T59Ytzp14QBJyCeRGop/l
         R7FTHJwbXo55GCX8dnuzaB5L13v5RcFdXf6C4eVcoKRhZhbPz1k8A8T2F6/9sTSRNSy8
         qM8xJHSEMQLzCkY2o5fyZzSFbehNMVSVHrWaHxgE1lCrTxUXfFJz2C+bSG8ksP3MANCT
         4brM/k91KT9MFMpPetTEWSVtk58e0vY4wzuBooOi10AOvNWTTQYiLRP5lgkU6M9iIuad
         UtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748488979; x=1749093779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwsj4JX7RmTayN0r2hLV9HJFK27PacTRxFb7INSU1aQ=;
        b=ryoAzydCLuM7SeFTcU/MsNn2G+Jod+pecXkeP1qNoOg8FJ+w2GE41cZqAm2AmrhVYU
         EBGlJzIM5A7agv5oAhQIFqMUDOyDguv7dA56cm1neKY9csjycms6tCOmf38npVJiQxGH
         ueIr8ZS/A2zrrY5zXzHGsKGCOGmzZxN7Po8fu4h16FRhYIzyM/6+xsDMkHwCbYw5bOuP
         UDRpBH1pGHhlpXMFVPjk0uz9PNJiG7zxGv9ZEpSetBKF4aQuKAkXW19IfvTY0lCfLQNL
         rqwnFUbIcCTooRjDGTlUCs3QT4rH51PyHvlSlDagvpVmqgJOoPmtVEiB5fLSbxYqdpiB
         L3yw==
X-Gm-Message-State: AOJu0Yxa9myzwYKRMaMK9xX4+x3SpNU1BYe+9GwkG/5nw3w/3ZiWktR7
	YMFiasoYmVeP9OK2ZR1T0Erf6J9SVOeMYBXGROzWQ/XCbDZGSXTJw90KoxZp6A==
X-Gm-Gg: ASbGncsvytFm3p09TB8ttF8KkAd7vRBJPhgUvwM87R7yRnInPvJVze5LAT4M8+0+msK
	/tDvPkbloOazoAjehE3b8cfajdXp3iTbVbtxCJ2M8350REDy4YULhmepRZlImQjlvlRmGxSJNYz
	/uABjNTsLvJDDqq5bRwFYKfcGQ8WW0zPwmpVBYVb26OSdXfqMatQlvjqg1BrZqfxmeh2IIypB0S
	goqSvZdkSdHKAAhr54MJAgq+18yuKRavZcJoZ2Pf4kompRs3yym3Dwa8kWsVTtpzfOBc4pVS+dE
	cz1bW3yKd0kn3B3LSH34wRxpiyMMCupB/1hfuvn7w7XIgIIzxCWRYyA=
X-Google-Smtp-Source: AGHT+IG1JuK7C3HVtvj0E5AkGq6UNyoNX+eM6+RSpoRm7HSppV2GDnyq84Vu4Dsm2bTL8fCzBAkCow==
X-Received: by 2002:a17:902:db0f:b0:234:d1f2:da19 with SMTP id d9443c01a7336-234d1f2db04mr65075835ad.13.1748488979369;
        Wed, 28 May 2025 20:22:59 -0700 (PDT)
Received: from dixit.. ([2401:4900:1c44:de23:aba1:783f:492b:e28b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf5411sm3136885ad.188.2025.05.28.20.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 20:22:58 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Dixit Parmar <dixitparmar19@gmail.com>
Subject: [PATCH 1/1] documentation: add doc for KERNEL_SPLIT_MODULES
Date: Thu, 29 May 2025 08:52:52 +0530
Message-ID: <20250529032252.340015-1-dixitparmar19@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 May 2025 03:23:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6947

Add the missing documentation for the KERNEL_SPLIT_MODULES variable.

[ YOCTO #15771 ]

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 meta/conf/documentation.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 3dd7bce515..4c8becbdc2 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -252,6 +252,7 @@ KERNEL_MODULE_AUTOLOAD[doc] = "Lists kernel modules that need to be auto-loaded
 KERNEL_MODULE_PROBECONF[doc] = "Lists kernel modules for which the build system expects to find module_conf_* values that specify configuration for each of the modules"
 KERNEL_PACKAGE_NAME[doc] = "Name prefix for kernel packages. Defaults to 'kernel'."
 KERNEL_PATH[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
+KERNEL_SPLIT_MODULES[doc] = "Allow opt-out of split kernel modules. Default set to 1, one subpackage per module. Setting it 0 will generate a monolithic kernel-modules package containing all modules built from the source."
 KERNEL_SRC[doc] = "The location of the kernel sources. This variable is set to the value of the STAGING_KERNEL_DIR within the module class (module.bbclass)."
 KERNEL_LOCALVERSION[doc] = "Appends a string to the name of the local version of the kernel image."
 KFEATURE_DESCRIPTION[doc] = "Provides a short description of a configuration fragment. You use this variable in the .scc file that describes a configuration fragment file."
-- 
2.43.0


