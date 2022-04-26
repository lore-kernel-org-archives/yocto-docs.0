Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7986CC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 10:34:55 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.4460.1650969289774406976
 for <docs@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 03:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SHQkoOzV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso1239884wma.0
        for <docs@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 03:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZddBndjQtvPwKlZqMgKWrabJBrD/p6FDFlH3AoNgq2g=;
        b=SHQkoOzVtedcKtGq3cfXO+Jy3QGMPwHtCUgtMDPwmbFbJPBdSvDAsK6GUFze7mJ/HC
         uNi6Ulfggjhj8rSgzERz9vXqcn+0o3pwKTyD+5XGGw5+C6vrMZB74h++M5qSrHDIJFkD
         urO6T+hg+DQ0wuh665+ZCoRDxJsR8o0Zm1Jvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZddBndjQtvPwKlZqMgKWrabJBrD/p6FDFlH3AoNgq2g=;
        b=Wh+kPPTbFGSz+iJiQXyCj4XVzwCdoPUfGmHANydBRytxnQiMv0qGVDjGar3qbgQ00r
         l3J1wbF8sjwDgTqHPgjUAIX9mlXth4DgdVHYw16o/vHIOa4iNjUCQRb445/oxHslap7i
         wPX4pqq8Eo4s+HKCLpZEq5aOmUIPW+iRbxnsAWfqD4KompaIbjuoBPQrIyra/KZ+JN5P
         +bSPdBFIAPWs1oyd/9kN8LAEmwqNNM+IpzQpxtA/hSOmSURf96zP/Z/1nmEUnZ9yrHIk
         XUC8IC+mm8B3sr98bU9EiK/VODRhrXOVibSDH/gkC5xOlevUN6khVop1EqYgaHFX/T6I
         xHvQ==
X-Gm-Message-State: AOAM532orTmcl8IylJmLyJ8m6fY8+3whRDDP4IMu1QZHAwDy20v3H8ZW
	xk7MTVNNk7LifFjLuWPbDkF5qIUwQjr6CQ==
X-Google-Smtp-Source: 
 ABdhPJxcTnnd1k9y4Zu3T/FpERNk/2gknVPvdF66c+t6uJ/Q4Vnb1x1UWBzWDewai1r/F42HByhHDQ==
X-Received: by 2002:a05:600c:190d:b0:393:ee55:5686 with SMTP id
 j13-20020a05600c190d00b00393ee555686mr6604707wmq.126.1650969287820;
        Tue, 26 Apr 2022 03:34:47 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8d4:bce8:ef63:7bc2])
        by smtp.gmail.com with ESMTPSA id
 r5-20020adfa145000000b0020acc9de8c4sm10422682wrr.38.2022.04.26.03.34.47
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 03:34:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] set_versions: Add a getlatest command to obtain the latest
 release branch name
Date: Tue, 26 Apr 2022 11:34:46 +0100
Message-Id: <20220426103446.2776060-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 Apr 2022 10:34:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2866

This will allow the autobuilder-helper run-docs-build script to obtain
the latest release name.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/set_versions.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 33d9da55e..cd02cc739 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -27,6 +27,11 @@ activereleases = ["kirkstone", "honister", "hardknott", "dunfell"]
 devbranch = "langdale"
 ltsseries = ["kirkstone", "dunfell"]
 
+# used by run-docs-builds to get the default page
+if ourversion == "getlatest":
+    print(activereleases[0])
+    sys.exit(0)
+
 release_series = collections.OrderedDict()
 release_series["langdale"] = "4.1"
 release_series["kirkstone"] = "4.0"
-- 
2.32.0


