Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F27C7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 16:13:32 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.3729.1750349603076636976
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Jun 2025 09:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=Uz1CwcmA;
 spf=pass (domain: limonsoftware.com, ip: 209.85.210.175, mailfrom: anibal@limonsoftware.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7490702fc7cso190269b3a.1
        for <docs@lists.yoctoproject.org>; Thu, 19 Jun 2025 09:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1750349602; x=1750954402; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKoJq7845Z+stEBPYrBsO2CY758D7F/7zzw9sI9kaeQ=;
        b=Uz1CwcmAD/heh63dFyn6u+tBsPwdYzzy8pTpDVctojLqUVL7DhXY+foacPyy0GQII2
         HJiQ7DxMG3Kk7zrIlVbAo8SiXXuXEvYU9wQcLJlvh+0KvDV61wwtp+d0XmB1DsL8N2dD
         HUqVKe3UwqRhm4hkibxq2jJpMKWhdMJBUtLlJJDxXt8BsASoogZc5B4HPAOfwPNP3780
         2faVNZ8Iuoca+fm/XRlJBpC0UCCi07R1wtTQ9MSw57CQM/31GhyVGWh/rrmlbAWwpDAC
         CHd4fNXvKQewZthXtBQ1uST3/XkiswVa+7zQbwS9zDuL7SAW0bS7abHosTLOQ4/J0Oz8
         EzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750349602; x=1750954402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKoJq7845Z+stEBPYrBsO2CY758D7F/7zzw9sI9kaeQ=;
        b=gSdhPuhU97QHiyBH2qJPAG69Cj/ckGzdhDa0fLSXvOri3RDIV8VlIJ8o2gd0+CUlb/
         /18diFyztya+Yml4jcKWmQprwXdZ4KRMXWrLsDcM72kl7KcMIw9L3A+Acfht8gUohtwK
         /hnFdf2z2HzrVjL8+FKuDgZKZPXfmx3iqj075sVGFyrQR+QtkVNnKj4CUAgkbqdcerZ8
         Up4wS7NKQzUVU8neIAiz3e1GsJrpQdADiDUtpBI0/XmSNSrzhEidkgPhmsi8od2mrgJv
         wDKVyWdAQuoV94bkfpOLZ9CMcxLlU2G1cGJCYVXUeNuDKY3g7whHPH/0g4MEVeNbxE2m
         I7Yw==
X-Gm-Message-State: AOJu0Yz4N10hBaYS48MzlJ3EJlgawzCBW/GJb01ZsOJD02c9xn9y1Ujw
	/4E21p5mcvVZpzenPfrYtUjJEyzWrOC+kX7Syioe7DBffj24NIZCEbakTH2cqtaLHA3+xxD2zl7
	WbhQjiEM=
X-Gm-Gg: ASbGncsv2fhhW+H2LAMO+9OxUUVU7aF5vB2gpkQoxdGQRitEjcYPhtabWLzlJ5krAtp
	Qi386aMDVKIQ/4SY9NJWh1N5h74SCjFMRk4AZZ2w3K3JtDo8RX5+GEkPmbmoPvb7uMnrrnfN8oj
	FIW0JeNNsSVqgPbJg6SfquTEd/Qi90vunOanwYCPBZW66Op2GHRrB/ChrW36hgwEC/LPSqUvyzN
	pKzDNBnQQ82DIE2MPTe8GExoPvD0MdsJ7TUwdkGn2spBYdsKA94yUP700hDRMU2kvP+Bb26angU
	jpLMI7PKu0XE0CTro7IgFY/f+L6pOitQfRzGORkuJMLpZoAIi0QKYZBICHzR1Q3wvTB7+kfzP8+
	CeAqULOavcY0+gTBo/v8cducgjPrckDyVSttpHw==
X-Google-Smtp-Source: AGHT+IFCLxjPOYEtLu7uaYz1k9v2GMPCMbBAnNGdEmiPse9zTMssmZb85N+0swAz2KrW12Og3qzEZg==
X-Received: by 2002:a17:90b:5242:b0:311:b005:93d4 with SMTP id 98e67ed59e1d1-313f1dac10fmr31713065a91.25.1750349602300;
        Thu, 19 Jun 2025 09:13:22 -0700 (PDT)
Received: from ls.ts.net (fixed-189-203-87-169.totalplay.net. [189.203.87.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a258205sm2375493a91.36.2025.06.19.09.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 09:13:21 -0700 (PDT)
From: Anibal Limon <anibal@limonsoftware.com>
To: docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com,
	erik.schumacher@iris-sensing.com,
	yoann.congal@smile.fr,
	Anibal Limon <anibal@limonsoftware.com>
Subject: [PATCHv5] test-manual/ptest: Add info about fail state of ptest-runner/ptests
Date: Thu, 19 Jun 2025 16:13:15 +0000
Message-Id: <20250619161315.201350-1-anibal@limonsoftware.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Jun 2025 16:13:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7112

On the ML was pointed about no specific information about
ptest-runner/ptests so improve docs around.

https://lists.yoctoproject.org/g/yocto-patches/message/1622

[YOCTO #15832]

Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
---
 documentation/test-manual/ptest.rst | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/documentation/test-manual/ptest.rst b/documentation/test-manual/ptest.rst
index 2c021af51..4e6be35df 100644
--- a/documentation/test-manual/ptest.rst
+++ b/documentation/test-manual/ptest.rst
@@ -46,13 +46,19 @@ Running ptest
 =============
 
 The ``ptest-runner`` package installs a shell script that loops through
-all installed ptest test suites and runs them in sequence. Consequently,
-you might want to add this package to your image.
+all installed ptest test suites and runs them in sequence.
+
+During the execution ``ptest-runner`` keeps count of total and failed
+``ptests``. At end the execution summary is written to the console.
+If any of the ``run-ptest`` fails, ``ptest-runner`` returns '1'.
+
+Consequently, you might want to add ``ptest-runner`` to your image.
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
+   :term:`SRC_URI`. Be sure ``run-ptest`` exits with 0 to mark it
+   as successfully executed otherwise will be marked as fail.
+   Here is an example that starts a test for ``dbus``::
 
       #!/bin/sh
       cd test
-- 
2.39.5


