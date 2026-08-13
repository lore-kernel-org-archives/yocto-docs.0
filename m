Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B7AFC5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 18:56:16 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26287.1786647373148960665
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Aug 2026 11:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=caMjT7Me;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so2228935e9.2
        for <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 11:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786647371; x=1787252171; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FiL37nofRHMe0Qa6Za28zoH5tyovJdl1L2dTcWpFvyo=;
        b=caMjT7Me1VPCr3FpofKNfWkoABNqNe2WjdDV5L/nFZzjGDSaK6CO22piqsOw30XObD
         +KeYysL6kRRWWceavYBs072XDdwLoPLgG+0RAUPv2EeqCXs0hsju2ZcrwKeOHTeXQ5RO
         TQLFNdFfxURJeZKqw9bfROb18DPWnuvMzWUJ3LvGQ+vQ0LBbi1w0uVIx2b5vGOSOalza
         IICS0aaN2b2kLbTWaPUB4OSG5pYCy63fdAA8bjnX3rJAXR4/LQD77u3tHutFK85X9h0D
         Q6YNXSOCowGkCAG2RT4ppJIo8mEJAumH80DDhef95hcMrg8FPIi0Rpt5iZf+PYv1j+Wx
         EoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786647371; x=1787252171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FiL37nofRHMe0Qa6Za28zoH5tyovJdl1L2dTcWpFvyo=;
        b=GsK0XXJGyXA0evPQRhmAnZ0oqGT3WRuHXwVLlW+PDeIRQ10qi7PwDLzy7/t/uJEVnf
         NLtWT1THUIS4m7cGTvETJjjxdfZ7gK1THXQvvuCoiJswZOzAXfuxGhYOgJuJwER9zMyA
         EkFwY0spjYScySXj6omchscQqvBK7IatjFf2S4gq2JF1sY+TlU/V0V1e7gUCRZioxYcp
         DolmeFjkTxLAz29IpbnyG6TXXV02xgfrUBo9L2eQMM0DwcwZPxAdmHRhtRHBd8jNlWKO
         /VvqsVxelrp/gle062KVeG3Ja9MdnpM9mWANV9Gd3CeTua5VIYw2AS3HZVWt+ondyVll
         5d+A==
X-Gm-Message-State: AOJu0Yw4yKQ3TT6tMqY9rSYxDZkXYz4JOG5SLYz5vd8fxhRdcqmsGF6t
	rMfyzJagNg37+7LPDHAqKJAO2bWTueMoO6KJOKMgHdNRhbMOEChOYan1niOijz6Mpc8=
X-Gm-Gg: AR+sD13IXeinWJG03i69ZesHmJE1UL0CqpOIMK4zlvGmLn82p+4/Y6+NOCHIaG3Xog9
	vsnQ06+yrXJ9szwDujfYevhkcY1twZmKBPJfuqd8JRR52+Q8Sgx1d0SqVKUlF6CyPb1yOEYJltQ
	xmsJ8sUO+UotDNVnHfIkhQuNEMjoN858WnZdTntBlpZsP5V4TZ6T+M3GrrL/gZHbcvRMI7+BFLw
	XxOmEwqZzB4zkZffUYP+hzzePA/KJZ8LKvjIM38USL+7e/hEqyE2J1G7lT1IY/77HP7VGVXc72x
	KJZUm/ycXxUT5fQKl0/ZOFqFphRpjgFy+/J7ShlI2zxbAG8pswUAw490RaSUHi3QlZDnIOojRX5
	qig7WfUjrbwDEVjLiKlQgKp6mw2fKv4QsPkNm4E7yQyyVdvhG12KUyF8lQmph6jq89rlobiWbjV
	4foUvSURQIxFFoL6Cl6ydSbNlA/kCkuOIIp+TTtFeGTft6yL6EE2joxW9nUM0qSP/OWb2nrs95n
	U1rt1a0GzSkqlds8o7jKEdHrL20QW/GtBcFiRVXl4YXTkXHxNr8RqPP3J3Z59r4iqaNT1BkBY9k
	hRjA0NQfa6Y=
X-Received: by 2002:a05:600c:4f4a:b0:496:bbce:f3 with SMTP id 5b1f17b1804b1-49987938c3emr7145745e9.6.1786647371201;
        Thu, 13 Aug 2026 11:56:11 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:75b8:c973:c30e:1f9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981b62894sm80491475e9.13.2026.08.13.11.56.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 13 Aug 2026 11:56:10 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: docs@lists.yoctoproject.org
Cc: anis <anis.bougrine10@gmail.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [docs][PATCH v2] ref-manual/tasks.rst: make do_clean description more explicit
Date: Thu, 13 Aug 2026 20:55:52 +0200
Message-ID: <20260813185552.47183-1-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 18:56:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10289

From: anis <anis.bougrine10@gmail.com>

The current do_clean task description is generic and does not
specify which files will be removed.

This commit adds details about the files that are removed by
explicitly listing the affected subdirectories.

Signed-off-by: anis <anis.bougrine10@gmail.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
---
changes in v2:
- Submit the corresponding OE-Core changes, which have been merged as
  9b363e6d586863dc5e49795df9f1346836c466c5.
- Reformulate the sentence based on the v1 suggestions.
---
 documentation/ref-manual/tasks.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index 3517d0b91..fa6ba255d 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -17,7 +17,7 @@ you can run:
    $ bitbake -c listtasks recipename
    do_build                              Default task for a recipe - depends on all other normal tasks required to 'build' a recipe
    do_checkuri                           Validates the SRC_URI value
-   do_clean                              Removes all output files for a target
+   do_clean                              Removes all output files for a target (``${WORKDIR}``, sstate manifests and stamps)
    do_cleanall                           Removes all output files, shared state cache, and downloaded source files for a target
    do_cleansstate                        Removes all output files and shared state cache for a target
    do_compile                            Compiles the source in the compilation directory
@@ -501,9 +501,10 @@ You can run this task using BitBake as follows::
 
    $ bitbake -c clean recipe
 
-Running this task does not remove the
-:ref:`sstate <overview-manual/concepts:shared state cache>` cache files.
-Consequently, if no changes have been made and the recipe is rebuilt
+Running this task removes the working directory of the recipe (represented by its :term:`WORKDIR` value),
+the sstate manifests and the :ref:`stamps <overview-manual/concepts:Stamp Files and the Rerunning of Tasks>`.
+However, it does not remove the :ref:`sstate <overview-manual/concepts:shared state cache>`
+cache files. Consequently, if no changes have been made and the recipe is rebuilt
 after cleaning, output files are simply restored from the sstate cache.
 If you want to remove the sstate cache files for the recipe, you need to
 use the :ref:`ref-tasks-cleansstate` task instead
-- 
2.50.1 (Apple Git-155)


