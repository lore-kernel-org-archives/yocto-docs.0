Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D02DC021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 22:06:35 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.5931.1739829994007545311
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 14:06:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lf0Mz2es;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38de1a5f039so4674369f8f.2
        for <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 14:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739829992; x=1740434792; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hntcLj3lxsMzAkSDPSSMZaeGGgCUlrL7e1g7Rfwghsc=;
        b=lf0Mz2eseM0uE5oGuVNzwXmuGnXlziBQWBQRTUDUxr0CaObRVED7Oo4ZARDdPVaoSs
         UEJV2brkiMg7HKN9mxRi9pJ08R92xIEIwbG691jJSBUGuOOrlin0BQw/G8aMnnB+7gEO
         BU23XvgyLyWA/lwf6Q+154CKI8hC1WPoA63ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739829992; x=1740434792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hntcLj3lxsMzAkSDPSSMZaeGGgCUlrL7e1g7Rfwghsc=;
        b=kkCs1ycN3a87n7auYdkZcb3TB80cTr9Th6r4M5EJc0Ohn0+eqqkXUxatrgPR4470jV
         vUpPQB+dkAIOg/S8dR8TFj25MZpyPJNGTg9yDI1K/8UFBMF3ET1ya+C6KGKP+XQ6tnXZ
         ocFPV20mnSdrDsTns5zgWID7DZDJgoEDjE/HWnxSugX+lhZZooPir7gNhtWSWrI17tMI
         DPs7JTcR01R3ZhmS2NwsM1bwOLSdf74fda2zAJX53LV0zvU/6pktBDQCzw5iY3xMFNd0
         HKZA6PgUtF6TF6icufjJl1bN+LJ7RQ1AcuyRC/hRcLfJ2FnYc41xMwWKewTgLoJxnQNv
         7S3A==
X-Gm-Message-State: AOJu0Yzbb3FD25aF7nNKJHUHE0JevL85S9NsbzAs4pMOCUFSsVq0B/GU
	7mPQXxx49BP513rx6lcII/u5ZkDTMveSUJseIQ2woNcywJaCSM6YABqdLlr637iM6ZiAiULPAY+
	o
X-Gm-Gg: ASbGncuFBaxokD6Txv8YEDPm9NpoVrDTnnTs2/9jtkhiC3SCtHjD500qOQzglAoGmOm
	pvBsoy+j497X3ojSyAURePsy2BzXouv3EPQcZDI0uiFQL0tBavdLInpSZF4ZloPwhoWYnIJey/8
	Ri0QUgScBN/Cb2d4ZbNmN4SaEa8FW0TtdQGOJ+eXdB6NoU9Editnz9LCgLP57chPdK4YRweeVlU
	WPjmjFfVdrjSw0s7rZtfZC5RwEJmFWvVXVwycvnxuj5BSaJH3WFboGdZQfZ0/u1DqqbdPRmoAU8
	q/IzAfbgs7Qmj1zlZRVltOpotUjMDRfW5l0LkoEeQaZeIq13WKZeMPNexSXS9rvIlxC4ox07K5M
	D6VVt9+RagM72ikeU5YLMnUg=
X-Google-Smtp-Source: AGHT+IFqC9gO21jbySYB+B5sLHs5JF0M924bfALt51TiD9e3wW24T92BYZSFUuha9yiRC9uBHWAoHw==
X-Received: by 2002:a5d:64e6:0:b0:38d:c9da:d0d7 with SMTP id ffacd0b85a97d-38f33f125ebmr9722806f8f.2.1739829992102;
        Mon, 17 Feb 2025 14:06:32 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local (2a01cb000deef000fa5d724a12d076e5.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:fa5d:724a:12d0:76e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7987sm13033958f8f.87.2025.02.17.14.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 14:06:31 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v6 4/4] release-notes-5.2: Add new variable OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
Date: Mon, 17 Feb 2025 23:06:18 +0100
Message-Id: <20250217220618.1999362-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250217220618.1999362-1-yoann.congal@smile.fr>
References: <20250217220618.1999362-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 22:06:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6409

From: Yoann Congal <yoann.congal@smile.fr>

Add mention of OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS to release-notes-5.2
so users can use it after upgrading.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---
v5->v6:
Quentin's review
* s/to/so/
* Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de> (Thanks)

v3->v4:
* Quentin's review:
  * s/single recipe/recipes/
  * link to sstate
* Reviewed-by: Guillaume

v2->v3: Antonin's Review:
* Add OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS ot release-notes-5.2
---
 documentation/migration-guides/release-notes-5.2.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index b0e538700..417b202cd 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -17,6 +17,10 @@ New Features / Enhancements in |yocto-ver|
    -  ``linux-firmware``: Add the :term:`FIRMWARE_COMPRESSION` variable which
       allows compression the firmwares provided by the ``linux-firmware`` recipe.
       Possible values are ``xz`` and ``zst``.
+   -  reproducibility: Add the :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
+      variable which enables a reproducibility test on recipes using
+      :ref:`Shared State <overview-manual/concepts:Shared State>` for the
+      dependencies. See :doc:`/test-manual/reproducible-builds`.
 
 -  Kernel-related changes:
 

