Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72A7C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 13:55:30 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.8150.1749131723066368967
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Jun 2025 06:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c6h9XxYa;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: dixitparmar19@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234d3261631so7306245ad.1
        for <docs@lists.yoctoproject.org>; Thu, 05 Jun 2025 06:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749131722; x=1749736522; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d0ZReBYI8pP5bBQGF20tdHeUapZVf+kXSZ60ABhWFOE=;
        b=c6h9XxYaACxbdeMKaCQLZ3j8AmzmMSyqBN4AuIrW7FBm2Z+OftVra0Xzar1o30Ui13
         i0Vt+TVLgVmkic5ojWuZ0zON9Tld2bYdjvOu39HL4xOWeImp8CadcA7cNRsa3+3/YQAs
         WYymuhQX+PgLu3VPeVpvNMBFuP7nB1JO+XOJry6SREmAoueoV52eGDFS6Sx8/a2XIQZy
         v7MmThTW+3I9EVauXl7jHnSoYY2t5asH1+GwT1KBxhHjMv7vT4eOtLYVyIr2d3RPxj73
         QaaNbAFpP8+CNILz+GwzwaBSAYCurxum4CUktbEKWKK6xt3gfs8R3RGytjzVtKTEchh2
         mqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749131722; x=1749736522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0ZReBYI8pP5bBQGF20tdHeUapZVf+kXSZ60ABhWFOE=;
        b=Z4hVIWPaAa26U5KqHRiEak4AlH1oUM0DUkkCe4ue/+0MlQyWj7kOnvoQeTUoLz6PSk
         SB3nDO8KbD+Z5v3QCVFhr97D+HT8wZKwNLOfEC6RRVjYbkuaVGOZdOO23+TdQFPt7yhq
         igmtWLQnssTI4sNyaHT1Y7Olvb0DmgLgpmB3IeeFnHepFJObuMP1QQFRq6dBbRJyvkaq
         ulN/lqUzBWJkatk0KvI1qQ9LNFmddGRWcufkSUGMW61ugyvzW1OsRaYoDeXOZnc8D8sn
         Rf/srxQVS6f8wPy6uXSvjY5n3LRnE7Jx1pw2VLNd4thhasLt8DxDzvQr6zqK82cUS47u
         kGLw==
X-Gm-Message-State: AOJu0YxIQAqV5bdnaEsAtMm2I6oCLu0LAtgNtRrwAYjGYlfuNCJw6/eg
	DhX109/s1ci5I9/RisI8Aq2SZrFowO0qGNOlbAUdWTWKLAgjaMQEg7vSdmsuKw==
X-Gm-Gg: ASbGncstR/2mkHWjKpLd/jQLTLaSjcgzNDdBeMTU51+p1MgHypxE5OWwB6T2kuPsiDj
	4yZAFOMp0oqVhe71hvALYfV1eSLYseA789KqOBvs6/Kuy+Zd9RoVuji9QRlD3LS+7o9ck4ZkStX
	Xzdv7ej1EBaUAmrgLEun461IiGWdWUZINcbN/KaGnY5RGbQeTnBajgUunnYL02DQakQdnRF3ZAs
	jnzXX4RFiqok3bvrvrw9IY3ziMfJjV2yXPhtCNC+OPcDvmRxmBRRXO5QBwZL6UbPvBHbciGuone
	sAz9m+Xz4xzXr5qQUd+SLT/mXx/qqsfPjR4n7X6sr6bKERImw7ZBZViCDluKTJsdSw==
X-Google-Smtp-Source: AGHT+IGnV3SnOxGIqLCWULR4547M3BcRDQg2dGTOvOaxvZnQ4YJC2qPqBPdpzXB0gcWFIDVgeGWQFQ==
X-Received: by 2002:a17:902:f791:b0:235:7c6:eba2 with SMTP id d9443c01a7336-235e11fe76emr95923615ad.37.1749131722167;
        Thu, 05 Jun 2025 06:55:22 -0700 (PDT)
Received: from dixit.. ([2401:4900:1c44:a779:7fef:8c20:c62d:6de3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2355c58ed64sm87371595ad.174.2025.06.05.06.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 06:55:21 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Dixit Parmar <dixitparmar19@gmail.com>
Subject: [PATCH 1/1] ref-manual: document KERNEL_SPLIT_MODULES variable
Date: Thu,  5 Jun 2025 19:25:13 +0530
Message-ID: <20250605135514.369076-1-dixitparmar19@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Jun 2025 13:55:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7004

This variable controls the kernel module spliting.

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 documentation/ref-manual/variables.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 9768d8f5b..592401eb6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5359,6 +5359,15 @@ system and gives an overview of their function and contents.
       the :term:`KERNEL_PATH` variable. Both variables are common variables
       used by external Makefiles to point to the kernel source directory.
 
+   :term:`KERNEL_SPLIT_MODULES`
+      Allow opt-out of split kernel modules. For some use cases, a monolithic
+      kernel-modules package containing all modules built from the kernel
+      sources may be preferred. For one, download time is shorter and
+      installation time is faster.
+      Default set to 1, one subpackage per module. Setting it 0 will generate
+      a monolithic kernel-modules package containing all modules built from
+      the source.
+
    :term:`KERNEL_SRC`
       The location of the kernel sources. This variable is set to the value
       of the :term:`STAGING_KERNEL_DIR` within the :ref:`ref-classes-module`
-- 
2.43.0


