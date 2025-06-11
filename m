Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916FCC71141
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 18:40:48 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.2989.1749667238959598224
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Jun 2025 11:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=YMZH2o2N;
 spf=pass (domain: limonsoftware.com, ip: 209.85.160.47, mailfrom: anibal@limonsoftware.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2ea2fee5471so76447fac.0
        for <docs@lists.yoctoproject.org>; Wed, 11 Jun 2025 11:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1749667238; x=1750272038; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qlyh/lgN60YKyiE5hIulqmCxdAeC63Ip6MFfFYjqbWY=;
        b=YMZH2o2NvyOdZGTnV/O+1UTK+jUYBJDLqUpVqPfQrIxAVt5DnU4NIiY3hMm0TXcmHj
         H1vqBE9nsnOO4BSEMInmhyel2a/oWwpngr7JXs/2v3Z4T5pPMvlRBvjSJ8ZsWMfXzjJD
         X2m+bUonOVeiNiHxqEws3jJCWK2GDJKGhOf87ZaGTvY7cHREe5TGMo4tAgcXvYUnv7Gd
         iV33PF60y9L9QqPmFKnMi/XLbpBn3hE49F4gi0wWCYgdpLg8jhkMVVMTLYTywTs3qZFH
         Cgv4BtS4jedUjjpEoFFosbZtuCoMagHrhdpQcufGw0gKs2z7rp0TQ6v9t5uXUkljk2ES
         UQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749667238; x=1750272038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qlyh/lgN60YKyiE5hIulqmCxdAeC63Ip6MFfFYjqbWY=;
        b=qcsGCEHT4Azft47jf5KFFWY3hJTYVJ6NNzT7SggYGpnFv+YX1QYFL5tRvvhDEelTrF
         Zls/CEUPgH3xzC9zKWlFE3MWsCnSBsVsWEaE/2KeCNz37nXWkpd6nlHknPe98n8meVyQ
         H5lB0C81P8NepcLz6qqA63AnHUniaPnrddfPrLrnP5Ug4pMB+fFiVDhkgHHkjhkkWwFc
         itfst+g/LPcw7U7rd/Zgrb8FtBTvI6Nyc9ffgnNHnC5xADbaWRyb0pVhUa2swOS7soVo
         XA9IamW24hhUAPLe6GSTeKHVOAX7MLr982JqFYolXVcba0rtAm9i+0+/XRqNbTUHjYNg
         KHwA==
X-Gm-Message-State: AOJu0YwuXfDSi9EYf4iowfLz9ZfPxgpJiG3KnYPEbjeaXr7PjWI/MLay
	rVmwe9dJcpluVQ89fLtLVxyESaTigO8XojUE7mL60WPTFqFwaMElSdcSDQtMSbCC55nZYDdp7xL
	VLC4hPgY=
X-Gm-Gg: ASbGncuzSmTbTVucDUIRsL3kOIiSFObUmH9m+6G7B6OcfDm+U0XAM4jk+DysrWjuVSj
	mxslIqccjRs+9XDMbGsarugvBULSDXNVJLGAGbVmTMUjPqjboUG++Qe5PYbqDt+rG8C+f2qyzsw
	W4m2xVTYr4x2Nxngfa2qSmO71cWN1nEU5ZqPl95cK+dXdAOLyQnM1qUUdgAzmz4f0x+aPZYg33d
	zN0oorgjwWyQzTt3erTL1H4rwz4Q/JtCMOap4ye6mTzHFTZTL+FSpSyZ0SbARh5CzhBWy3k1RuB
	ntlij0Y+F2078WXOI52PtH9g4BkU4wQiK5jQHzwjqrL+FX1rVLsrxqsHrVeWpQKXDWHoZEAvhdC
	h5NHWpVr7TpNWjkFJ6o5A7DONouw=
X-Google-Smtp-Source: AGHT+IHzBePruMc8C7ta1U0gCTXY40TdKh/aiuuD2hUhERY1/goa+GCMeS2bTpWVaZLZ6mlo+p2fAg==
X-Received: by 2002:a05:6870:468d:b0:2e8:f6d4:535f with SMTP id 586e51a60fabf-2eab438ac89mr334788fac.14.1749667237727;
        Wed, 11 Jun 2025 11:40:37 -0700 (PDT)
Received: from ls.ts.net (fixed-189-203-87-169.totalplay.net. [189.203.87.169])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea073432besm2934172fac.41.2025.06.11.11.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 11:40:37 -0700 (PDT)
From: Anibal Limon <anibal@limonsoftware.com>
To: docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com,
	erik.schumacher@iris-sensing.com,
	yoann.congal@smile.fr,
	Anibal Limon <anibal@limonsoftware.com>
Subject: [PATCHv4] test-manual/ptest: Add info about fail state of ptest-runner/ptests
Date: Wed, 11 Jun 2025 18:40:34 +0000
Message-Id: <20250611184034.566623-1-anibal@limonsoftware.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Jun 2025 18:40:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7064

On the ML was pointed about no specific information about
ptest-runner/ptests so improve docs around.

https://lists.yoctoproject.org/g/yocto-patches/message/1622

[YOCTO #15832]

Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
---
 documentation/test-manual/ptest.rst | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/documentation/test-manual/ptest.rst b/documentation/test-manual/ptest.rst
index 2c021af51..9442387f7 100644
--- a/documentation/test-manual/ptest.rst
+++ b/documentation/test-manual/ptest.rst
@@ -46,13 +46,19 @@ Running ptest
 =============
 
 The ``ptest-runner`` package installs a shell script that loops through
-all installed ptest test suites and runs them in sequence. Consequently,
-you might want to add this package to your image.
+all installed ptest test suites and runs them in sequence.
+
+During the execution ``ptest-runner`` keeps counter of total and failed
+``ptests``, At end the execution summary is written to the console. If
+any of the ``run-ptest`` fails returns '1'.
+
+Consequently, you might want to add this package to your image.
+
 
 Getting Your Package Ready
 ==========================
 
-In order to enable a recipe to run installed ptests on target hardware,
+In order to enable a recipe to run installed ``ptests`` on target hardware,
 you need to prepare the recipes that build the packages you want to
 test. Here is what you have to do for each recipe:
 
@@ -77,8 +83,9 @@ test. Here is what you have to do for each recipe:
 
 -  *Create run-ptest:* This script starts your test. Locate the
    script where you will refer to it using
-   :term:`SRC_URI`. Here is an
-   example that starts a test for ``dbus``::
+   :term:`SRC_URI`. Be sure ``run-ptest`` exit with 0 to mark it
+   as sucessfully executed otherwise will be marked as fail.
+   Here is an example that starts a test for ``dbus``::
 
       #!/bin/sh
       cd test
-- 
2.39.5


