Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5814C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:33:44 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.8741.1646750024043496450
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 06:33:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=KlUrvlBQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 k5-20020a17090a3cc500b001befa0d3102so1954516pjd.1
        for <docs@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 06:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/EMp7WofGcBgPX7UtipiMIghvThz2F0pvQjj1iYHUIk=;
        b=KlUrvlBQeQowZ4pncJXVDdkx62Ul7PafnwnDI921SiVcw/kgCue9FIVs1PPEKJlUNk
         v1bP1hCKZ/eDiJWntA99G4aK9RdvWX20GXUAvxhOdoim12nbbPbA04nrRmEsJvkIEYQv
         vkkEGlWDgIsk169eggBsA6h4Tu2FqHtH5WolhWCiPw/Dr87E86ge/yiBskcAj0FkqsmR
         00pVbbNgGRzN1fhsg9VTLRo7dByJ/VPaPqYlBPeaOdEAmzjcgyKSdnQl+TkOgDqZY2rJ
         k/ULeQqnUTwmau2Xe99NedJDZP+9kUQz6pEUMHuYZUQnbkfdGwp9N4QpddH2ivwD6/MD
         mGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/EMp7WofGcBgPX7UtipiMIghvThz2F0pvQjj1iYHUIk=;
        b=NgXhs3i3s1HRyZXB7FhBWHFjWPcC9IipeaF4LKcO0PZCUm/f5BcRjdaEOxN2fsnXxU
         ydQiSedTXkRfPTcVbYBKftXkZAKuSSDazBqpTXz77GNPeB7bm0x9UfYnYL7wu7QLDNHw
         i6pMi/w2TfsaHgm7KUtn9SYGLtwklPlHQr1i4AekSOE0WDD8VJpxLbmDXBBX66Ocwqj5
         z/BrKxpyy3XUGB2uYaRTPX1Y6pWz5Fwu2j2/VJJ+E7nTcuC+jsNwQz7uW3OuizFlM2l2
         P7Mx2PAkQ++8A408/ePUctIA8XrhgmFxwusSJfv3PLUqluwpOtz+HDKuEVcuG0CrBbji
         XBHQ==
X-Gm-Message-State: AOAM530E+Q4049m/HfM3kcIpJoPec05+LnH52Wypla6JMZOtI09OH0sJ
	nNr9oMl1CsgSX+O0O8Wsu8u6PTi4d0NW/1qVsFQ=
X-Google-Smtp-Source: 
 ABdhPJzkENRmQSY21bGzjAg8EPItjfJFMNlkSsqjhgOzRiaj7FjQzU81jJ/DiGUf1Syo9W3yj3U4fQ==
X-Received: by 2002:a17:902:e5ca:b0:152:54c1:f87f with SMTP id
 u10-20020a170902e5ca00b0015254c1f87fmr899670plf.59.1646750022429;
        Tue, 08 Mar 2022 06:33:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q14-20020a056a00150e00b004f741b5c071sm687361pfu.86.2022.03.08.06.33.41
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 06:33:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 2/2] documentation: update for 3.1.15 release
Date: Tue,  8 Mar 2022 04:33:28 -1000
Message-Id: 
 <df94586b9d514e35f05d3a33f6b31ee9b249ea93.1646749913.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646749913.git.steve@sakoman.com>
References: <cover.1646749913.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Mar 2022 14:33:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2546

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/conf.py   | 2 +-
 documentation/poky.yaml | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 01d5e00c1..4df8f55d1 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,7 +16,7 @@ import os
 import sys
 import datetime
 
-current_version = "3.1.14"
+current_version = "3.1.15"
 bitbake_version = "1.46"
 
 # String used in sidebar
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index e37ea420a..e0f8166f7 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,11 +1,11 @@
-DISTRO : "3.1.14"
+DISTRO : "3.1.15"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.14"
+YOCTO_DOC_VERSION : "3.1.15"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
-DISTRO_REL_TAG : "yocto-3.1.14"
-POKYVERSION : "23.0.14"
+DISTRO_REL_TAG : "yocto-3.1.15"
+POKYVERSION : "23.0.15"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.25.1


