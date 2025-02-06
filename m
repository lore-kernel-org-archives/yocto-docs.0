Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06E1C0219C
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 21:57:37 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.54488.1738879050202655470
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 13:57:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zRWgJXbo;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436341f575fso16674125e9.1
        for <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 13:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1738879048; x=1739483848; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ad2vTO4TDer++VTch+SjxSmTtW86GPac2J3EWJbUAk=;
        b=zRWgJXboGDAlV9IUF4TWCtWRcsTHcm/0Aalnr1ZqutzNW3W5AxJDB/U5csxTpa9UHE
         RrqxFgqSSot2bzttakYxynU1s2UIM1V+tt6KMKJ6QhYZcz0pbSIymVt/2R1Hdf5jlg57
         9bKmOGQjxORpjC1VjDQGSi8m2J4KiJJvr7rs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738879048; x=1739483848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ad2vTO4TDer++VTch+SjxSmTtW86GPac2J3EWJbUAk=;
        b=IA6iUu0Am2NNYlsrXhiAkgTqB66meZLYjGCwOl+ySV2+p8hWwkpKv1qCVs+G+pZN+G
         coxn1khIborl5f0AonF3iX3dz6J5FgHmN8BkdgfIySvJhqQBfNYc4Hr7sU+iVVg0sbQO
         TOvTb4v4XQ8xAZEt+wSe2b8aXExXp1CnN4Ib66ZnZb5pxQvIBDdRiGrmVLIW9HPAgs8B
         7XwAFSabVsw86yypZox73fEBeWfURvNhaV2rW+p5Yx6myeqgVNfh3hJ69YtnJwXAja4w
         wORoc3S3rzSQc7MPx1FlNENYaiNzLOxlhOy6Ik2nHQOZ1mmNx5jslxRGSSROmzezBZoM
         Ntlw==
X-Gm-Message-State: AOJu0Ywv4fAHSO5AhiP/LQHKyLap/TTDdCAq5wlsOyekgS8Ao+LB7HXD
	/etJemLtWA+UKZSvuc4TLeOqROqC/OqNYXmYpOYsl9NVTHGPXQTlLiZTeOGUufNJczxctOJySfv
	g
X-Gm-Gg: ASbGncvgPsKzCntM/YR8O9FTrF/DKDYXaN8QL3p4WeNkcfIuILi620NkZqbPYOmvQuJ
	pJBYL/fh4tlsjX3rb4+OEmH7qVo95MY7XBTbqoXnbIwcyjaIeQsxfvjX4VKaoTdWHnFIKhQdhF4
	IkBbwFm26qJS+1uo44YSglzdoZcmEoRbIOddqEZDoBvdVI0teWm5CCRENoPyuEWyTnEkdap9HBc
	i+UCvtAIuFvlI9xeo5tC3sEKl3AtYZxxRUCqqULk+73wnE9fdaLuVJJjHsZbY0wTYy09xMRSwAA
	SwxwE7mvar1C6UroBt0LYsJ57NPCfT7T9sCjTvmVGVwjHQMPoSTOUAcdTNGMGUCZf7ROfKOU4N6
	NBoupxg==
X-Google-Smtp-Source: AGHT+IEX2T3krYnQXTezhyNWDIl1FkLhaVTf7VFUCXt6FHz/liQQgLgtHnS5NuRewtW9sXs66WM+MQ==
X-Received: by 2002:a05:600c:384c:b0:434:fddf:5c0c with SMTP id 5b1f17b1804b1-4392497d1d9mr10480235e9.4.1738879048479;
        Thu, 06 Feb 2025 13:57:28 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local (lfbn-idf1-1-865-143.w86-245.abo.wanadoo.fr. [86.245.70.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db11064sm67210855e9.37.2025.02.06.13.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 13:57:27 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Subject: [PATCH v2 3/3] reproducible-builds: add a "How to" section with OEQA* variables
Date: Thu,  6 Feb 2025 22:57:11 +0100
Message-Id: <20250206215711.154194-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250206215711.154194-1-yoann.congal@smile.fr>
References: <20250206215711.154194-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 21:57:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6269

From: Yoann Congal <yoann.congal@smile.fr>

Shows an example of the new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE_TARGETS that were
shown earlier.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
---
v1->v2: Quentin's review
* tick-quote variable in title
* a set of recipeS
* 3 spaces to align a code block (not 4)
---
 .../test-manual/reproducible-builds.rst        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index b9f671d68..77c15d6e2 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -145,3 +145,21 @@ set of recipes before the test, meaning they are excluded from reproducibility
 testing. As a practical example, you could set ``sstate_targets`` to
 ``core-image-sato``, then setting ``targets`` to ``core-image-sato-sdk`` would
 run reproducibility tests only on the targets belonging only to ``core-image-sato-sdk``.
+
+Using `OEQA_REPRODUCIBLE_TEST_*` variables
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+If you want to test the reproducibility of a set of recipes, you can define
+:term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`, in your local.conf::
+
+   OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS = "my-recipe"
+
+This will test the reproducibility of ``my-recipe`` but will use the
+:ref:`Shared State <overview-manual/concepts:Shared State>` for most its
+dependencies.
+
+You can have finer control on the test with:
+
+- :term:`OEQA_REPRODUCIBLE_TEST_TARGET`: lists recipes to be built,
+- :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS`: lists recipes that will
+  be built using :ref:`Shared State <overview-manual/concepts:Shared State>`.

