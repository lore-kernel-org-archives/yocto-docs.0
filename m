Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D902C021A2
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 23:31:52 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.2758.1739316710632241981
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 15:31:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RctT+SMp;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4395578be70so10582465e9.2
        for <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 15:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739316708; x=1739921508; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuHJaD4yw1/juaRIFM8FpTu0tEaA9kxCHhwiYlFX1Zs=;
        b=RctT+SMpSJOE23aq8dKTQw+3fQ/h5HxH28V1nU6KpUzrhQW6iu2LKpL68GLqDvIUqE
         2fCFSoc0A1jPVxia0SOylTmuOLvq2yuT4dy0o9yrY6MLvjXnVc2X1OrSBwa31z/Yg5ig
         +GB0KJ58FPqTteg+eCPFPmb8JPMOyIStdEWvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739316708; x=1739921508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CuHJaD4yw1/juaRIFM8FpTu0tEaA9kxCHhwiYlFX1Zs=;
        b=nnzSeF7Q4uZRr20AovfxxNIjaiABT32p0L84XtNj0q3FSKd6S+PtT2Y/enhbiq4qnz
         Tyj55yqYy0v2ZyBYtxOQaHPOiuOd4Hh44J6kEwDP47PbgATaKP5ClyfbxxMTE8Mm0PeB
         V/kTDvisBitMgBKM1RMJ+m/AgkXgwLKTqdlXIZmYWg580w5P+43OWaYsksDHKaPAJHCS
         tR3bt8n0i2ouOTNhIy1JJXEuR81gYfxC37kTgEKpX0RUc16puJRYcj4ISvzmT2nXUVU9
         ZtnU1PTiDbtGMNRKqDE260pYfRkWiKUHNXJcuGMwAyNxlPQy2D/74sxal2ZSZ+AT+yKV
         svEw==
X-Gm-Message-State: AOJu0Yy3gTHTnGTiufZrQCeWDzCyk2JDzzhe1LRg2ru+3FwLOh9G5tpg
	IcxU8D++vRWkpHN0tfbDsIVw9ylhQSVdT6FWbUcN6JMAqKBFPslSfQVp8wn/HM7ksm8qKYJTu2/
	s
X-Gm-Gg: ASbGncvBtkBu7vQYZDaKYb5EIrTIwGvbh2QFf1MJTSlXXv6IOZrk//gRzBEzyW/chvy
	Rj5XfyYetMddZuCwWpvnffg8Csv7207drlV19WrMRAg1ez0iPofqazzTNYs3oQ1I2phOdYiatR3
	hPKrMyAhMnypChj2O5aOlbzbyOgZUhRs3dUFpRRjIPeUyF6NsUqsGLznyzehXYx/AUVtLYsWbTk
	bFzY/siLW7o9mW3zoEuoZqyK1Atzh58KanWg/M3E5mLBAMt2VDoWBkBoczTxZYM3M49ootMBgYx
	aV/Iy2VlxnDokZqRGHakp1gXZ4KgYvW6Q++S
X-Google-Smtp-Source: AGHT+IHWfiFYwTg1ncukOUpJXTGxe+8AHpbpBpkc6b6n74AmHY8urhNFbPbehgMdsqrecXnBV1Ailw==
X-Received: by 2002:a05:600c:4e16:b0:439:4dcc:f6ac with SMTP id 5b1f17b1804b1-43958157a37mr8387815e9.1.1739316708313;
        Tue, 11 Feb 2025 15:31:48 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([2a01:e0a:c04:ba00:b2b1:fd05:9faf:4037])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a04cd94sm2367475e9.7.2025.02.11.15.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 15:31:48 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Subject: [PATCH v4 4/4] release-notes-5.2: Add new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
Date: Wed, 12 Feb 2025 00:31:11 +0100
Message-Id: <20250211233111.2632384-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211233111.2632384-1-yoann.congal@smile.fr>
References: <20250211233111.2632384-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 23:31:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6341

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
 

