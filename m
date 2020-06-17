Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.10665.1592408668556014559
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 08:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YMgAyIgn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id t194so2503046wmt.4
        for <docs@lists.yoctoproject.org>; Wed, 17 Jun 2020 08:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qoZlqAoQ66+MbG759/rE/L4CXbiUJB71Z6O0f4yP58M=;
        b=YMgAyIgnpwgLHYPClqvz68cqKIUv3NVJiQygVEmFTRFOAd96PxjycAFVJMC70vZ0CQ
         2GJd1j9pgMA2QdTLN7s/ZD1WEQMkN14Y8hdqXnoGEYSnO5US1+0Fvk7DsKxOn1ItZxeK
         Y1A1EV2ADr5by/YMZb9HbOsl+ETHFAlIb3CaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qoZlqAoQ66+MbG759/rE/L4CXbiUJB71Z6O0f4yP58M=;
        b=J13qgt5RiTWB/UU77s4fGKJntVVWB7IEKKx7JtLq4X9/u7zBtrDX/vi7bXx4AlUpqF
         3WZgCwR3HXe+0+0xQKMHPmTnEM9zCip9xGK79pFsJbiY+x9tZL2XVqC4NZWBiEI0u2XC
         O3sFgcay+Va8hYVyn+AsaOxjWCoQ9m3pgxNad0tTUBjXuQpc0ewL7QyUyYmVnAcIDFBi
         gfzeHN5bwmfrOFma7Vput6GFxZK6kFrgNJNfgSE4HtlwPsCn3KmuZZRSYtob0aqMzh8D
         an36B8WtfaTYMIzc2Y5iKrWShvaWkxvBR15Kdkv0PpXg6K1RMSIK4C7ztr2BKp/2mmLF
         YaMg==
X-Gm-Message-State: AOAM531jQib7m8ZcqpHie8SRjFupfNpyy3fOxNuq4/m9exG5Bb8J8PyR
	Ck+Ljz3bdP9TpL+y5e6f+EEaW6u70M6Org==
X-Google-Smtp-Source: ABdhPJyX9FNk94tLV0PumuGYpVMW1Nli5XJDR8/AzoJMtmD3D+NtlkEVl2dbo0pfPR4kdGHVDjjISg==
X-Received: by 2002:a1c:e40a:: with SMTP id b10mr8862863wmh.41.1592408666771;
        Wed, 17 Jun 2020 08:44:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s18sm41561189wra.85.2020.06.17.08.44.25
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 08:44:26 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH 3/4] .gitignore: Drop obsolete entries and cleanup
Date: Wed, 17 Jun 2020 16:44:21 +0100
Message-Id: <20200617154422.417466-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200617154422.417466-1-richard.purdie@linuxfoundation.org>
References: <20200617154422.417466-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .gitignore | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/.gitignore b/.gitignore
index e9e525e16..3f5dfa32e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,21 +1,5 @@
 *.pyc
 *.pyo
-build/conf/local.conf
-build/conf/bblayers.conf
-build/downloads
-build/tmp/
-build/sstate-cache
-build/pyshtables.py
-pstage/
-scripts/poky-git-proxy-socks
-sources/
-meta-darwin
-meta-maemo
-meta-extras
-meta-m2
-meta-prvt*
-poky-autobuilder*
-*.swp
 *.orig
 *.rej
 *~
@@ -37,31 +21,14 @@ documentation/dev-manual/dev-manual.tgz
 documentation/ref-manual/ref-manual.html
 documentation/ref-manual/ref-manual.pdf
 documentation/ref-manual/ref-manual.tgz
-documentation/poky-ref-manual/poky-ref-manual.html
-documentation/poky-ref-manual/poky-ref-manual.pdf
-documentation/poky-ref-manual/poky-ref-manual.tgz
-documentation/poky-ref-manual/bsp-guide.html
-documentation/poky-ref-manual/bsp-guide.pdf
 documentation/bsp-guide/bsp-guide.html
 documentation/bsp-guide/bsp-guide.pdf
 documentation/bsp-guide/bsp-guide.tgz
-documentation/yocto-project-qs/yocto-project-qs.html
-documentation/yocto-project-qs/yocto-project-qs.tgz
-documentation/kernel-manual/kernel-manual.html
-documentation/kernel-manual/kernel-manual.tgz
-documentation/kernel-manual/kernel-manual.pdf
 documentation/mega-manual/mega-manual.html
 documentation/mega-manual/mega-manual.tgz
 documentation/sdk-manual/sdk-manual.tgz
 documentation/sdk-manual/sdk-manual.html
 documentation/sdk-manual/sdk-manual.pdf
-documentation/concepts-manual/concepts-manual.tgz
-documentation/concepts-manual/concepts-manual.html
-documentation/concepts-manual/concepts-manual.pdf
-documentation/getting-started/getting-started.tgz
-documentation/getting-started/getting-started.html
-documentation/getting-started/getting-started.pdf
-documentation/template/1.76.1/
 documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.tgz
 documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.html
 documentation/brief-yoctoprojectqs/brief-yoctoprojectqs.pdf
-- 
2.25.1

