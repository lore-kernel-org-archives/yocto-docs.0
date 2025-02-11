Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE74C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 23:31:52 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.2827.1739316708767560291
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 15:31:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=goqjHSnb;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394a823036so20859595e9.0
        for <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 15:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739316706; x=1739921506; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ie9mp6FIcNY1leTHXreYjSi90CnEtcZSna6RZmGeuSo=;
        b=goqjHSnbJIN36NS/tzIGruGTEA5RFqapt9i9x9uEAayu6918Kj3GvrKuGJVOZIFO2c
         JegpUtmNaK97IoHtcVdvKi/ONNvWsxu+4FLfwsZRhlzuJUrT4YMuy1yO6i0ZXhNUbgkC
         Sjvz32AjoPZIXRl0V2o4h2cnQ00iPnwSpxDGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739316706; x=1739921506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ie9mp6FIcNY1leTHXreYjSi90CnEtcZSna6RZmGeuSo=;
        b=gn46B1U/WH1UayDy9iXR5tEaZsbZNyUW8y3zdhmX0nMsp7z3E/SWEkBNi1I+EofPvP
         j6gnz7pMHyziQvGGAr7QJ9O6K2zo0/EZ/2opy+TzdlUEIW8wU3lA81VIZwr71rldsgPc
         KnD/8bLSprmaVFUpMEWMjE9K8Bwe/jQjTD1Zy0xcLPLw3n/TE6a2AUoMY+uGQHYCSKI2
         AvFF1fSKRzHa1ONd1ZoXD7mo3FJwEwShvLY9chVRz7WTbY5uL5TValLu9Yw3tCWXHPlz
         FQrbZ0Lm1pLwgYMt2tZMjl7yJXQ5RRxd1qUcX3PPG3E5LPK/ScNZzpo/Kozeyuoddlob
         YpXw==
X-Gm-Message-State: AOJu0YwTnR2m+ydIhamIUDqVCevSyiRMtxMUxCg4/BY7WWHlPZGjgNzw
	l0EdZpiHZMrhpMNvx6gbHmLeOZoqO/H6OWTrwTL8aFoJdxZYr5ZOacASch4bk/2N+KD3iQH+6td
	K
X-Gm-Gg: ASbGncv1MuXzIsnI6pLt2XEV2JSAoA+ZretsMe+jjSw1JrgC+ZRU6UXsrUjWYEnlVet
	edCDIikzBnK1rjIoUxVaWDAdDPJbKDj1mh2FtEG8OpPNj4ggKOJthC71RduYNQ0s+b1E8LL+OPt
	zUo9C6nk8X7woogUHGXB9GSTj7tdkkjV8ZzFluZ8XVaiNl965umIS08lXrkdNo6Qqe5rzIVZ8yz
	Xn67Z12Ye8be/LL6aRa+EmRYbECXKCIpbzadGiMXx1dL8sbRlbbHNd+rRz2pXopjAGGDAI5ExqI
	2f9X1wRr4LkEb6YU6NHqmPxlrfBrQ9p/EuQ3
X-Google-Smtp-Source: AGHT+IErXsFTSIE9yoswvwyu6aVOTnI+Jp7mrS+G6D2lxuQ4JHakpUfTuAK1ap4KN/b9ay9JgGb6PA==
X-Received: by 2002:a05:600c:3b04:b0:439:3254:4bf1 with SMTP id 5b1f17b1804b1-4395816f3c0mr8759265e9.8.1739316706532;
        Tue, 11 Feb 2025 15:31:46 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([2a01:e0a:c04:ba00:b2b1:fd05:9faf:4037])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a04cd94sm2367475e9.7.2025.02.11.15.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 15:31:46 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Subject: [PATCH v4 1/4] ref-manual/variables: document OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
Date: Wed, 12 Feb 2025 00:31:08 +0100
Message-Id: <20250211233111.2632384-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 23:31:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6338

From: Yoann Congal <yoann.congal@smile.fr>

This documents the variable used in the "automate testing a single
recipe's reproducibility" feature [YOCTO #15701]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
---
v3->v4:
Quentin's Review
* make missing dependencies more explicit
Guillaume's Reviewed-By
v2->v3: Quentin's review:
* s/target/target(s)/
* Removed Guillaume Reviewed-by (given privately)
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index adbef69d8..d56eee3bb 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5807,6 +5807,13 @@ system and gives an overview of their function and contents.
       For additional information on how this variable is used, see the
       initialization script.
 
+   :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
+      Set build target(s) for build reproducibility testing but activate
+      :ref:`shared state <overview-manual/concepts:shared state cache>` build
+      for most dependencies (i.e. the ones explicitly listed in DEPENDS, which
+      may not be all dependencies, c.f. [depends] varflags, PACKAGE_DEPENDS and
+      other implementations). See :doc:`/test-manual/reproducible-builds`.
+
    :term:`OEQA_REPRODUCIBLE_TEST_PACKAGE`
       Set the package manager(s) for build reproducibility testing.
       See :yocto_git:`reproducible.py </poky/tree/meta/lib/oeqa/selftest/cases/reproducible.py>`

