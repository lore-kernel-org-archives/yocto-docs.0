Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68E9CF58C3
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 13:20:37 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.16002.1727270431587060865
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Sep 2024 06:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HfADCJIS;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-378f90ad32dso4281832f8f.0
        for <docs@lists.yoctoproject.org>; Wed, 25 Sep 2024 06:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727270430; x=1727875230; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqppUh3qcDQDR/l7CxuAq03NzF7FlLxGukkX65O1nzM=;
        b=HfADCJISGyWnFlJs/H3pioICJ/vRx4QTRWWHVqjt5DimKWnmSH0dyy1FjhwHNQvwFN
         gQOUKzsKqegTf8lG7PK0TkV2/93l3v0TzdSRW8xGjO6tIjRIl+GCZH1QezywAU+qiXRY
         LzayrvsOQBL31j01rr4ZeW1sRd+QSQmcHjYO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727270430; x=1727875230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqppUh3qcDQDR/l7CxuAq03NzF7FlLxGukkX65O1nzM=;
        b=nU9sYQWdQpfZUA1G59FwXCRkV2ccYqY5HP/i4Xu7sjdHjvXVqqqGL3AsLLSXXh0nkD
         t8D9Rm5hbEIbgWhh9++b4HY+I+gk+3KxmvGjwnvDLeP4DOo1pOC3FbCqL9rwFpLJNp4I
         whVxGxeT5lqOOWo2B0jE5AgumUldGLQe2EpWovj7eFp4S146+2GMShn+Geopp+dbQOna
         +fESHVyG4kjp5qot82ikHMX5d8X+8P80YUnL0o+Mlvlxcs/952b0j8rDmTZagmCz4Fri
         bG5NQKbY7m4jEmt1kSxL0FkRwW6KQKLel3y5J9MJqXXoVAxMlRe8aHaQcR4POLy9n6rm
         Rdwg==
X-Gm-Message-State: AOJu0YyKgAC64nyJoszX0iuKvCVRyDOXbDnYjddDAl4vJ+Skw73qpJkx
	81kbNWC4+wVEXZxeyCR4hAb685Chkk6KcoUdpMgzldOQHjPHgq0PAoNmDAkdeQOrN6MtiQJ087Y
	f
X-Google-Smtp-Source: AGHT+IHfWjmqbeTyPTRZr479z1Owdv2YEeLk0WOcrzuNVXSAh6tZGegy81+JRE0F4EDazt5efLFs4g==
X-Received: by 2002:a5d:5d86:0:b0:37c:c5b4:8b1e with SMTP id ffacd0b85a97d-37cc5b48bddmr1177325f8f.22.1727270429566;
        Wed, 25 Sep 2024 06:20:29 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ddad1sm18808675e9.9.2024.09.25.06.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 06:20:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 1/4] migration/release-notes-5.1: document oeqa/selftest envvars change
Date: Wed, 25 Sep 2024 15:20:14 +0200
Message-Id: <20240925132017.3427438-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240925132017.3427438-1-yoann.congal@smile.fr>
References: <20240925132017.3427438-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Sep 2024 13:20:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5368

From: Yoann Congal <yoann.congal@smile.fr>

This covers the Poky commit:
61186bc98a5 (oeqa/selftest: Only rewrite envvars paths that absolutely point to builddir, 2024-09-10)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 documentation/migration-guides/migration-5.1.rst     | 5 +++++
 documentation/migration-guides/release-notes-5.1.rst | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
index b43fecc2d..14329c6a8 100644
--- a/documentation/migration-guides/migration-5.1.rst
+++ b/documentation/migration-guides/migration-5.1.rst
@@ -141,3 +141,8 @@ QEMU changes
 Miscellaneous changes
 ~~~~~~~~~~~~~~~~~~~~~
 
+   -  oeqa/selftest now only rewrite environnement variable paths that
+     absolutely point to builddir. Environnement variables containing relative
+     paths from tested build directory to outside of the original build
+     directory may need update as they won't be changed by selftest.
+
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

