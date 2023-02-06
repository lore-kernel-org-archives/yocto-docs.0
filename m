Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4003C636D3
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 17:31:45 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.60127.1675704702604295953
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Feb 2023 09:31:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=rZPUGPMx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id j1so6440654pjd.0
        for <docs@lists.yoctoproject.org>; Mon, 06 Feb 2023 09:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IODTsXV8QLo+B4HzR3cNT8EhxkexAIyB9CPNJTy+V0A=;
        b=rZPUGPMxmwgaaCURZAuJBM0aMCQkxeEYuEPuR5ya92nhz5UDZhz33Yay3jQWjowm48
         /GjmTTKXiJR8RObbkpE3fUS68HSrdpMQkUClrzrxMP4Nbze4mRr4gnt7VM/xjNuTMocG
         p79QbBK9q4EuQfcIrkOhPn0oUMl9r83bLYrC0Shjp1vBecF7FHhr5HMf/G5CPHtQmmHb
         N/wvjr++JXtkuEvh5nSRpxL8B4lQdhOEhWUGm13CLCyuix0UVs5HmSWzeENmCpyEZ3er
         nKJ1+8Dx+ITjQYw1DuwOhXPtmt1j3RieJHUPbFzwdjRmxJJpoc5TWfqWfrTjpGcECNCt
         AXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IODTsXV8QLo+B4HzR3cNT8EhxkexAIyB9CPNJTy+V0A=;
        b=kp5HJikRXi+StS2BdWLMkvAa3c4W/RObFCPjwBJVKWMwopWiQIexrR7d2q461Sk+3J
         fKS5N/OlWAY2ycLeNrP6rvVsC4gBfw7d7XMY93kFv/KoQ9jTknC9kxGXCCEF25Y0guWk
         sQ4l+eT1vv/4OHVodO7kSvYMqFX1Z0dsCNSO8ZAjuZ2hKAqS2ZQWFacrW28MOaNuZsu5
         HHxnAD2xR6jlZKvEDP4+eX/B3ygQP4XAJNPKk2TTa5R17ptoiNTZ7WJCFC+sQFOoAYJF
         R3kWiwiopJdSiZ6rt0WPNjnznuVBXCqT/8F8ftCzqh+qFpTUMUshUVxoP69T8vmZkZI5
         +i+A==
X-Gm-Message-State: AO0yUKVHF3Ci1v1KxhZj/zgWlfmV5zyhAP8eYsxcrlJSyQO2mQTTNugL
	tHvBk5Iek2UmwTUiAinvrplVDUmKk8M5aGAhGhA=
X-Google-Smtp-Source: AK7set+ZuEDIUWKoZtQEsBPnEKAVSpKnzdGVkRZ1O3uH/o4Bya8gilgP+sU1Cju4VI7irTfvstn9VA==
X-Received: by 2002:a17:90a:19:b0:22c:4f41:bbc2 with SMTP id 25-20020a17090a001900b0022c4f41bbc2mr565219pja.5.1675704701198;
        Mon, 06 Feb 2023 09:31:41 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id mt12-20020a17090b230c00b00228eea35201sm4094155pjb.12.2023.02.06.09.31.40
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 09:31:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: update for 3.1.23
Date: Mon,  6 Feb 2023 07:31:33 -1000
Message-Id: <59a206b093160127f82352f04031c7190c36ab5c.1675704607.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675704607.git.steve@sakoman.com>
References: <cover.1675704607.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Feb 2023 17:31:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3638

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/poky.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 2fb917cae..d33ea2712 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,13 +1,13 @@
-DISTRO : "3.1.22"
+DISTRO : "3.1.23"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.22"
+YOCTO_DOC_VERSION : "3.1.23"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
-DISTRO_REL_TAG : "yocto-3.1.22"
-DOCCONF_VERSION : "3.1.22"
+DISTRO_REL_TAG : "yocto-3.1.23"
+DOCCONF_VERSION : "3.1.23"
 BITBAKE_SERIES : "1.46"
-POKYVERSION : "23.0.22"
+POKYVERSION : "23.0.23"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.25.1


