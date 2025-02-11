Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C951C021A0
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 23:48:02 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.3121.1739317678484021993
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 15:47:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2E5iQuCm;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-439585a067eso2108325e9.3
        for <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 15:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739317675; x=1739922475; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuHJaD4yw1/juaRIFM8FpTu0tEaA9kxCHhwiYlFX1Zs=;
        b=2E5iQuCmEvvwGAUuALj45PjQiomtbJQXvBnSIF3BlZ6Lccgta/9oCjvs2haGGDxq7f
         h7jDIDg8siOt6YHd1Lcb5u9LvUzTkG1hhxDu4w+khqZ1sC9Exnps87NtcKF9uD+9CQSD
         owzspApoja0IualYAePCev9I1TiMtDlISStl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739317675; x=1739922475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CuHJaD4yw1/juaRIFM8FpTu0tEaA9kxCHhwiYlFX1Zs=;
        b=GXCW0TgNNCWqlplrD771hYaVrpzj+UmvyuMoa+jdghECidaWUD/RVOvSyrrmAJ2brK
         NU2GcgOxqUq6C1AO6miuygql/Y0XQPEWNcbiT7ObSG4Ky9iTx2+FpOj3x+rODg/2zdQy
         LhtPtYk4n5DucsRw6ajyaHYQxepgp1ic+d4cxx32e6kCTJXCp9lWljPyu+TAZQbAi91q
         dRsYBdlcK4WMCyBf7TcJKoX3xi5VX3evqweI0mmK0Wm5fVnudCvQ9nDRDWpI+Qv2jVYV
         SxD4S4CHDE8ggQ8qkOk0KBkenaMlxUJyxRJ7amLEh1nVIqfUWJXB1JkkgcGp2oMdcsNx
         NHBw==
X-Gm-Message-State: AOJu0YxV1e+zGWko9yHTUG/LVpWvIfz3bc79jaF7X1HKC/pI7SE3Mhwy
	KabWhTtvK3S7RhgSEsXjmIvTG6N1OqFcRMjAo+Iov9K1EWKmDzW0n6W7pWnC7Kmrx5KzayvFHaJ
	2
X-Gm-Gg: ASbGncv/1XT50xk40cuVexoMvqghjGTGFKKITtwU49n+kUUheYAPn/CTf7d3JVuQ1nj
	VJBq9B4VYj/G8yq6AheZyHVUkbAxZy3raeLMPvGajPEFZhVUvPQE1/xpIof2Ftmp4GZ+qJLZA2q
	Sc5BnRdTSGDjXHKrpVix2Lt4tBXGVWbqBOKoQ139BzQ6xZHE0p66+M+pp5TPhr0nwLX1USpn4cU
	/55Lr1T2t3PmFmMxDsZiGtr8jfj0TRUY+TRpR1PavlojMmuJYsmCbOVoMFFk1tw72IMlV0TMHEc
	ac1bWiuKnM5ZwQaJVYyv/GXaUkBVkXxL5Mxc
X-Google-Smtp-Source: AGHT+IGuKTGFzy9upALwg7HDEdTTpVWYn41SXTQVHWWROJaGNQR/w93u7ui8JxmqLeeuhUe/WHKu2g==
X-Received: by 2002:a05:600c:4fc9:b0:435:32e:8270 with SMTP id 5b1f17b1804b1-43958176b4emr10410295e9.14.1739317673919;
        Tue, 11 Feb 2025 15:47:53 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([2a01:e0a:c04:ba00:b2b1:fd05:9faf:4037])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b8397sm2413455e9.36.2025.02.11.15.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 15:47:53 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Subject: [PATCH v5 4/4] release-notes-5.2: Add new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
Date: Wed, 12 Feb 2025 00:47:38 +0100
Message-Id: <20250211234738.2633971-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211234738.2633971-1-yoann.congal@smile.fr>
References: <20250211234738.2633971-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 23:48:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6348

From: Yoann Congal <yoann.congal@smile.fr>

Add mention of OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS to release-notes-5.2
to users can use it after upgrading.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
---
v3->v4:
* Quentin's review:
  * s/single recipe/recipes/
  * link to sstate
* Reviewed-by: Guillaume

v2->v3: Antonin's Review:
* Add OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS ot release-notes-5.2
---
 documentation/migration-guides/release-notes-5.2.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index b0e538700..417b202cd 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -17,6 +17,10 @@ New Features / Enhancements in |yocto-ver|
    -  ``linux-firmware``: Add the :term:`FIRMWARE_COMPRESSION` variable which
       allows compression the firmwares provided by the ``linux-firmware`` recipe.
       Possible values are ``xz`` and ``zst``.
+   -  reproducibility: Add the :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
+      variable which enables a reproducibility test on recipes using
+      :ref:`Shared State <overview-manual/concepts:Shared State>` for the
+      dependencies. See :doc:`/test-manual/reproducible-builds`.
 
 -  Kernel-related changes:
 

