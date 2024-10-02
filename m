Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF341CF31A4
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 08:38:52 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.2644.1727858323123163731
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Oct 2024 01:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=k4YRx5Ea;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42cba8340beso3315015e9.1
        for <docs@lists.yoctoproject.org>; Wed, 02 Oct 2024 01:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727858321; x=1728463121; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBS7GITt142t+ZjB+r1GG4lct0h7WLuvKgxXYsHqYS4=;
        b=k4YRx5Ea8n+FxdfYWz7QZoJiuLXJ1CYudkQGdufYWgiCHY/LQHNw3Rzeu2atfDfiks
         EchZ2erQ670y0e61aYCl6MIR/atodLlxs2dR2KDdI7R8vGtwiqXBQHuXaIxVg5swYUPP
         wdHRHZu9jGjA67y/S4z1Ii8SJY7oJxsYKWTlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727858321; x=1728463121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBS7GITt142t+ZjB+r1GG4lct0h7WLuvKgxXYsHqYS4=;
        b=JBvcAYsOh1KEDzFXPaB+F0+tCTAMws9FTpZaMz2wgIeTLLOtgG9Cr/0+cW3oWgAa+t
         NMKJj5Vr3R+qvwztWMufnCnwPuDHXpCSD8ilrdUzt9Qcrru3ca5HhfZHoZ3O9DMW2JSR
         t6x3ETAuoF65E/aD/yCvmlJZAT+pNnWHpE38YbYkcLxQ+kkTq7oOwwF5rkvTlPgsrczg
         ary4reOE7CUn+n6747xVp1YngO3n8mgxNU1H58rZXSezdKNiTenED+E0QWCHUcYb5lqG
         WI82SIgBGCVZh7EsPaCu7K7hBMVgiVbvK+OGApbzMwfLAkUTGugm6tLWxYMrOIGyOy7Z
         QpAw==
X-Gm-Message-State: AOJu0YyZ1SD2q23+f9PUuGwSZWJcql2+kBATmKP1+/DI9AiR247wCkyN
	uFbJg/2Cdvk4UiuS63XkeFdKMhvkRnnvnnk6/IMcqo7GLlisH9++U2XWbUPujB96lDrAD1tBacb
	B
X-Google-Smtp-Source: AGHT+IH0/criACQavrNyls15Uiojmr4k/z3yZljC4j+MFnDkb4PhqVO8dDdgAUXwf19i/ZPSf9UI3g==
X-Received: by 2002:a5d:614c:0:b0:374:c1ea:2d40 with SMTP id ffacd0b85a97d-37cf289c5b8mr3530236f8f.1.1727858320869;
        Wed, 02 Oct 2024 01:38:40 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e94c4sm13433204f8f.62.2024.10.02.01.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 01:38:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v4 1/4] migration/release-notes-5.1: document oeqa/selftest envvars change
Date: Wed,  2 Oct 2024 10:38:21 +0200
Message-Id: <20241002083824.933981-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241002083824.933981-1-yoann.congal@smile.fr>
References: <20241002083824.933981-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Oct 2024 08:38:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5396

From: Yoann Congal <yoann.congal@smile.fr>

This covers the Poky commit:
61186bc98a5 (oeqa/selftest: Only rewrite envvars paths that absolutely point to builddir, 2024-09-10)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
---
v1->v2: Reviews from Quentin Schulz:
* environnement -> environment
* oeqa/selftest now only rewrite*s*
* Add exemples for the selftest change
v2->v3:
* Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
* Reviews from Quentin Schulz:
  * BB_LOGCONFIG -> :term:``BB_LOGCONFIG`` + removed ad-hoc definition
  * selftest -> `oe-selftest` (to avoid confusion with bitbake-selftest)
v3->v4: Antonin Godard review
* double ticks to single tick in :term:`BB_LOGCONFIG`
---
 documentation/migration-guides/migration-5.1.rst   | 14 ++++++++++++++
 .../migration-guides/release-notes-5.1.rst         |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
index b43fecc2d..298ff3e25 100644
--- a/documentation/migration-guides/migration-5.1.rst
+++ b/documentation/migration-guides/migration-5.1.rst
@@ -141,3 +141,17 @@ QEMU changes
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
 
+-  `oe-selftest` now only rewrites environment variable paths that absolutely
+   point to builddir (i.e ``X=$BUILDDIR/conf/`` is still rewritten to point to
+   the `oe-selftest` ``conf/`` directory but not ``Y=$BUILDDIR/../bitbake/`` which
+   still point to the ``bitbake/`` directory)
+
+   For example (taken from :yocto_ab:`autobuilder <>` environment):
+   :term:`BB_LOGCONFIG` is set as:
+   ``BB_LOGCONFIG="${BUILDDIR}/../bitbake/contrib/autobuilderlog.json"``.
+   Note the relative path starting from the build directory to outside of it.
+   This path is not changed by `oe-selftest` anymore.
+
+   Environment variables containing relative paths from tested build directory
+   to outside of the original build directory may need to be updated as they
+   won't be changed by `oe-selftest`.
diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index 32cb2de2b..c2600b07f 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -26,6 +26,8 @@ New Features / Enhancements in 5.1
 
 -  Testing:
 
+   -  oeqa/selftest: Only rewrite envvars paths that absolutely point to builddir
+
 -  Utility script changes:
 
 -  BitBake improvements:

