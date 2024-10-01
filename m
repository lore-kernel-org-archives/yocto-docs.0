Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF72CEACF1
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 17:23:01 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.87565.1727803371460588102
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 10:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ugr1KU+S;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so20535725e9.1
        for <docs@lists.yoctoproject.org>; Tue, 01 Oct 2024 10:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727803369; x=1728408169; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PbEHfqFVQhkoZYhE+RjYZzaU+U0398esRZraUjaz5n4=;
        b=ugr1KU+SfbcvlkKp3Nyq4qcL7gCCmV/aSYmjbPo89BsscV90JNDU+BOEgOQZpUXr0d
         5/OEX6n+RqBiSx5bXcWaRrTNunpRolF3HIizx8DoIPACPEORLjZjsNa5S3tzA0rlh7vu
         50Zm6l9p58lVhS1zZ4jH5NTtOnvtu8NbvWKA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727803369; x=1728408169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PbEHfqFVQhkoZYhE+RjYZzaU+U0398esRZraUjaz5n4=;
        b=tnUg2EQuoLTo4XNOIXJNMPLpMUymZ8O7N/txPwIoIuy6Axtz+glBkTgl6UyMz9Tjuv
         Ane4pffglPqnXchsV9bCR64/efcWJDOTmPDZ7Pwect4Tv/A2z9KpMJuniTu10h4To2sZ
         Lr/ARF2ev3OBf1jq+3i3hLV5q2v4HHt1J+BfjDg4aqwz9rie/6ND8AWadQv5UW8CzEbw
         3GBibLQ5TMRvUqeRd9GN3DwAbB8liNaKYfCenq/8YyNYBAWXI/iw/0/6z+jf2hJzbGbP
         Vsdwfss7ZUOIJV1UbgmJjbtNVV8VaJM4B2GSUSSgbjQ/OumK5uOVDxbF4jbStI2oEMO3
         6p1g==
X-Gm-Message-State: AOJu0YyBe6f38kptwZqMx70e9Lkx6WtI8izy/a/BBouKf0ehqxdzMjlc
	5LmMrOYe7Bb9vLjj2sH+ptrfN7wgyES0p3dX8bNaVXoctPOqTByGnmeot7C/37PAmUX1OMe8BiF
	d
X-Google-Smtp-Source: AGHT+IHUfL3ddiWejgpoTiAd3LK75MfnTrJOSvo8iX5C5lqM40BRW471hauOfM1sFfsFNVZ4SnV7YA==
X-Received: by 2002:a05:600c:1c81:b0:42c:b23f:7ba5 with SMTP id 5b1f17b1804b1-42f777b6d2fmr2064955e9.10.1727803369305;
        Tue, 01 Oct 2024 10:22:49 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a36292sm185589715e9.32.2024.10.01.10.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 10:22:48 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v3 1/4] migration/release-notes-5.1: document oeqa/selftest envvars change
Date: Tue,  1 Oct 2024 19:22:35 +0200
Message-Id: <20241001172238.2872529-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241001172238.2872529-1-yoann.congal@smile.fr>
References: <20241001172238.2872529-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Oct 2024 17:23:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5390

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
---
 documentation/migration-guides/migration-5.1.rst   | 14 ++++++++++++++
 .../migration-guides/release-notes-5.1.rst         |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
index b43fecc2d..f4bb8df0c 100644
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
+   :term:``BB_LOGCONFIG`` is set as:
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

