Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.10636.1592408669369614195
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 08:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BO/Jz8e6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id x6so2821300wrm.13
        for <docs@lists.yoctoproject.org>; Wed, 17 Jun 2020 08:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=f+rcSWayFEjJ6YXal6X+aFcB5+caKbP4jlD9/AXu5DE=;
        b=BO/Jz8e6fjlELIJUHO3uGXm70yMlH+RHhSeRWqN3x3P/z8icVR0AgvsoPR0CresEeW
         TtLCAxFiLkgNwtd4287PmDYpVCvyx9AdmrtfDe8sAVhFil3SZ95NSTeB4na5FYPRh2oh
         2aiTMyVOdk7K1Y3N6uNK6eBvei+7e49Qeiz3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f+rcSWayFEjJ6YXal6X+aFcB5+caKbP4jlD9/AXu5DE=;
        b=iolv6y3d6i97xzBnHUFTk5rncrI7ULQu9DVF3qetT0fXb8q5Vu4mPYuHy2PQGRwwm1
         n4kb/lN4/8jdb46wgC1RkwmF7FNhyM1Lb1utBO74oSk2JdmOdobPmAY791Vt4qp4lSRC
         k+8MMkMvcaQ7RG8jz3743kkqa1oMnZKoNLZkXpPYE/2kUVx5gW2Hl+9HAUrDd9zCLp1A
         knklIm203NGfRiw2251A0KiC883URHr1SP7tVgiXEF9m7pgiZOOLlPMGBriP8IUuiRbh
         b5ak1SWVKldKJTfbHcFZrpoeS993cFjtPOZRrjboPFlwzbVSr9XlqGbkdKFg1Nl38an4
         gyZQ==
X-Gm-Message-State: AOAM5317NO2D6Cz5udqS0NUDKuNMIHAzGUbNILtaTDNsDg9tJix3SNps
	EON7fsYo6I3UBdqkVBaNI0JuePCorhy2bQ==
X-Google-Smtp-Source: ABdhPJxRko3y9OjIQpCmzGjto08O8sfrKdG6+fHAAii3Hdkjn9HO0yOBwp/gnLQjRAMxLFDdzvBvKA==
X-Received: by 2002:a5d:55c2:: with SMTP id i2mr9173979wrw.225.1592408667666;
        Wed, 17 Jun 2020 08:44:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s18sm41561189wra.85.2020.06.17.08.44.26
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 08:44:27 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH 4/4] Makefile: Drop obsolete edison/denzil branch conditionals
Date: Wed, 17 Jun 2020 16:44:22 +0100
Message-Id: <20200617154422.417466-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200617154422.417466-1-richard.purdie@linuxfoundation.org>
References: <20200617154422.417466-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/Makefile | 54 ------------------------------------------
 1 file changed, 54 deletions(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index 6a369637f..7d4058ae7 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -140,32 +140,10 @@ ALLPREQ = html tarball
 # This would be appropriate for "master" branch.
 #
 
-	ifeq ($(BRANCH),edison)
-TARFILES = dev-style.css dev-manual.html \
-           figures/app-dev-flow.png figures/bsp-dev-flow.png \
-           figures/dev-title.png figures/git-workflow.png \
-           figures/index-downloads.png figures/kernel-dev-flow.png \
-           figures/kernel-example-repos-edison.png \
-           figures/kernel-overview-1.png figures/kernel-overview-2.png \
-           figures/kernel-overview-3-edison.png \
-           figures/source-repos.png figures/yp-download.png \
-           figures/wip.png
-	else ifeq ($(BRANCH),denzil)
-TARFILES = dev-style.css dev-manual.html \
-           figures/app-dev-flow.png figures/bsp-dev-flow.png \
-           figures/dev-title.png figures/git-workflow.png \
-           figures/index-downloads.png figures/kernel-dev-flow.png \
-           figures/kernel-example-repos-denzil.png \
-           figures/kernel-overview-1.png figures/kernel-overview-2.png \
-           figures/kernel-overview-3-denzil.png \
-           figures/source-repos.png figures/yp-download.png \
-           figures/wip.png
-        else
 TARFILES = dev-style.css dev-manual.html figures/buildhistory-web.png \
            figures/dev-title.png figures/buildhistory.png \
            figures/recipe-workflow.png figures/bitbake-build-flow.png \
            figures/multiconfig_files.png figures/cute-files-npm-example.png
-	endif
 
 MANUALS = $(DOC)/$(DOC).html
 FIGURES = figures
@@ -181,37 +159,6 @@ XSLTOPTS = --stringparam html.stylesheet mega-style.css \
            --xinclude
 ALLPREQ = html tarball
 
-	ifeq ($(BRANCH),edison)
-TARFILES = mega-manual.html mega-style.css figures/yocto-environment.png \
-        figures/building-an-image.png  \
-	figures/using-a-pre-built-image.png \
-	figures/poky-title.png \
-	figures/adt-title.png figures/bsp-title.png \
-	figures/kernel-title.png figures/kernel-architecture-overview.png \
-	figures/app-dev-flow.png figures/bsp-dev-flow.png \
-        figures/dev-title.png figures/git-workflow.png \
-        figures/index-downloads.png figures/kernel-dev-flow.png \
-	figures/kernel-example-repos-edison.png \
-	figures/kernel-overview-1.png figures/kernel-overview-2.png \
-	figures/kernel-overview-3-edison.png \
-	figures/source-repos.png figures/yp-download.png \
-	figures/wip.png
-	else ifeq ($(BRANCH),denzil)
-TARFILES = mega-manual.html mega-style.css figures/yocto-environment.png \
-        figures/building-an-image.png  \
-	figures/using-a-pre-built-image.png \
-	figures/poky-title.png \
-	figures/adt-title.png figures/bsp-title.png \
-	figures/kernel-title.png figures/kernel-architecture-overview.png \
-	figures/app-dev-flow.png figures/bsp-dev-flow.png \
-        figures/dev-title.png figures/git-workflow.png \
-        figures/index-downloads.png figures/kernel-dev-flow.png \
-	figures/kernel-example-repos-denzil.png \
-	figures/kernel-overview-1.png figures/kernel-overview-2.png \
-	figures/kernel-overview-3-denzil.png \
-	figures/source-repos.png figures/yp-download.png \
-	figures/wip.png
-        else
 TARFILES = mega-manual.html mega-style.css \
         figures/YP-flow-diagram.png \
 	figures/using-a-pre-built-image.png \
@@ -269,7 +216,6 @@ TARFILES = mega-manual.html mega-style.css \
 	figures/sdk-devtool-upgrade-flow.png figures/bitbake-build-flow.png figures/bypqs-title.png \
 	figures/overview-manual-title.png figures/sdk-autotools-flow.png figures/sdk-makefile-flow.png \
 	figures/bb_multiconfig_files.png figures/bitbake-title.png figures/cute-files-npm-example.png
-	endif
 
 MANUALS = $(DOC)/$(DOC).html
 FIGURES = figures
-- 
2.25.1

