Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AEB4C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 14:40:30 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web09.10103.1657636824806477873
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 07:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=dg1ey3z+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id l124so7640880pfl.8
        for <docs@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 07:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VIpInAUd+kASUjf8TFquPBXb/ufxXu/GxB/Li82V8QA=;
        b=dg1ey3z+gmZQDGyWo7W9QXwYbJOWwoopdzoWl/PdHtj5pAFKrYjEuvZLlpZxSupP78
         4PW9n6pnFtIizCmT+qQm4Z6tPCzwC+m9KLZP5J/X4cPu2wD03M0hpBZZpDSyRauo6v9V
         9WGOVhG0Vw9gofarHhUZC2RHAWn9llSyCnxhO+JcVl6uZIPOPsR657jYPoR2Vlq9kzF0
         LNSxK9f3i91tHxrBROR6WADkfT/Cnw1IHRypmabLq8liwjZ+y+Q76AH0DYuHhu6kyH71
         fXEkgtlrsX2G1DsfBBdA/BbqX4XaPIf7XtkA23V8R7aK7MSYFRjYSXb4/YMtJfDVL8BI
         MeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VIpInAUd+kASUjf8TFquPBXb/ufxXu/GxB/Li82V8QA=;
        b=KIPzswT6I1kpWtRqIAMdTnwuXoHSOOQ1/LagSgh9I7YBUDIrAd5ipSn6SuMMswekSw
         Ex7AlpVlWCi44wc0QMMqbbiziBbjSzC5FtCN49DPqylH+3Yd/bV+G1aT6iyxgc8E49s3
         eyRFz0t9/Cig48vRlBE3eq3VmfGF2PCEI2ZHaTiupDeFe8N+kGSdYkfB9WMToERvGmX8
         Ut26v3CWsGrgK9qJhawKfRNgo+QRQ0Bv6aIOikbTWUBS96Pfx1vjE3tLOebJG8vi0jAq
         CYIPaC7UTsY5WnSDCgYM7cWW0Y0BSPwbWxFcB7ChEq06Wj/IEMON/kJLMdo5kbLST7Zl
         FeBw==
X-Gm-Message-State: AJIora8j/gKjKdetwuDjxn80r9sKFBINLoG84BzmMycEYFqMN7vFM1Lm
	jDTnhRIzOc2IHHMqcb1IG75ByhZl1YXs0Y3T
X-Google-Smtp-Source: 
 AGRyM1t8xk2I+qMSNXtYkUDOr87MXlCTtbaPJHBcOnimGWswmZkOt/g49de+DQeBSGeDr8lORbe37Q==
X-Received: by 2002:a65:594e:0:b0:411:c9e8:68b6 with SMTP id
 g14-20020a65594e000000b00411c9e868b6mr20791725pgu.556.1657636823543;
        Tue, 12 Jul 2022 07:40:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b0016bdee4f24asm6980478plg.48.2022.07.12.07.40.21
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 07:40:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: update for 3.1.18 release
Date: Tue, 12 Jul 2022 04:40:02 -1000
Message-Id: 
 <4901296525b7b3d3c6d2560c4b6b3630b6d58835.1657636746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657636746.git.steve@sakoman.com>
References: <cover.1657636746.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Jul 2022 14:40:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3055

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/poky.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index abbd4332f..e523b003f 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,13 +1,13 @@
-DISTRO : "3.1.17"
+DISTRO : "3.1.18"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.17"
+YOCTO_DOC_VERSION : "3.1.18"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
-DISTRO_REL_TAG : "yocto-3.1.17"
-DOCCONF_VERSION : "3.1.17"
+DISTRO_REL_TAG : "yocto-3.1.18"
+DOCCONF_VERSION : "3.1.18"
 BITBAKE_SERIES : "1.46"
-POKYVERSION : "23.0.17"
+POKYVERSION : "23.0.18"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.25.1


