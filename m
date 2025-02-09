Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2447C021A1
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 23:33:02 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.39927.1739143973311446655
 for <docs@lists.yoctoproject.org>;
 Sun, 09 Feb 2025 15:32:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HnOYT+6f;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43690d4605dso25206855e9.0
        for <docs@lists.yoctoproject.org>; Sun, 09 Feb 2025 15:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739143971; x=1739748771; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzGWfUFZxvb3Rr5bT7Y5Q5ZnDb1QDkBlrLwFD7QemKU=;
        b=HnOYT+6f87glTfkMFUaZpMG2Bvs7PozBAsDa1YP4QobNVUCFnYwadti6oWN6JvPwnW
         DaTJRbH49c7BazJOJ9ZwEUpP7ERJ0V/acebmxx1+Pz1oQXkXrUsnQdc/qh+bi2vKX6Ox
         ZEZGjz3ahNd261FxI5niXKYUVVkrQB7flyN40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739143971; x=1739748771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzGWfUFZxvb3Rr5bT7Y5Q5ZnDb1QDkBlrLwFD7QemKU=;
        b=phif5h5mgC8s4HUuKemIMgNGE3Wb32HwvrkadEcqnX0VF/H9qzz4Hre5+2iAbcUbHK
         YnX453Z+xhTW1eDUhH41pa8SFqgtq8NyNYo+VW5GPymEbu2x2fSoNEDY/XsiT2+j7e+T
         MvJpXOTmO2X+CQHdw3cRcTwpeJg6sjasdk63OJJyZuZ9yMncATsSw9ZJ5v+EEAWiHUfi
         Hf7SpuGt/IU4uyZhVwOEdfLaMe9IRFzSbHz2oS5KsMgQX9vbq3l2zd8ZeEZyn3/P3VUP
         MQGcaVjAy1oOK1ctD/wzYen1GY2vbagnf8fp4fFkjhRSiZmkhJLmoZKL/eBn5m6vp35e
         Z0NA==
X-Gm-Message-State: AOJu0YwI6rwNfLVy0ACDpXRysqrO/y1lj6hwXlZ1sCNGxmKsV611fgRa
	cm1rEwSaQDvFhschLT2xRfdhQX8/NcRv4fn3wVVv9uZqsYtgRUnBeKPUntX51/vpQYJ3CZx9on0
	l
X-Gm-Gg: ASbGncsPjq4G+/tTqrJ8hcx6K7oXLM0xay8z8wh9FYTutKK5ESt05yTnogQomc54tZp
	oO86WIJ5hwgzOtSWjZusKIvkDGVfqTCK1hGqYNrSjzum4xw1UV0b73NhwgZXilEK0v+aglwQ/r7
	Nv8UEdTxikSFqbB+Pld9z34aEzYyV49p1n+ILO4nm/CV99PRXPHnEuRl+9apCdDYdTdWpZRP2cI
	SC+g9hYVq04QnXDzRWtRjd7Doth9fFy+a6k5YEVS3mVSke5ON2DLK2myoMjU2FhtdNoO/+TXdWi
	lxdPbf9P7cRRfor1WSBHYTi/AMOirZgFs8yJLSW+fiJvyKPrD+OBZ3PDeckZEPN23n+neL25q9W
	+A9jBoBrrZDK0xE56Gsu3dA==
X-Google-Smtp-Source: AGHT+IEYAW4UrgvtQXU82q/UPxxzMdDJO/B3pEHhvIjLLBmVIVcqnwUbkv0qI1eCzm8xlRbETuRvLA==
X-Received: by 2002:a05:600c:3b8e:b0:434:f925:f5c9 with SMTP id 5b1f17b1804b1-4392497d8ebmr87118205e9.6.1739143971441;
        Sun, 09 Feb 2025 15:32:51 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef000367a1a7f22add27b.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:367a:1a7f:22ad:d27b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm17027895e9.40.2025.02.09.15.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 15:32:51 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v3 3/4] reproducible-builds: add a "How to" section with OEQA* variables
Date: Mon, 10 Feb 2025 00:32:44 +0100
Message-Id: <20250209233245.1397155-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250209233245.1397155-1-yoann.congal@smile.fr>
References: <20250209233245.1397155-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 09 Feb 2025 23:33:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6315

From: Yoann Congal <yoann.congal@smile.fr>

Shows an example of the new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE_TARGETS that were
shown earlier.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v2->v3: Quentin's review
* Double tick quote variable in title
* Removed Guillaume Reviewed-by (given privately)

v1->v2: Quentin's review
* tick-quote variable in title
* a set of recipeS
* 3 spaces to align a code block (not 4)
---
 .../test-manual/reproducible-builds.rst        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index b9f671d68..95308330e 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -145,3 +145,21 @@ set of recipes before the test, meaning they are excluded from reproducibility
 testing. As a practical example, you could set ``sstate_targets`` to
 ``core-image-sato``, then setting ``targets`` to ``core-image-sato-sdk`` would
 run reproducibility tests only on the targets belonging only to ``core-image-sato-sdk``.
+
+Using ``OEQA_REPRODUCIBLE_TEST_*`` variables
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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

