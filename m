Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F6FEB64D7
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 02:39:51 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.2789.1686710387750820923
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 19:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rnpFs0Md;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-651e298be3fso6555800b3a.2
        for <docs@lists.yoctoproject.org>; Tue, 13 Jun 2023 19:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686710387; x=1689302387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JBpuvUiZHUD38MzqhvHyQ4pMHp0/+jY/hXa1/MXkyI=;
        b=rnpFs0MdK73XiKguwvs55SDO9EWzMsdpixn8SQRmyi+pgifrxdRR0t8kwOhlpwdF2a
         7331l1LDqFGgSxoOdHDJqB7kgVB7RCela682gqJ973b20mNbaoC7d8Neduklm5I3/7AV
         3UwevVdZ4oe0wFz7mb1/ogJkKyFJ3ypHP4f43EKGpKYnwseVSAdfv+ZaMuWVhDMoOq38
         AKHJPjnZHLSDBF07lUwoIDxt2K6k3XNoOjLJ0pCSzWMR4cTANLlsjDwr+eOoFGjpJkjT
         JXEzSbycyAYogl+Tf1u63xn+pZ8zsCoyVnLvphFaHiylJKgvXB8/JMiUiznXgtMNG+Lv
         zKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686710387; x=1689302387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JBpuvUiZHUD38MzqhvHyQ4pMHp0/+jY/hXa1/MXkyI=;
        b=Do52VS3G+K2AYmPq/HMAbgvOwtRZ6emHAL4r2uNkAuZculOkO92mdiWwAX9A7Ujz4e
         2+mb0L58VFeL4pPAiYgxm1KUMJnG37tCJvzWQbBvK44qDNc1J2cKd8aG5t6Pjwuy2USJ
         wPpGpINnm5Ow3IMULzOmLVsZrsXVCDBRZ9IOCRbeovuJgW0V79sTdDbDr4kdb4pVP2sf
         r6hh+eYNDBgB9cTr1/lPicoZtl4ijzdAHPLmTLXVx9YvmgilN29LpaTYCzZLfV6jwx3k
         k8/znkckXK5wYoUSMgG4ZvnMsai+s1O9kvF/hm4c01vNvgxBUt4Bdq3GEl39lKKfnV1M
         AmXA==
X-Gm-Message-State: AC+VfDybuDItEOjeg066yH61Uk/759pBSJXr4BET8utWtFDA6bGLDT9Y
	7ACjsrsJW+JD/V3iNeuCLz7JpL240vaUJtAyoQs=
X-Google-Smtp-Source: ACHHUZ5OhlzSGyInj5Rn2wrYhzDGfCZ2uJM2TxMPbSTyaRq2x6XuPuyjzLnOA6p0U5qVfPJb8GPKNg==
X-Received: by 2002:a05:6a20:2590:b0:110:e7bc:b0cb with SMTP id k16-20020a056a20259000b00110e7bcb0cbmr571939pzd.39.1686710386466;
        Tue, 13 Jun 2023 19:39:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 18-20020a056a00073200b0063799398eaesm9270246pfm.51.2023.06.13.19.39.45
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 19:39:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: update for 3.1.26
Date: Tue, 13 Jun 2023 16:39:41 -1000
Message-Id: <6f5d97a43a9dc7144afe4544c1841d3f378bd4a0.1686710324.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686710324.git.steve@sakoman.com>
References: <cover.1686710324.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 14 Jun 2023 02:39:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3994

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/poky.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 62d69f9c8..ead58a970 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,13 +1,13 @@
-DISTRO : "3.1.25"
+DISTRO : "3.1.26"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.25"
+YOCTO_DOC_VERSION : "3.1.26"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
-DISTRO_REL_TAG : "yocto-3.1.25"
-DOCCONF_VERSION : "3.1.25"
+DISTRO_REL_TAG : "yocto-3.1.26"
+DOCCONF_VERSION : "3.1.26"
 BITBAKE_SERIES : "1.46"
-POKYVERSION : "23.0.25"
+POKYVERSION : "23.0.26"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.34.1


