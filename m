Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0512CF31AC
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 08:38:52 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.2648.1727858326216151130
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Oct 2024 01:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=x4HMNEXv;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37cc846fbc4so4559634f8f.2
        for <docs@lists.yoctoproject.org>; Wed, 02 Oct 2024 01:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727858324; x=1728463124; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pqu+h9cPbMPFf/JYux8yaCIJ0hBxev02QRZvRfXsTU=;
        b=x4HMNEXvCdsJXu6T2sCQjjnL4JAJVZ/MYOYU7SYkoAxnkCLz4TgS6c7Q0XoL3Mc7SB
         Tjlf/T5JNxw+tWVnmMbQJ+Ah82vaFapl3nrmQv9zWibTAf5GOaPoLworPmek9EDpB8Qq
         MgSGBQy52Jslu8nLHemaLKhs8L6gWp8jRGQb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727858324; x=1728463124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pqu+h9cPbMPFf/JYux8yaCIJ0hBxev02QRZvRfXsTU=;
        b=TWokRdSgTOQFfCYEiuiGEYj47XckIZdTqAqE3K//Yf6zVyAd3ls1mRh4NQsxqTfd+P
         VTjDZ5TmhyG3V8x7eM2pP8ArPTJ/zwerorhgfVYTtsO46hF1OeBRy8eA4nHXsf7lVY89
         fw04R5/v7V2Hk3fqhTwiPdf/Bf5BjCbRjAp7mtHJFROs16HR/jCj6QXf97P55UV6BV7Z
         fq+ZWRMwKwiM+GkTfH9SMAEraS6OpgnXbFXaOY5/5LDocPfzqj8hqwnJB5WeG6K6DY5D
         oa1SNnqAqWul8v84b53+IQMSQekQHZdvXSkSTarLwmtPzO3+vwVzqGFqII/4/reI9iJp
         IV+w==
X-Gm-Message-State: AOJu0YwRmB+DnITRIII2qoG6MTBzE3ulh/RLxGQ5s3W0ZRxGoG6KvV/a
	hm12usfW7BQadvaRd6ktIf4KD3D2gK9El8l8ouEpwTzCv/0nlLvq5Tw7tk2aq1LxyWntmkKOWsh
	O
X-Google-Smtp-Source: AGHT+IEjngFY2wQk1fmNREQcW72NYdA2SPtLsF1yiusy4TGbGcu7G97qDzQivTGVp6ove78ueSaxqQ==
X-Received: by 2002:a5d:5c85:0:b0:37d:238:5a84 with SMTP id ffacd0b85a97d-37d02385acamr60822f8f.15.1727858323954;
        Wed, 02 Oct 2024 01:38:43 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e94c4sm13433204f8f.62.2024.10.02.01.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 01:38:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v4 4/4] release-notes-5.1: document spirv-tools reproducibility
Date: Wed,  2 Oct 2024 10:38:24 +0200
Message-Id: <20241002083824.933981-5-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241002083824.933981-1-yoann.congal@smile.fr>
References: <20241002083824.933981-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Oct 2024 08:38:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5399

From: Yoann Congal <yoann.congal@smile.fr>

This covers Poky's commits
47ed8ac83a6 (spirv-tools: Fix git-describe related reproducibility, 2024-08-03)
a19bb8c1d51 (spirv-tools: Update merged patch to backport status, 2024-09-05)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
---
v1->v2: Review from Quentin Schulz:
* simpler to avoid confusion.
v2->v3:
* Review from Quentin Schulz:
  * spriv -> spirv typo (-_-')
* Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/release-notes-5.1.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index 75e57ea1f..074d277da 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -50,6 +50,8 @@ New Features / Enhancements in 5.1
 
 -  Miscellaneous changes:
 
+   -  Fix reproducibility for ``spirv-tools``
+
 Known Issues in 5.1
 ~~~~~~~~~~~~~~~~~~~
 

