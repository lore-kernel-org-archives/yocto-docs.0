Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BED7E75437
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 09:05:17 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.103951.1696323910115450040
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Oct 2023 02:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=CDn5dhV8;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3232be274a0so2415141f8f.1
        for <docs@lists.yoctoproject.org>; Tue, 03 Oct 2023 02:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696323908; x=1696928708; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lnZhLX1TpxzGAKUwXxa8nu4HAYDyfIMkOYDwNNT8Kz4=;
        b=CDn5dhV8B13XUDb5L54trmsNQqtgCAe6ebuzDxTbsJlHSgwaCRMrIJKx7RK+FIMSie
         aH8y9gBe3dYYazPCJoHXQqbKmyUc+HsGAanLV54vkRf2NSc915osF23whqpe8HgCgZjm
         QQw6fh+Wy5fzSPcWj9+Lb9s578Jxpx5l89nppf2XPavLSIo3BRjcbIkTyi2KAFdlt86O
         aRdCtFagknchVqQ/j7Xxj/wgc9IAYwH2mHKCnvibjFa3qu9yd9Ca52Ik7SD38Q7cEAhs
         knM9rdLdWaw764jzP+jgfQ8GyW6svNdSuz/rX26OdPWJb+nBFqtiVS80bqzIg5uTBSIW
         ++HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696323908; x=1696928708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lnZhLX1TpxzGAKUwXxa8nu4HAYDyfIMkOYDwNNT8Kz4=;
        b=nEOhALkK6N0ndV7Rfcg5s+HuppbozjKN2mQQXYF65FQq4YU7rrtBIVJm3dZwkatFn1
         NKaHHi46SOUp7a+sftwi52y0eouKg9QUQwfoXnC2700fDWkusanqlUnmwjKP+pmFQjMa
         fkK6bilaVcZUhJDhB11AQTmeruswUi9hHRszgn4mQ8z1qVkoC3LvliuV71o315FaPEHq
         jb2clyrxlY8CNWg0zTkAs/gd+0/3FErZH4/qB5EO75VJ8eRL1VJ4mMopuDJ/bxBJTTS7
         T7Y/WQM2M/Ny74GMo4ruSv0qTf+9AHNR/REwf3Y5xbS2/Dmo8PSm5bZ2cNk58zuVkhdh
         DsmQ==
X-Gm-Message-State: AOJu0YyPSqf8rjiwedft25YZpuPgX8gPX69njHpmjDhl5Y+wxoFv7ifi
	tk+HpcPb0z1Bo4Z/LNrW21vLiRGRZCmQi/UXpDE=
X-Google-Smtp-Source: AGHT+IF9OTtkPwiTX/o8AOhiZQQXgRt0g86B1xYX4vfQiEgr1WfpoljyiGmAdgFwPM9z4tyDh14UGg==
X-Received: by 2002:a5d:4944:0:b0:318:416:a56a with SMTP id r4-20020a5d4944000000b003180416a56amr1626048wrs.13.1696323907917;
        Tue, 03 Oct 2023 02:05:07 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id g14-20020a5d46ce000000b003258934a4bfsm1074342wrs.36.2023.10.03.02.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 02:05:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] QA, ptest: Add documentation of unimplemented-ptest QA check
Date: Tue,  3 Oct 2023 11:04:30 +0200
Message-Id: <20231003090430.692589-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Oct 2023 09:05:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4303

From: Jérémy Rosen <jeremy.rosen@smile.fr>

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>

---
NB: This is the documentation part of this not merged yet patch series :
https://lists.openembedded.org/g/openembedded-core/message/188448

 documentation/ref-manual/classes.rst   |  3 +++
 documentation/ref-manual/qa-checks.rst | 11 +++++++++++
 2 files changed, 14 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 3f0d4844e..3eede8c7b 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1480,6 +1480,9 @@ Here are the tests you can list with the :term:`WARN_QA` and
    also inherits :ref:`ref-classes-features_check` in order for the
    requirement to actually work.
 
+-  ``unimplemented-ptest:`` Checks that ptest are implemented for upstream
+   tests.
+
 -  ``unlisted-pkg-lics:`` Checks that all declared licenses applying
    for a package are also declared on the recipe level (i.e. any license
    in ``LICENSE:*`` should appear in :term:`LICENSE`).
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 4a02e7206..cc9afeb7c 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -789,6 +789,17 @@ Errors and Warnings
     use a relative path rather than an absolute one, or to pick up the path from
     runtime configuration or environment variables.
 
+.. _qa-check-unimplemented-ptest:
+
+- ``<tool> tests detected [unimpemented-ptest]``
+
+    This check will detect if the source of the package contains some upstream-
+    provided tests and, if such tests are detected, that ptests are implemented
+    for this recipe.  see the ":ref:`dev-manual/packages:testing packages with ptest`"
+    section in the Yocto Project Development Tasks Manual. See also the
+    ":ref:`ref-classes-ptest`" section.
+
+
 
 Configuring and Disabling QA Checks
 ===================================
-- 
2.30.2


