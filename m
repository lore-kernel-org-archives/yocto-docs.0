Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B74BC021A0
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 23:31:52 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.2757.1739316710028042409
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 15:31:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ikuBhJyH;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43948021a45so24097295e9.1
        for <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 15:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739316708; x=1739921508; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEhDkHwvb3uZJF4Y8a0/2Ot+dlmDCe3NsqshZCiMeB4=;
        b=ikuBhJyHlBNmb5GF7tKxFqQATBPpgqOwqSihuwclXJvScNuds7Nhm0RZ7K68OluVs+
         p8utgbPTdgLgoTQmGH0NNtPYZ8T6ree5Z59wqsdb5ztAifSAWh+48QtDSSqO9JVCVNWI
         rSWP6y/4N8P8l2kCY1zMXgLaSCQIsN6wKjYIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739316708; x=1739921508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cEhDkHwvb3uZJF4Y8a0/2Ot+dlmDCe3NsqshZCiMeB4=;
        b=WPAorv3eXYLYJEol4yNBH38UKvngFO0tdwTfAw6sSG7bd7ZF0IJyPnZ4+wAo/56iif
         oO584hjxIPRZrie+ViJS6z5k5MERo4pEwkpPIEgWqQ449zJi/Kk7/2kZNDXcaqV3QUHU
         pKIDp0t3u7bt1i0PNg32DLhfzC/wk/uYS075yp6KeIvgjFzPpk9uf7lUVNtTvk+xaEEa
         8HZUWCar7pV+kiEO9DxfFazBMzcNnRAHfc5YAmAf7ztkVhnvvACjMh5qqzdqIaOC/Irc
         3g1Lvdawm5Z3q5YHckISWVbgLIT0dRNqTPoHEV9FmRHennl8i79T1Wm6XfHm+TBQUhyc
         8o0Q==
X-Gm-Message-State: AOJu0YyCFQeT4fK7VkhPhbFOSoRUFt86G9dkF4CjWCJwYZqMMWslTQ2Z
	TCD4pXSyiIcVHJK9+1P6Or1X8toHUsxRK0cDL31/KAlOXevd2vKn2HYh1AWrOnsqKIggAw+3u8p
	T
X-Gm-Gg: ASbGnctHgg38lOmWya+3s/vOyXaQEpkKG4x6hTq1eZr/ko2KcY1EUIPiz3BbyBtgS5m
	hiZiCrxVm7PCk4z18E9VJpCwuHlR26z9mKZ3OeTnn82SRt9c2lHSxQW4txtee8/VPHmw52mGQva
	dQkEBF5jaJxaeH95qsJtp5q2DxU6E1aFMKIQsClQlc/CrHZAjFlkNEzvbWI9M0eSWJJNr0+CnsE
	afy0B4XxxiBixBK5C51BnIIQ6luYMAkE7iaM1xbkyB63j0QPx3OOUHMRk0kiVA3PHM4DjzTQVHZ
	I8LYAgSl3LfYyEoyFNRUxWgTX4LBdaKtagNa
X-Google-Smtp-Source: AGHT+IFt6HyDAvo67efbrmg7SNbjOt1ydou+YJTP7atHUdwIbA6HLoSauEVC9/MNUcyRqHThloYS1g==
X-Received: by 2002:a5d:5f45:0:b0:38d:e21e:13c6 with SMTP id ffacd0b85a97d-38dea2d360amr557237f8f.42.1739316707827;
        Tue, 11 Feb 2025 15:31:47 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([2a01:e0a:c04:ba00:b2b1:fd05:9faf:4037])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a04cd94sm2367475e9.7.2025.02.11.15.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 15:31:47 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Subject: [PATCH v4 3/4] reproducible-builds: add a "How to" section with OEQA* variables
Date: Wed, 12 Feb 2025 00:31:10 +0100
Message-Id: <20250211233111.2632384-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211233111.2632384-1-yoann.congal@smile.fr>
References: <20250211233111.2632384-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 23:31:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6340

From: Yoann Congal <yoann.congal@smile.fr>

Shows an example of the new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE_TARGETS that were
shown earlier.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
---
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
 .../test-manual/reproducible-builds.rst       | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index b9f671d68..fc67cb812 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -145,3 +145,23 @@ set of recipes before the test, meaning they are excluded from reproducibility
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
+dependencies (i.e. the ones explicitly listed in DEPENDS, which may not be all
+dependencies, c.f. [depends] varflags, PACKAGE_DEPENDS and other
+implementations).
+
+You can have finer control on the test with:
+
+- :term:`OEQA_REPRODUCIBLE_TEST_TARGET`: lists recipes to be built,
+- :term:`OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS`: lists recipes that will
+  be built using :ref:`Shared State <overview-manual/concepts:Shared State>`.

