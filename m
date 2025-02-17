Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E789C021AA
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 22:06:35 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.5929.1739829993820609931
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 14:06:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IM4Zv2vI;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f22fe889aso3798791f8f.3
        for <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 14:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739829992; x=1740434792; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNL1Ir+vyJQD7W6nRY42cK4BaBh4vTRIDlqSl/3C1Cg=;
        b=IM4Zv2vITrBEw4AI3nVdqZkC6yEWpPiewdFwtKK0mKALOGEIjN0z5CIxK1x7b/VOw3
         7huJ3ns+sQzoOG/Z+cbGss64qotRyGgtokfNQYQ0fU7k/Z5Ir+JIjcErDD1Qxv/hkyrO
         HUWRSX2UfeqB4TuS08vYFxgZ0jxmrbZ8/l7p0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739829992; x=1740434792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNL1Ir+vyJQD7W6nRY42cK4BaBh4vTRIDlqSl/3C1Cg=;
        b=H+VKpUfLH3pF3Psj4+CPEulvF+M6k43DZXTYVo/xEZkmCEk3GiJb1kbLWl1icjOLOS
         abXQIcjNG3znGOCHue+oPSw4IjrbsOcAhVeU9EBYmxtpgVFfO6zBKHr2h6MgASKwXnGf
         EKrk38WJbtCYecM+M7GQ/j9J/5IYhl1Mf82/dJoXEsMReXBxdSXI1QVYQ0MT/buOWDfX
         Gosc00uIan1ZxhdtK4rMlSXrBfJbcjd5Gesi4AWIiD9B3/x8JZETTTsJTsCOqTQSNF76
         V/v7wztCPuvdzGptiSmtdBU8FBvQAIgnsixwX/QKuG61tYdMJ6uEvJZHX7GNi312gsn+
         Ck1g==
X-Gm-Message-State: AOJu0Yx+wknwxBckvjdJyHE8u7DaawmD3AjQavU1P8HJRSSb7rPipvlf
	/oiNd02ok19gghEvPu33mUd4YH8zvufAaZ+jS9n/N03oWgg47IYgtDnpA0ChuWxa8u/4nI2l9T8
	Z
X-Gm-Gg: ASbGnctNKPFm/FpD5kiNARh95qwWk09uNuHnq5hnU4Dtq/gt5t4kdpGaeZN3u5ZanCC
	Mb7FLPpcXQmGtUEcILb6ttXBdU8R7CufYDwwW90dkFu+gC8D9L7MGus6oseYMSpphWawJA6AmCP
	MHv1OX27RcNuZ7V6v9oSgSJT4XQt4LRE1/zGcMc4fka06xQum8GbeCCau/85X0RQ8/Bml9d1uD7
	UtrmMoWkb0XYi6XbqQ4ehYj2qhh8+v4hLmcul1eSjbJ4OIFYjFAsyljUPDy333saQFiE1YD9Y8J
	/JtuPt+zzP7ReDk6Nhocf//PCxtMSmPkqxjGZoosZS6U36yVF51vfo8yw87AqY7HDEuN+lZZLoN
	SXHFzsst5UsE+P5jZovj2LXE=
X-Google-Smtp-Source: AGHT+IFSxF6af2jmmeTIir5kfobHx5EvxgiLTYH6upMn5a6aHR2VMXJqxJaiUL/8J7ScRAMbL4oKDA==
X-Received: by 2002:a5d:5f4a:0:b0:38f:4244:68cb with SMTP id ffacd0b85a97d-38f42446bfbmr5651807f8f.12.1739829991643;
        Mon, 17 Feb 2025 14:06:31 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local (2a01cb000deef000fa5d724a12d076e5.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:fa5d:724a:12d0:76e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7987sm13033958f8f.87.2025.02.17.14.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 14:06:31 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v6 3/4] reproducible-builds: add a "How to" section with OEQA* variables
Date: Mon, 17 Feb 2025 23:06:17 +0100
Message-Id: <20250217220618.1999362-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250217220618.1999362-1-yoann.congal@smile.fr>
References: <20250217220618.1999362-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 22:06:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6408

From: Yoann Congal <yoann.congal@smile.fr>

Shows an example of the new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE_TARGETS that were
shown earlier.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---
v5->v6:
Quentin's review
* Proper highliting (:term:, :ref: and ``)
* s/varflags/varflag/
* Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de> (Thanks!)

v4->v5: Quentin's review:
* use :term: link in title

v3->v4:
Quentin's Review
* make missing dependencies more explicit
Guillaume's Reviewed-by

v2->v3: Quentin's review
* Double tick quote variable in title
* Removed Guillaume Reviewed-by (given privately)

v1->v2: Quentin's review
* tick-quote variable in title
* a set of recipeS
* 3 spaces to align a code block (not 4)

---
---
 .../test-manual/reproducible-builds.rst       | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index b9f671d68..8559cbcf0 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -145,3 +145,24 @@ set of recipes before the test, meaning they are excluded from reproducibility
 testing. As a practical example, you could set ``sstate_targets`` to
 ``core-image-sato``, then setting ``targets`` to ``core-image-sato-sdk`` would
 run reproducibility tests only on the targets belonging only to ``core-image-sato-sdk``.
+
+Using :term:`OEQA_REPRODUCIBLE_TEST_* <OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS>` variables
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+If you want to test the reproducibility of a set of recipes, you can define
+:term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`, in your local.conf::
+
+   OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS = "my-recipe"
+
+This will test the reproducibility of ``my-recipe`` but will use the
+:ref:`Shared State <overview-manual/concepts:Shared State>` for most of its
+dependencies (i.e. the ones explicitly listed in :term:`DEPENDS`, which may not
+be all dependencies, c.f. :ref:`[depends] varflag
+<bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`,
+``PACKAGE_DEPENDS`` and other implementations).
+
+You can have finer control on the test with:
+
+- :term:`OEQA_REPRODUCIBLE_TEST_TARGET`: lists recipes to be built,
+- :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS`: lists recipes that will
+  be built using :ref:`Shared State <overview-manual/concepts:Shared State>`.

