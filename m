Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD901CF31A7
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 08:38:52 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.2645.1727858323903099829
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Oct 2024 01:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uc6WlMVY;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42e748f78d6so52749305e9.0
        for <docs@lists.yoctoproject.org>; Wed, 02 Oct 2024 01:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727858322; x=1728463122; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnhRn70MulX2kD884iWq9W4BkbIxi6wjAGezMgvgPlI=;
        b=uc6WlMVY9/QS5TCcKlcxcLJjlaVYLzOY9vUjHCm8nvKjRowvVXR0w+gxjeChWeqPIN
         t+ig26GksPuTNivXNv+oQB3dBFHTDtVFRRerzKu0LYv4m548CZkWmJI45gn09NB5bYip
         9/hqlM0P4Y4UxTfrDtBwQL3VtTeWHXZQCw0Hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727858322; x=1728463122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CnhRn70MulX2kD884iWq9W4BkbIxi6wjAGezMgvgPlI=;
        b=S+Rtr5TRrcR2f0m71pNvPHfcRwSP9m8MCDDaIocXuB7qupiWfDeAS44SXj4vh2CrYj
         iq83g9/3JUQscnL31kJtEm40caCYF4yEixi0h2pVpOCzwvOtE7X8NCwQMZZPL22IAFHz
         48qNdNQt7wpIqHjfP66Dkib38XYzwODC7GYnGRf/6fdYzAbvIeslPJnEndCYCLnFFV1N
         X3l2ofZNHABu8tQiRuAZQPuz2bScnWJot6jn80inItZUeMQDbvSHV10BT63b1L2ZO+16
         cHB6B0ZRcGkmF4md4dFQik8KoMBEkwzdrWpjElBFdMaMfYnop6zC/FjDYQ58xmqOzYbf
         sYEw==
X-Gm-Message-State: AOJu0Yx/frzHhFUroBnNcseYlTtvv9I/bjIq8PynHFRvhuMNqeVUkJmU
	ivkRJ/Qql1YJ8mbvANhj+rBtJVEsFvM4h1wm9IQX9I5E9b1MIGe0C69yFlEGqV3eS+0Ddr/X6ad
	V
X-Google-Smtp-Source: AGHT+IF4G8FVLavPLqvtK0tvBk6J00V0PdFr3jIIq9KApKwWTAU8WjEy4A2T3H8liePCbPgKk7aAGw==
X-Received: by 2002:a05:600c:4486:b0:42f:520b:1591 with SMTP id 5b1f17b1804b1-42f777ec6f9mr15486085e9.24.1727858322029;
        Wed, 02 Oct 2024 01:38:42 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e94c4sm13433204f8f.62.2024.10.02.01.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 01:38:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v4 2/4] release-notes-5.1: document added python3-libarchive-c ptest
Date: Wed,  2 Oct 2024 10:38:22 +0200
Message-Id: <20241002083824.933981-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241002083824.933981-1-yoann.congal@smile.fr>
References: <20241002083824.933981-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Oct 2024 08:38:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5397

From: Yoann Congal <yoann.congal@smile.fr>

This covers Poky's commit
c01e633ab91 (python3-libarchive-c: add ptest, 2024-08-02)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
---
v2->v3:
* Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/release-notes-5.1.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index c2600b07f..3d5a885d3 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -28,6 +28,8 @@ New Features / Enhancements in 5.1
 
    -  oeqa/selftest: Only rewrite envvars paths that absolutely point to builddir
 
+   -  Enable ptests for ``python3-libarchive-c``
+
 -  Utility script changes:
 
 -  BitBake improvements:

