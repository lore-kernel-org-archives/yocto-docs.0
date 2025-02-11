Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E8D2C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 23:48:02 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.3120.1739317678469101163
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 15:47:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CvXF17UI;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4395a06cf43so620625e9.2
        for <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 15:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739317675; x=1739922475; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uk8zSEDFD3nV13yKSg6Em+toZ4yWfDVU3DLCJc1NHTI=;
        b=CvXF17UIYygWMDgGcGQMCaqeTbhN6zkEP7kce7ZoSwcaF/70eb/NXG8WwlqAiTmIRJ
         n/Q2gdkkvW3m2U1/Ygxi5Ld64EqUvmfD8mPaxAnmPb9ImMMfF2T5aLEJgP/XpCRwmNQd
         dKCBWakVwW1JulpW1gLsGGq7sbq8pQUx5gmwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739317675; x=1739922475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uk8zSEDFD3nV13yKSg6Em+toZ4yWfDVU3DLCJc1NHTI=;
        b=fEDrz9R+XLNqtFAfaHky9kSiGgJ98yxWlT1EYBlA72f83BoHKNKhSV3KaYBZzK/muT
         YBCbjcHgKlvLO1V6lGwee9pRg+Jdw9/FZd9hAAjO0xCywKQWdw8zMcyKEt+0lW2lkL/b
         rn+eFVaSoZJ0GWBZozKU16fSfCOpFZLohkJ8qI3r/cDHGDR8/aAr441QUsauv6JaYT0y
         Ui32pwNsXFMCM07DeETRs+vC4FtmdwZbN4n/iiarzNTL3bZqGeaUllEY9ck0uahB0rFJ
         F/45Y9OUR7cVAk39z0fmVQaHFgvjSALrgW0h9mcwBeq/5VnZdJ5FAVrNzuzqe0tDmPcX
         Rvww==
X-Gm-Message-State: AOJu0YyqlNxJyjLc7skNF+QZo7ZOrKCs4CK4xCXR5tBdLhesuMajejm6
	1ABuCvAQrsAj5kL2XOxmImVKxZc65CWfAqqXASLD9bae7HC4EYWDMfZ6KO9r2FPZq5YZ4jX91Pa
	m
X-Gm-Gg: ASbGncuYupuK/uzInJnogmkOqOVyclTqB49YxlOPQ58toiinLO3Gm//xmvRsHE+Jo6Q
	VoJv5IFWPvdYMRGYXD/FtEptvxr5x+6E+IGSbuU3kQDUUJV3fKLruodCDFlTeicWEHvqZzOcY0K
	ZCMhSDpumolMdpr7SggahNNvXa1Gr5+O1exDb+kYhSKamYSFYwRQZxHAVru8+JL3bN8FG687Dzj
	pY8VokOhkmaMGImSbB0P7koIifJ/PMF0nHGk10iCbW3QrJ1nDBbqcRadzfFtynPbcCcVqs9XKKZ
	cqsMQ1RMIH4QMk1nRFkkx//oM6VEHaTlrFUa
X-Google-Smtp-Source: AGHT+IHrT/J7jcY6EH85JOsdfuQYbnLOgGiYquCzfLmae8HGGZhiQK9WHiFpJSAMXBBPQUpPmNzeaQ==
X-Received: by 2002:a05:600c:46c7:b0:434:eb73:b0c0 with SMTP id 5b1f17b1804b1-43958165e6fmr11122625e9.5.1739317673394;
        Tue, 11 Feb 2025 15:47:53 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([2a01:e0a:c04:ba00:b2b1:fd05:9faf:4037])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b8397sm2413455e9.36.2025.02.11.15.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 15:47:52 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Subject: [PATCH v5 3/4] reproducible-builds: add a "How to" section with OEQA* variables
Date: Wed, 12 Feb 2025 00:47:37 +0100
Message-Id: <20250211234738.2633971-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211234738.2633971-1-yoann.congal@smile.fr>
References: <20250211234738.2633971-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 23:48:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6347

From: Yoann Congal <yoann.congal@smile.fr>

Shows an example of the new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE_TARGETS that were
shown earlier.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
---
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
 .../test-manual/reproducible-builds.rst       | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index b9f671d68..b913aa4ea 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -145,3 +145,23 @@ set of recipes before the test, meaning they are excluded from reproducibility
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
+:ref:`Shared State <overview-manual/concepts:Shared State>` for most its
+dependencies (i.e. the ones explicitly listed in DEPENDS, which may not be all
+dependencies, c.f. [depends] varflags, PACKAGE_DEPENDS and other
+implementations).
+
+You can have finer control on the test with:
+
+- :term:`OEQA_REPRODUCIBLE_TEST_TARGET`: lists recipes to be built,
+- :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS`: lists recipes that will
+  be built using :ref:`Shared State <overview-manual/concepts:Shared State>`.

