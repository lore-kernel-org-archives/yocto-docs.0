Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C52C32773
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 17:13:33 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.44759.1660842805223293466
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Aug 2022 10:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=oiT9MJY9;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so2469344pjf.2
        for <docs@lists.yoctoproject.org>;
 Thu, 18 Aug 2022 10:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=1KkUpRIw3PRtOfcwn5yx3yl23a0edRfXdXzX9tx0uDA=;
        b=oiT9MJY9Jklq6csbJRDAjChSewsajH3X6DQA8PBIGsSexES4qi+WtaQ6f1ksUOLLn4
         Z3As5wJInAThGRoukxsQ3lvoGu719THsyos5q7Yd+NzpThU163SO6/q2ky4aOTMo2wN9
         bbNTcB+2P5Wy6/HxU06wAw4uPhGSSHEo6gsaIGVgiFExykH2A1pUbyoIVapz/XkdEbv4
         ymiwFwwa3J01wFcNwuA9U1BcZbqhDlbPqlMnLiI14qRQCZavHxJWEGMr8ryjLUNywDLK
         0P2RwHAeg+sLQ8+JlAm1uJNV4QFujrehju2NoVFzs4MFWKgBwDKvOc7/jKQPj9CeFA3q
         ZD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=1KkUpRIw3PRtOfcwn5yx3yl23a0edRfXdXzX9tx0uDA=;
        b=dYpNZoGQCbQbLDE3NbcFEN5N9gPLiTn0vlSZ7Y6icEgecoNO134+fE32kZnQpVBekt
         j2LTKvw0NlGkdvDf3St8SQ0ftFqcRTSPJc2IxbB+KaQyfSED/q82i7CVYXR1LMvT20Ep
         /DVeijhDq4X+BUA2W51DhE7YDVHoBLPAKvH9FXVsl0ZycqeZnnqt6im9JTGr4rIO+HDZ
         gtnwuYZFQtaStN8bGUlqlzaG0pTsfn8eiHzSRANL9crEqyVE5IrLn62O6RyWnYY5uO/q
         Q4G8zAW7oclERu7RCoSp+h5lRtLl7N9+CTO+Khn0RR1SWqbpWImC2hzNohv4PdiCs7cZ
         cL0A==
X-Gm-Message-State: ACgBeo2k3fFY3ltbx7m5YqL5zC4WR9baxGDZ9rzRfDcJr+wFD+D7AxA8
	4/E06JgrKOj8Z/tDaL+vjx3M/r/KgEmU4bHf
X-Google-Smtp-Source: 
 AA6agR7ARg83EYR3bIgUZ00uDoWPnAaw8KUeP50fo3XhXmgD5T1iFEmBYMrroOI/xDVnPau4xNZ5aA==
X-Received: by 2002:a17:902:7b87:b0:172:8ae9:2015 with SMTP id
 w7-20020a1709027b8700b001728ae92015mr3444032pll.112.1660842803994;
        Thu, 18 Aug 2022 10:13:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p6-20020a622906000000b0052e8bf1c27fsm1916776pfp.31.2022.08.18.10.13.22
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 10:13:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: update for 3.1.19 release
Date: Thu, 18 Aug 2022 07:13:15 -1000
Message-Id: 
 <fa51ef40ef1539cc0d4dc0d50274a153b6207cdf.1660842718.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660842718.git.steve@sakoman.com>
References: <cover.1660842718.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Aug 2022 17:13:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3120

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/poky.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index e523b003f..dae9abb63 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,13 +1,13 @@
-DISTRO : "3.1.18"
+DISTRO : "3.1.19"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.18"
+YOCTO_DOC_VERSION : "3.1.19"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
-DISTRO_REL_TAG : "yocto-3.1.18"
-DOCCONF_VERSION : "3.1.18"
+DISTRO_REL_TAG : "yocto-3.1.19"
+DOCCONF_VERSION : "3.1.19"
 BITBAKE_SERIES : "1.46"
-POKYVERSION : "23.0.18"
+POKYVERSION : "23.0.19"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.25.1


