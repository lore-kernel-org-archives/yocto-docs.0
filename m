Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C5DC02196
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 13:18:35 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.40719.1738847909209713312
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 05:18:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FnBf4HGP;
 spf=pass (domain: smile.fr, ip: 209.85.218.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab744d5e567so166423466b.1
        for <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 05:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1738847907; x=1739452707; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28PNpSUxtiBSoZgUEUn5+a9s/JMhZ6DUMT9yfY8q57A=;
        b=FnBf4HGP88hYnEsUdzMiwZrm803KjFq3lhPs8Z23b+dwp/0uyLzK+ivGhFtL3vabyj
         y7eHdmxIlIBchtfp1sxzQhAhTutSLfL7ghT2P7d1Xe6b+IM9uYrG9/f2OWL/EyibkxaY
         jmpGc3hHW0U+GkX9p53Ww8HkI3F0hssFuuvJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847907; x=1739452707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28PNpSUxtiBSoZgUEUn5+a9s/JMhZ6DUMT9yfY8q57A=;
        b=G30mZ5YITGwUG7kZG23BJE0YMYBGfKTjdkBtgLD3JZAXTNvp8iAT9gooD29enJorYu
         +fXZtkxOyZ2opl0YaQ6I6Dr5ydMXli/nWN7EPbmFUZLIbRoi6g8ORIBf07e5QY4vZZGu
         whrwLMU4LXG8cd9I5qZeR2YiXDASML+oOOYP9PgdtePdiQf77ZlmQfV1WzrJMnal5deL
         4NnWlxIiUL9b1M+21CA5fRmlpPd+3UNbHksC8A9O6satTdSmIBIPRss/TGZoQFGmlmtA
         5iFt9avVJV16b/HwcTtg6Xyql5pOiJ36YeT41GwTnzXvHWLdJUXjvQKpj5t0EBYO7Hp3
         JU5g==
X-Gm-Message-State: AOJu0YxC9P5wL3qDwt/PYDnRnk2rhHSCUYEtJFj8quirkJOPnx0VoW/H
	yRFGJo7r0zFrRLNViv4stnFImCpnufAxEPQ0HRGDmelzGaWeIqnRPziXDc/msw3b3k+v7aK8S+k
	4
X-Gm-Gg: ASbGnctdzIAynrMI4s/jEknYRrVs+X6/1vXkk6xY8lgKFRMoT/8iOPVk4Wl+1NID6D2
	f0AOBCCLqvsJ0CHxKCkK6wDOdYBUj7N94zbiHtxPUA9tqHwCQ5UrfJoBLdiO0tJoeur79hss6uN
	Q1AAAPxKAiLkTtkwWNSu8SL9+rK7ItpokpjriEZf3Z+akq5yR0uBJ8dKw0amQgzkDGSz8u16+bs
	sJiu4wLe/rGEO3YpR49hVsBYbaNmXDvo6k0q4Wzn7zwZacJa2pmXNUSQG17Lt8yxSoaC8lXvdkU
	oIZkLsD8VEOrLFyLfJ27FT3RMMhSQZoyxY/N/YktN3wafsG4qQ8zdz+1KTjOI9o4790glCdpm7W
	KOU3GVqNCV/F2J2+JAD0C0x5A7m8X
X-Google-Smtp-Source: AGHT+IHXfMu2MkXnih0jCsCM4/7WfLBg1JzLNGDUWCAwXwm5q6qW9doewNqv5kl/G+N3rugUVe1CzQ==
X-Received: by 2002:a17:907:7b9f:b0:ab6:ef92:c238 with SMTP id a640c23a62f3a-ab76e9876bdmr389670166b.20.1738847907301;
        Thu, 06 Feb 2025 05:18:27 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b815c8sm898568a12.42.2025.02.06.05.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:18:26 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Subject: [PATCH 3/3] reproducible-builds: add a "How to" section with OEQA* variables
Date: Thu,  6 Feb 2025 14:18:11 +0100
Message-Id: <20250206131811.86935-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250206131811.86935-1-yoann.congal@smile.fr>
References: <20250206131811.86935-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 13:18:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6260

From: Yoann Congal <yoann.congal@smile.fr>

Shows an example of the new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE_TARGETS that were
shown earlier.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
---
 .../test-manual/reproducible-builds.rst        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index b9f671d68..909ac5216 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -145,3 +145,21 @@ set of recipes before the test, meaning they are excluded from reproducibility
 testing. As a practical example, you could set ``sstate_targets`` to
 ``core-image-sato``, then setting ``targets`` to ``core-image-sato-sdk`` would
 run reproducibility tests only on the targets belonging only to ``core-image-sato-sdk``.
+
+Using OEQA_REPRODUCIBLE_TEST_* variables
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+If you want to test the reproducibility of a set of recipe, you can define
+:term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`, in your local.conf::
+
+    OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS = "my-recipe"
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

