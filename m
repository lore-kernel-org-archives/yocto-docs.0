Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1737ACF648B
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 22:01:00 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.2611.1727474456736117579
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Sep 2024 15:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=W30NR4tP;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37cdb42b29dso613634f8f.0
        for <docs@lists.yoctoproject.org>; Fri, 27 Sep 2024 15:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727474455; x=1728079255; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPX/JZO8GBIctpE56BiYJihouBTYqdW4NWl000GzJUE=;
        b=W30NR4tPNKagI9VeAxtVoQy/DnvSsTge3OTZCJJdGoXYLSETBzNtTYobC3Qw1Qe6UX
         WYRRAX1THiRVOAuUDc4MWibf4mAAsT1iGZH0wUPQIua5CQ+vhQrl7ixggmAQIrZwGdc5
         RvLHY77BQIDOczr6PwZxYhiHqu2o8sFmjP9sE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727474455; x=1728079255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPX/JZO8GBIctpE56BiYJihouBTYqdW4NWl000GzJUE=;
        b=PiEuB6oucO8Q02VZvBQ/mGdhiBTxCRzeCBqBRLjKBOCA2fgYhHdnWXIRcemJJcU1HB
         0Or1Z3yI2fTo+q9iZCa7N+K55nRVwzRIll5OVYv9yrwlAmaf9ouz4ZtEON2OHxnzIMAE
         BzeQZIpvdjQ0BMdOW22Is1D5Op9S340RiG04+T4hYRhj5AjFGyWR5c5wLdbWaiqYdR/b
         ceSviD+TCpsoQ58ijXsRAFOjGhGWX+/NzHeuK3cjNttCUp2icEBcNyPsjil7+8I/Fhy6
         pS/Sh8LltqsSDOOitSC/uMQABc7sG5oEm17PHBmttR1oFBCNIh7GyGXiHrF2Dw8EYXYu
         yLqw==
X-Gm-Message-State: AOJu0YwWo2aOZKZFu68NCAwOTar2qSEmwMy1Goan04OSF5R6rGaJSsS4
	sBmJYiJ9pHd9/2Yq7b9GvTRP9d5ZYBUPXnbD8cwhQWuBY0Nwr0f/bExHn+LK9m90c5S3su+EwAi
	a
X-Google-Smtp-Source: AGHT+IHEXzyp9mla1Cf1loPmnZF8DFQybNOwTG8Jw2tJ0wuUBvY6UUf/X+PO8zw57kn+qFt2dbNMYg==
X-Received: by 2002:a5d:4449:0:b0:37c:cbca:fd82 with SMTP id ffacd0b85a97d-37cd5a6bf37mr3418205f8f.1.1727474454757;
        Fri, 27 Sep 2024 15:00:54 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d01esm3490712f8f.3.2024.09.27.15.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 15:00:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 2/4] release-notes-5.1: document added python3-libarchive-c ptest
Date: Sat, 28 Sep 2024 00:00:31 +0200
Message-Id: <20240927220033.3941455-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240927220033.3941455-1-yoann.congal@smile.fr>
References: <20240927220033.3941455-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Sep 2024 22:01:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5378

From: Yoann Congal <yoann.congal@smile.fr>

This covers Poky's commit
c01e633ab91 (python3-libarchive-c: add ptest, 2024-08-02)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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

