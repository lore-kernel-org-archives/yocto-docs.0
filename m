Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B060C021AE
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 22:06:35 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.5927.1739829991815703470
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 14:06:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zo1RCCB4;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4397dff185fso15997225e9.2
        for <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 14:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739829990; x=1740434790; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BDGrqOXg0BMRvazmgQ4KUvlcJ3e+vlddW8mkWiveyf8=;
        b=zo1RCCB40gY5lz+EIyMNpnNsLLiep6UNG+YWnEaMfs3TGRFfJmzYKDZEWbN1yhIJM2
         Y2Oe4vqCkDvaXxOwF9dcgBBmgEt8wplIJcXe0ws2RRVYmiXsmZU0WIx8279DHE894DwK
         Owrt+Xuw1ADOWvAykhdtMeyI+z0oIZVU5iQJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739829990; x=1740434790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDGrqOXg0BMRvazmgQ4KUvlcJ3e+vlddW8mkWiveyf8=;
        b=VrgP69cgl11ia+Tghy5ha7fgwL/JdXAW0QPruqc7ti7g0QtbUTwVH9SnixrZhkKlFx
         iMgh+s8cEKvC2A1g9mGExRhDDjgdNnnYqG5/U9vVzSSESY4AZRI9q/BMNt+VKh5NU7Gu
         4xI9HsAghuO3fb5mr/Mq2Y3JPl62emR9HhszMf3KVvkKUnuzxOlTzf8LqOlCmM3yhSyn
         L29U255IEeZOvTJ6yuWX5jEWzejQTrDlYg8XznUfNf1DACevCwashB9zZzIE4Hqqshjj
         qXncxuzSviFNBbxHRE/8jtnA4bniS9bs9BEvwz62CfhP+lXL+6ywK7OmoloideYvN41Z
         CBEw==
X-Gm-Message-State: AOJu0YwUA3Q+5qIiCxCrrYhNP8dpVf6VAFhn38jTh8XOjjltTmpmnsJN
	SX0gyrHC3fIUq2/LyscbgqDjwv1L2IOPrcwYqROxMul42qCSOZrI933kDDg1PaHhlQHvKkOG2tl
	K
X-Gm-Gg: ASbGncuL+JxQv3Lce/TYKX+edZNVAMmKXYJrtfp6L9GbPJ7OLXdCIiwT/3Z/+4riItf
	Ksrsm76uqe6V2pC06X5gSuMAUXBet/e3212R50VbPRB6yjDwIy1E0M9L/k5j/GJm/KiDVRqxwaf
	X+pLcwy/3bKijVEk+Z48xYqalFN/E0gWYdx5uO4+gkBq7SxbSd3dmpQQdKLKN2viPUiZgw2/RR+
	jbzAsxgNYAA2RSmwOiYNSvIJAvPm1zqZMXkVHwkZiO6MTjbsiA5ZjtqafyFi5uJPnVSBZPpHWWG
	Ltj++b/t6gaBKx71zFXCSA6DBmAHDXC9leSp2SPuT0Q0cYps5yXZnyrssNQkyCmy0NZVTEsxnJa
	0bxXLUK9BjuqXOmj7mpmu0+A=
X-Google-Smtp-Source: AGHT+IFuAqzejFAY6rxDmH4eKYfZIdtPvoxgNn5b9pMAXwIWwwnt2zsVtOD9t82ScN1dWwluVAkRmw==
X-Received: by 2002:a05:600c:3b0f:b0:439:8c6d:7ad9 with SMTP id 5b1f17b1804b1-4398c6d7da4mr36367225e9.31.1739829989678;
        Mon, 17 Feb 2025 14:06:29 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local (2a01cb000deef000fa5d724a12d076e5.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:fa5d:724a:12d0:76e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7987sm13033958f8f.87.2025.02.17.14.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 14:06:29 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v6 1/4] ref-manual/variables: document OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
Date: Mon, 17 Feb 2025 23:06:15 +0100
Message-Id: <20250217220618.1999362-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 22:06:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6406

From: Yoann Congal <yoann.congal@smile.fr>

This documents the variable used in the "automate testing a single
recipe's reproducibility" feature [YOCTO #15701]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---
v5->v6:
Quentin's review:
* Proper highliting (:term:, :ref: and ``)
* s/varflags/varflag/
* Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de> (Thanks!)

v3->v4:
Quentin's Review
* make missing dependencies more explicit
Guillaume's Reviewed-By
v2->v3: Quentin's review:
* s/target/target(s)/
* Removed Guillaume Reviewed-by (given privately)
---
 documentation/ref-manual/variables.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index adbef69d8..e91568cb8 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5807,6 +5807,15 @@ system and gives an overview of their function and contents.
       For additional information on how this variable is used, see the
       initialization script.
 
+   :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
+      Set build target(s) for build reproducibility testing but activate
+      :ref:`shared state <overview-manual/concepts:shared state cache>` build
+      for most dependencies (i.e. the ones explicitly listed in
+      :term:`DEPENDS`, which may not be all dependencies, c.f. :ref:`[depends]
+      varflag <bitbake-user-manual/bitbake-user-manual-metadata:variable flags>`,
+      ``PACKAGE_DEPENDS`` and other implementations). See
+      :doc:`/test-manual/reproducible-builds`.
+
    :term:`OEQA_REPRODUCIBLE_TEST_PACKAGE`
       Set the package manager(s) for build reproducibility testing.
       See :yocto_git:`reproducible.py </poky/tree/meta/lib/oeqa/selftest/cases/reproducible.py>`

