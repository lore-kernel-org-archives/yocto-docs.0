Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01434CF6488
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 22:00:59 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.2644.1727474455849584372
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Sep 2024 15:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CUqrF1aW;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37cdb42b29dso613619f8f.0
        for <docs@lists.yoctoproject.org>; Fri, 27 Sep 2024 15:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727474453; x=1728079253; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3m2aa6YBaBS9jKB4ZWrIZnFI1okH6kK5SL1cu21byJE=;
        b=CUqrF1aWIzdcdtO+m8LsDHCw9N43Biql59Izq4P6YcauWWXxm3paZUVWBn7vdGzKhe
         2aNZN+FF4VL8+7oi6iFVcZUMM7eLskjK5KbaIiCDUZCEedaflI2FFlsycwclZEdFUqIf
         f2PcELkKfEr/dv71WNfO/OIC5xxQ+9YU38UzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727474453; x=1728079253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3m2aa6YBaBS9jKB4ZWrIZnFI1okH6kK5SL1cu21byJE=;
        b=i1rxLKrJN708JtaR7jdmjJZ/wUCSxOUbcOko08X/z+TelblRWPeGP1jjOt+9eGdBni
         wpNeo0oiCsGqKqo9SsYmzYy5p9eVC0KRpv5XVMEYSVVXSG9krdxUOVr1uEETCQbKM/Qw
         aiZJdC+I0v1MkpralzE3mTizh9CrjZEFoWeha9w2Z1nTMAZjs59jWEBJOA+ZiRhYL1cF
         hdDvOAbaIsbRnQ0dzWEks75r0gAqjNE3WgWrL/n1jG73GtfH3lO9J4Uq+nvdxoILzXAN
         6pQSpCjabKLDOLiNNFyoOlNiaFKA2ywK9tM70lttV4s1wy/r4aWWeFY673QABSqL8t7t
         +7cg==
X-Gm-Message-State: AOJu0Yz+nmynqYY6JOolSpp4IPEhgwtOd2eVnO6TajTPQQNwwkbQs/Uj
	72VlcNR0iEF0CK/MzCJsbKO9yA5G3rpYz+F8mN1rI/v6xglbzpvi6jfEV89lAoJepkPOr5qQAf8
	z
X-Google-Smtp-Source: AGHT+IHZA8SXlK4Qz43NPSC/nkrohZr7qTOq91E5cxdpk5aAEsq2UmT3qDqbW0CX6JLUH+LpBfdTcA==
X-Received: by 2002:a5d:6585:0:b0:368:117c:84fd with SMTP id ffacd0b85a97d-37cd5a6b529mr3338124f8f.3.1727474453439;
        Fri, 27 Sep 2024 15:00:53 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d01esm3490712f8f.3.2024.09.27.15.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 15:00:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 1/4] migration/release-notes-5.1: document oeqa/selftest envvars change
Date: Sat, 28 Sep 2024 00:00:30 +0200
Message-Id: <20240927220033.3941455-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240927220033.3941455-1-yoann.congal@smile.fr>
References: <20240927220033.3941455-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Sep 2024 22:00:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5377

From: Yoann Congal <yoann.congal@smile.fr>

This covers the Poky commit:
61186bc98a5 (oeqa/selftest: Only rewrite envvars paths that absolutely point to builddir, 2024-09-10)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v2: Reviews from Quentin Schulz:
* environnement -> environment
* oeqa/selftest now only rewrite*s*
* Add exemples for the selftest change
---
 documentation/migration-guides/migration-5.1.rst  | 15 +++++++++++++++
 .../migration-guides/release-notes-5.1.rst        |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
index b43fecc2d..4625ff0e1 100644
--- a/documentation/migration-guides/migration-5.1.rst
+++ b/documentation/migration-guides/migration-5.1.rst
@@ -141,3 +141,18 @@ QEMU changes
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
 
+-  oeqa/selftest now only rewrites environment variable paths that absolutely
+   point to builddir (i.e ``X=$BUILDDIR/conf/`` is still rewritten to point to
+   the selftest ``conf/`` directory but not ``Y=$BUILDDIR/../bitbake/`` which
+   still point to the ``bitbake/`` directory)
+
+   For example (taken from autobuilder environment): ``BB_LOGCONFIG`` is an
+   environment variable containing a path that configures bitbake logs. In
+   autobuilder, it is set as:
+   ``BB_LOGCONFIG="${BUILDDIR}/../bitbake/contrib/autobuilderlog.json"``.
+   Note the relative path starting from the build directory to outside of it.
+   This path is not changed by selftest anymore.
+
+   Environment variables containing relative paths from tested build directory
+   to outside of the original build directory may need to be updated as they
+   won't be changed by selftest.
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

