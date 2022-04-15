Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDE3C4332F
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:52 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.9128.1650038337551700484
 for <docs@lists.yoctoproject.org>;
 Fri, 15 Apr 2022 08:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M9rCnCyn;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id c23so7466303plo.0
        for <docs@lists.yoctoproject.org>;
 Fri, 15 Apr 2022 08:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xl19yT5h64NfSAydp//mDgHTa48O6jjozbr9VKzCCag=;
        b=M9rCnCynMLZF3fU+PrDhfDo01botVmDsiA3ZRbutPujNEJT+ANN7kRxxpcctvSHX2D
         UJ9tTj2tsY9wUYGuZJ0yv5yhVqdU+DdLxypGGIWFU4BgJM4uwOysi+mjzAuTMjlmvBBz
         C1w4EITYQ39X67nyBjkO1F8ywvdmQMdn+LaqiUpQFtwMEuobVQC7NqFynD4yCwX8shXj
         azQNAIuoZ5fV4GYP6a1V8Bm690F+aBdSufz6tIhegwMbsY3S3YB54XIE7R/gU9xtJYit
         TLDW6W4zwQu6+wMXs4P1ZgWGVbsM035Q2F61jeSFU1FjINfzcHDphzbxM2QtY4GJb67J
         dOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xl19yT5h64NfSAydp//mDgHTa48O6jjozbr9VKzCCag=;
        b=XdmSB83JaMsEwXFRhY+uAX3g9GRfr1tg+NoPnc0rdkdJf4wIKOQEqSnah43RUhbHBR
         x/PeTw6M3+KF6J9+wbyLO1aAsY3qi1I+3MOM0kUOpO8mKTGE8PCqhX8m/BiviZTKoBIv
         ZluptNUdlUhgApB/h/nl0aG2kdHYnPYRR7C181u6pyZW0ErsKlDLzZtSS6LfHrC7lchF
         1Eew8XciNLJLkXrAE0TQy3Ld734aaXC41+IlYbrSnmBOM8hQCXBGkA8x5bTUZ+ZAvWoW
         rk3JehU7LxIDAtn8NjJgq2/xI4+fQTOj2dq5V7elNyUMqkPP71qXPEBwLDzfi0+vwpdm
         X4og==
X-Gm-Message-State: AOAM532Mzmrp6SyslSMyyNj+6mn33ZMP7VC+K771EDWvqh1t2ui8wrEX
	YYhS0J6fN4g1eBmZie1FnEERSzKFUOcMnp3h
X-Google-Smtp-Source: 
 ABdhPJwqQRsOp3qbw/NXyiyBHOTq2Cz9ZgMiLBw/CtWXHITf+DMosoGl3jW9N++iDDjoS5XlLkUOmA==
X-Received: by 2002:a17:902:b10f:b0:156:612f:318d with SMTP id
 q15-20020a170902b10f00b00156612f318dmr52007896plr.143.1650038336711;
        Fri, 15 Apr 2022 08:58:56 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 h19-20020a632113000000b0039d9c5be7c8sm4849989pgh.21.2022.04.15.08.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 08:58:56 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: docs@lists.yoctoproject.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	john.kaldas.enpj@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: [docs][PATCH V2] Improvements for gdbserver configuration
Date: Fri, 15 Apr 2022 21:28:38 +0530
Message-Id: <20220415155838.375378-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Apr 2022 14:25:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2778

[Yocto #13722]
The Yocto bug reports a few improvements in the gdbserver configuration which improves the configuration of gdb more easier for novice users.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
---
 documentation/dev-manual/common-tasks.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 0e989f78e..2301e3ba0 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -10181,7 +10181,7 @@ debugger.
    an image recipe::
 
       IMAGE_INSTALL:append = " gdbserver"
-      EXTRA_IMAGE_FEATURES_append = " tools-debug"
+      EXTRA_IMAGE_FEATURES:append = " tools-debug"
 
    The change makes
    sure the ``gdbserver`` package is included.
@@ -10235,7 +10235,7 @@ debugger.
 
    Install the SDK (if you built one) and then source the correct
    environment file. Sourcing the environment file puts the SDK in your
-   ``PATH`` environment variable and sets $GDB to the SDK's debugger.
+   ``PATH`` environment variable and sets ``$GDB`` to the SDK's debugger.
 
    If you are using the build system, Gdb is located in
    `build-dir`\ ``/tmp/sysroots/``\ `host`\ ``/usr/bin/``\ `architecture`\ ``/``\ `architecture`\ ``-gdb``
-- 
2.25.1


