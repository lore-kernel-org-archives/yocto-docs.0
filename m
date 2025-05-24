Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3242BC54F32
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 01:10:50 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.1720.1748049042400254708
 for <docs@lists.yoctoproject.org>;
 Fri, 23 May 2025 18:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GdsnAZWm;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c54b651310so51886985a.0
        for <docs@lists.yoctoproject.org>; Fri, 23 May 2025 18:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748049041; x=1748653841; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0avZd9ymCDebgLZ/TQXo544KYzsyLEednOQJojgCLA=;
        b=GdsnAZWm3reouO03T+MdmxyhJzUduRjvrrJzzTy3NRcmaLB0NZNYovChW3S+7bDe2V
         hOwP357YeDs9u57F603PgcIsSh1djKCEeOxHvWmlwbNIYeArkPZYIjTbIF5JJ0FuA7Ne
         CI9z5q3fJOAgdS/eGOSY8oLg6la1QoQbIkb9+jPWGtisX/3OG7yJ8klI/yO+cBMxCAoh
         Mm0xo7JN3xgIATIJFgfbhemu7HL/GTsrx9T+y1m49Pg9+n5yz951hYDPnqqLdfeJ46c6
         WvIF8kHFd9wl63KuaTpfuzUSOvCKzwqoDV7/g35kJptdjnBRyeZoIm8byRtaoD/VMXdQ
         c86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748049041; x=1748653841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0avZd9ymCDebgLZ/TQXo544KYzsyLEednOQJojgCLA=;
        b=ciVf0yn5wShJHmTlBAb00gQh7qujs478wWa5vGc5odRcVogDqjbizIW+lpJEg2jlFr
         SjfbPLiRWjEauCw2yPMmw4beUjTSCmq+irvlmlS+QsuTTi9GNSIksgmLz7GrlADxdXNl
         9B13YhrivWabYdYHwG6lufcsILRML9OZFc8IX30bN/rj+Ha51em28RLjxIg9Le2UpAUd
         khyixDLaommefS3FZ6kqCUrvdDgavusDLWh6TS/mm911Hb8zzBBPzLU3nHHtdmnL8Wt/
         kOukOtFNApqElLERSDRrREgYJ17WK+lJUV+d1/7JLOGs+kJKDr4zXYZBp00FPLbhowGA
         QyVg==
X-Gm-Message-State: AOJu0Yxklp9AJuh6ylsJqT1haXzBmEZB52b9ngmQgWHHBbsHrTUWhTVJ
	7PHsofGBiY9xp5wArbC17BOVQGf+PcHlhVXM2Sa8NpUBzNOcQCfXcrI0qtNByg==
X-Gm-Gg: ASbGncsNnrHQaD+7NmZAlc4bFl60FYiby1kDocbuWoTD9ZRwC1bCVaNluIfd/waomZv
	OG1sckmi7ixDq8MLWsRPkVqzudIHCZMfPgYQZxK99lWZa5kHkHWTO6ZvGgr/eJDxrs0N0YGHg7H
	ADLJ+wMxsUUqT2qlLbDV36ib6F8CY5Xb4BZiPbcDvkninztjwP8utj5ts1Ja4d777iScxj4y1LI
	bEJxWUoBvbjQVPvogljX2yhnd9OtnRNtMnnoG1i+9NtAbGAmVJCF6ZwxnVrak5hjqM4ECdXVwEn
	kLGAZR6gbkx/yOOfMsO8VVhLx61oPDVCVP1uojdwCIGiXeMJFREPI7q/lpSaBNxPVLr31IWiJq4
	fU9FH8DR34cJ770PkYyY=
X-Google-Smtp-Source: AGHT+IGRD4wg3BTwFAiO13jotCct6u2V6X45pmPALKr4HQdWPiHlfS8NhJIwryI4uZWzcNi+zWAfig==
X-Received: by 2002:a05:620a:d81:b0:7c3:c9f4:522 with SMTP id af79cd13be357-7ceecbc74b9mr195658485a.14.1748049040830;
        Fri, 23 May 2025 18:10:40 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467d8140sm1261220585a.37.2025.05.23.18.10.39
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 18:10:39 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH][scarthgap 2/3] sphinx-lint: missing space after literal
Date: Fri, 23 May 2025 21:10:31 -0400
Message-ID: <20250524011032.19679-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
In-Reply-To: <20250524011032.19679-1-twoerner@gmail.com>
References: <20250524011032.19679-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 24 May 2025 01:10:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6894

Fix all instances of missing-space-after-literal as reported by 'make
sphinx-lint'.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/sdk-manual/extensible.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index a7546e728849..ab4956f46619 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -802,7 +802,7 @@ the two modes:
 
       This instance of VSCode uses plugins that are useful for the development
       of the application. ``devtool ide-sdk`` generates the necessary
-      ``extensions.json``, ``settings.json``, ``tasks.json``and ``launch.json``
+      ``extensions.json``, ``settings.json``, ``tasks.json`` and ``launch.json``
       configuration files for all the involved plugins.
 
       When the source code folder present in the workspace folder is opened in
-- 
2.44.0.501.g19981daefd7c


