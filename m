Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716DFC5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 22:21:49 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.72380.1749507707071949470
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Jun 2025 15:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=IlDCq2wb;
 spf=pass (domain: limonsoftware.com, ip: 209.85.160.47, mailfrom: anibal@limonsoftware.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2db9e29d3bcso1910330fac.1
        for <docs@lists.yoctoproject.org>; Mon, 09 Jun 2025 15:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1749507706; x=1750112506; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J3GnHlW8OR3yKZlpcBChKbWMXbjZEozkoitwJHBTukc=;
        b=IlDCq2wbrFl3dUVW7T0BKQ/76tUdsqpXQCmBOOTe1QHSK67Eh62fWx3mm1KL8T+wms
         wJWo6TSEtsyD8sSN3W6u5kghqioRDpkZnefnd3nV6ztZ9+BtHgU4xvUxXej+38yA2snh
         fenRaKBrY58/FE6DWb5cLK3uMuqb+h2DQ9zdlzvdMiRajUsKo3IP3dMAjCpn6rp6EXol
         9cw8o7Nx7ncWSdWUVLJF0WJyY2OZDh8owN+xFOWyVs55a4Zv/+hhgu86kh+vJNvOHCMy
         qiG41KGItEM43if99vR6e+HJmjFLtkMxqrpk/5MblIvsDSDqg7GLBYKkK9JadMVG8t6A
         kLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749507706; x=1750112506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3GnHlW8OR3yKZlpcBChKbWMXbjZEozkoitwJHBTukc=;
        b=t2O9+eVl25IEy45i8nVgiSoo9jp/OOIswCQiJYPmvc51kqmCP76+Ktg9hvFTGpeohE
         1MdVWVLrttEr8prxWqkDNkDgnt2tr2cs1qXrjawLFmKBDS+jFrvgN+7sdNvAgofV4Wm1
         MKgGkmICVfFD9lpqgaQcvnlWjPRKM8ktbFZsWw0wH1MRJhLlZNhelsTBsutrIaQXva5z
         mBBS6NHUEOMepLmhLw7ExxMLOEIWmzTMEmG5BzXrekaaiLlchoTTgicEjVz8c/YM+e4h
         mvIwZABJYWzvPyeJTUsgheAN9XuP48X4jiHgUQOGgvWOa2wJpZ0wvLfXDAbl7bUCK9vT
         RX9Q==
X-Gm-Message-State: AOJu0Yzi0ObhFMDVfwv+n5rlNik83N0GOOz+4DSDE9cdZkyNsirjScjB
	Xf+kEQRHZmSgbOOUpnq0BDBwKZTwYIyZKesTbcb1R5s/BzphqfKQkLXtuM/hrsojcbmWMg2JQu1
	TjfapuPc=
X-Gm-Gg: ASbGncvdY2CjbgyLzBTTWEgztE5sdHovWEONbX8JEdeVV++1WYwv4onhtv+k9pALcWV
	qSrhWJATWP0X9Gra2JltkSeZLCpv09wiDlTdARCOEvTYVSaus1MpUJzCFGj3IIx55h0AzhqPh1I
	TvGaT5N6rHlh4JzC9wbF3xieFxbDQhtWi24VewoNdKFc+P1mgX2ABGW8+dVR22LSJZZSCZHsdrQ
	8tkHOmaGMi03DLFCF+x4755MnZ/sWCpScHwx2nW8QNVuFAJ4ciDVTuqXdOmVOme6aDgsTqQB9Bl
	1ty6PgMvqUtqL3EhlVsOMtjeSnA7GkqewLTklgjoHvVRXIxnR+j5BFOZMyBPdYTjaHbMZu120fo
	d7Z4217ZSakFhAqI3VcSCeWFoiK4=
X-Google-Smtp-Source: AGHT+IGDkqvX50gZmKwECs6ah4V2FkoOHoG3KHrk0OlWAmeTt+75cDiv+AflIcSgpAO4qpyPia+S8Q==
X-Received: by 2002:a05:6870:8a23:b0:2d6:b7b:a83 with SMTP id 586e51a60fabf-2ea7cff3296mr186617fac.13.1749507706091;
        Mon, 09 Jun 2025 15:21:46 -0700 (PDT)
Received: from ls.ts.net (fixed-189-203-87-169.totalplay.net. [189.203.87.169])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea072e5d0fsm2086118fac.24.2025.06.09.15.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:21:45 -0700 (PDT)
From: Anibal Limon <anibal@limonsoftware.com>
To: docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com,
	erik.schumacher@iris-sensing.com,
	yoann.congal@smile.fr,
	Anibal Limon <anibal@limonsoftware.com>
Subject: [PATCH] test-manual/ptest: Add info about fail state of ptest-runner/ptests
Date: Mon,  9 Jun 2025 22:21:43 +0000
Message-Id: <20250609222143.3275-1-anibal@limonsoftware.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Jun 2025 22:21:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7034

On the ML was pointed about no specific information about
ptest-runner/ptests so improve docs around.

https://lists.yoctoproject.org/g/yocto-patches/message/1622

Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
---
 documentation/test-manual/ptest.rst | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/documentation/test-manual/ptest.rst b/documentation/test-manual/ptest.rst
index 2c021af51..3b50e354a 100644
--- a/documentation/test-manual/ptest.rst
+++ b/documentation/test-manual/ptest.rst
@@ -46,13 +46,19 @@ Running ptest
 =============
 
 The ``ptest-runner`` package installs a shell script that loops through
-all installed ptest test suites and runs them in sequence. Consequently,
-you might want to add this package to your image.
+all installed ptest test suites and runs them in sequence.
+
+During the execution ``ptest-runner`` keeps counter of failed ``ptests``
+and use it as exit value, failing the execution if any of the ``run-ptest``
+scripts fails.
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
+   :term:`SRC_URI`. Be sure your *run-ptest* exit with 0 to mark it
+   as succesfully executed.
+   Here is an example that starts a test for ``dbus``::
 
       #!/bin/sh
       cd test
-- 
2.39.5


