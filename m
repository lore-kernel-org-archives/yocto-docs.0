Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7D7C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 15:42:34 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.11102.1647618153396295205
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 08:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vc4RESej;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id h16so4509946wmd.0
        for <docs@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 08:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mkCfDSJEtfeKrMpQGuibsN3gnarO1qj3nzkg5vu5/aU=;
        b=Vc4RESejlSsVNwUlmOkd7PlT75b80s+APJiZwn5iJ13UjRRyztFMjiKderOW9u75Xj
         0tc+v60r8KCeqAhzB6Hkb8bUeAupHDeWQIr+3Q2ODfNT2EXBk6vdIH2ApuUxkDTozzz1
         FK+jHMFsvCDDRCoTrN09GX09/bUN0Ga406Yk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mkCfDSJEtfeKrMpQGuibsN3gnarO1qj3nzkg5vu5/aU=;
        b=cpSo2xh6RoajcReDLzVI4iB9CAVduPbs+unaOjFNfClkB7wo5I/sJ0Wxf2x/Oj2mdP
         jz6liux2bDAhT4BtLRPmWinKq/HDczRG1QV5GXSZQRgkAT+jMQa9eVSwx98mTM40n+pu
         OLVqR5T2ZszAhLfSe/IcpX8Q5Yodx3CTN8Jt88coHgsCB1py7Jc8Y+NRODCvRBF73cEY
         ND4hjtDG+oImu3InKi0T/kMuglmcUl3Da2TwAwpV77UaHkG6A29InWzs+08ZsdDjFn5b
         909yDSXz1GTsX5MiNNNcKV2gahAXTa4qVR4bU9rUavNmRsoT9KMlJfT6Mcha/KgDCQh3
         4sfA==
X-Gm-Message-State: AOAM532XFPzCF4h3M5OhpsuyoYz3yZKYwTBEBo1iE82leGDijf6utMUh
	Bujn4lFiaP+hg5AHdEGpAHkD/YlBGWcEbB8R
X-Google-Smtp-Source: 
 ABdhPJyz3v428cb9MJHLSbKUSh99PI02tVInk0AmCgwXzB/XOUXYFH18hUM8inpzSeIkVck4UnsILg==
X-Received: by 2002:a05:600c:3d8d:b0:38c:6f6e:e61a with SMTP id
 bi13-20020a05600c3d8d00b0038c6f6ee61amr11102008wmb.101.1647618151672;
        Fri, 18 Mar 2022 08:42:31 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:ac92:797e:3dcd:ed37])
        by smtp.gmail.com with ESMTPSA id
 l1-20020a05600c4f0100b00387369f380bsm11443624wmq.41.2022.03.18.08.42.30
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 08:42:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH 3/3] set_versions: Add support for setting POKYVERSION found
 in older releases
Date: Fri, 18 Mar 2022 15:42:28 +0000
Message-Id: <20220318154228.1071136-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220318154228.1071136-1-richard.purdie@linuxfoundation.org>
References: <20220318154228.1071136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Mar 2022 15:42:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2638

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/set_versions.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 32259238e..6452aeb14 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -34,6 +34,13 @@ bitbake_mapping = {
     "dunfell" : "1.46",
 }
 
+# 3.4 onwards doesn't have poky version
+poky_mapping = {
+    "3.3" : "25.0",
+    "3.2" : "24.0",
+    "3.1" : "23.0",
+}
+
 ourversion = None
 ourseries = None
 ourbranch = None
@@ -121,6 +128,10 @@ replacements = {
     "BITBAKE_SERIES" : bitbakeversion,
 }
 
+if release_series[ourseries] in poky_mapping:
+    pokyversion = poky_mapping[release_series[ourseries]] + "." + ourversion.rsplit(".", 1)[1]
+    replacements["POKYVERSION"] = pokyversion
+
 with open("poky.yaml.in", "r") as r, open("poky.yaml", "w") as w:
     lines = r.readlines()
     for line in lines:
-- 
2.32.0


