Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDA4C5AD49
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 10:45:17 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.35177.1749379516151139619
 for <docs@lists.yoctoproject.org>;
 Sun, 08 Jun 2025 03:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZAfRyaa4;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: dixitparmar19@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af908bb32fdso2288094a12.1
        for <docs@lists.yoctoproject.org>; Sun, 08 Jun 2025 03:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749379515; x=1749984315; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I7w593dyI3WwGOrYMzyl77dkBJbY/gG7A7xo75oLtkU=;
        b=ZAfRyaa4+2heiyFDhA/Aa+BsB73fgaHTjDiF05/rgQSkA4gE8yPURZgBSXZNzP6z63
         rMMnDxW9vsf3jzItPIRnK+0rxrMDK35il24o/NbTj5Zpp7ML61xED385HQnMb2OFapSc
         M/8hHD3PitjaM0Pp8CTjMEFxvUYs0tsOQ8SC4Wm5x5RN9WFqmfpK/x0e1mqcihfJkWec
         k7DC7pgOdX7JtYb6SUuc6ken134tajP45DxaN3l+wOBSHFfZ99pUmUVNNWoPcWrrrehG
         B6LzSvmmepvcxgGake6YQ7VK7m+vxaFCZ17pAZUGhm9gYcfcGLfC+9+gTIdyQZ8KkhYN
         YYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749379515; x=1749984315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7w593dyI3WwGOrYMzyl77dkBJbY/gG7A7xo75oLtkU=;
        b=jFiRBA0qfGrUvkpTM4C7lp0hWu/7F8aQ0KN66kPtCI2Cpjqhx9qvGwq0w06jcfQ2Gi
         LF3K8VzvwTwzXFVPRTh5PWyo9ca+X55yMb2C6e15dCjLA5nHFN21AKRBxWLGrWvEsQsF
         /kRswiNScxmVltoXKwP3OVAygMjSiKRgNY3SKcjjqZWU28FtoIU7TBUrpitRg6g3FIvt
         sA6Ah0hxm9iPd1C2XVtrYV212uY1FX0rCFtRvkby75L09kA/Stw3oUWrKsn9CPXS2oUr
         vknKc+Yby3WVd81rakallIRjN+et9ivg6ND6dWIgpoGDJrJf8hpH/g1Zshi4WDTEBsCt
         BgdA==
X-Gm-Message-State: AOJu0Yw2h64Q8Lb4CcN2JLMeE7K+9eKZElN5KePVCdNsC8gt/bYUFRf/
	DJgON7lyM8x87SbSOva5QQEpRQ7zR0ThpKSH94LM2znWv0ftoxY2HmTqciUIyw==
X-Gm-Gg: ASbGncsc5G1YiPSgcpjG+9njxZ1WMiULcJgkAIRzzUM/Y1oYQ+WdqmbeAB9meSPFPoG
	d31qo/B7FV4LeQjg1zaRgNq25JiNc8MyCUqISPpu717VPy+96VuPZ3NG7JAdnyaIzd7r5t1ucXm
	TaFSkf2JqFhYP6MOy3dQwnLEpWjm5DFMRSdcIUuXhyxHAKPl52duFSkzsAW2/+18HYW37O5dMok
	mS4yTVLT2h7aXGBYEv9RwdOwUvlrAx8E/gyOvPGlTz7GFs6WVVDSd9KY/QZp2K5Gf3cSoZiV2bu
	Ds4uT8XiLy8h60a2gey14WA2KE2l0C288G2yIIJ0heSIxyOnquR9RCo=
X-Google-Smtp-Source: AGHT+IHOi+cQX7i0tQcDm7JSmc8a9k37ZTghWtQxheeIM+ok/9nkMegVSisbtZpiWACSTYQvm7qzQg==
X-Received: by 2002:a17:90b:2547:b0:311:9cdf:a8a4 with SMTP id 98e67ed59e1d1-31349f43777mr13877693a91.8.1749379514912;
        Sun, 08 Jun 2025 03:45:14 -0700 (PDT)
Received: from dixit.. ([2401:4900:1c45:df5e:ad6b:542b:f407:a12b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134968358bsm3955521a91.0.2025.06.08.03.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 03:45:14 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Dixit Parmar <dixitparmar19@gmail.com>
Subject: [PATCH v2] ref-manual: document KERNEL_SPLIT_MODULES variable
Date: Sun,  8 Jun 2025 16:14:54 +0530
Message-ID: <20250608104459.1888510-1-dixitparmar19@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 08 Jun 2025 10:45:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7032

This variable controls the kernel module spliting.

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 documentation/ref-manual/variables.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 9768d8f5b..b7dde2604 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5359,6 +5359,20 @@ system and gives an overview of their function and contents.
       the :term:`KERNEL_PATH` variable. Both variables are common variables
       used by external Makefiles to point to the kernel source directory.
 
+   :term:`KERNEL_SPLIT_MODULES`
+      When inheriting the :ref:`ref-classes-kernel-module-split` class, this
+      variable controls whether kernel modules are split into separate packages
+      or bundled into a single package.
+
+      For some use cases, a monolithic kernel module package
+      :ref:`KERNEL_PACKAGE_NAME` (by default named ``kernel``) that contains
+      all modules built from the kernel sources may be preferred. Because a
+      monolithic package can reduce download time and speed up installation.
+
+      By default, this variable is set to ``1``, resulting in one package per
+      module. Setting it to any other value will generate a single monolithic
+      package containing all kernel modules.
+
    :term:`KERNEL_SRC`
       The location of the kernel sources. This variable is set to the value
       of the :term:`STAGING_KERNEL_DIR` within the :ref:`ref-classes-module`
-- 
2.43.0


