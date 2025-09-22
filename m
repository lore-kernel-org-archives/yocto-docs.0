Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0926FCA100F
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 21:03:26 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.1205.1758574999346507144
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Sep 2025 14:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=X3U/EU8l;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so2410709f8f.3
        for <docs@lists.yoctoproject.org>; Mon, 22 Sep 2025 14:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1758574997; x=1759179797; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ge0tl04XOl9geBcDLQLsdRus9o5ykcY5A+sDqhyCoVg=;
        b=X3U/EU8l/Wk8b7LcSf1GUZygnWrFRqIHCH9AjDxrIU3VKEp+AB8Ql0Kmpp63iy+8QX
         MCZwcSVCHeRwWIyZgxrx2kqbEX0yCROUJJRMVnAHy3T8GsSY1pRUQKDhWbdchPV6pTmQ
         LjXCyIpfiv/UPJrNRo9hTD4yOvpdBD9pdkIqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758574997; x=1759179797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ge0tl04XOl9geBcDLQLsdRus9o5ykcY5A+sDqhyCoVg=;
        b=ahaKR3kKRJsgg8rz/Xw2r1FXqPVjqPQvw2JbTW/wNdgtAxsiN5s6Z4QPiH/vX2axfv
         RXZfhpfHhY2PCP7xbq2D+0fkrsScEXKf9gay4iVufaK85nfskmho+yB+jDWxlSBzYUEc
         9eySz6fRBgVl7NMwl+hrlS4mZPePmxCLOjdtMvgDpN2Wl+96bw+L0uORFP3wXSlPwRlq
         TpewLa+hv4xFKm+K+zoBOpjqyHqI91OZ1BN4Ta8OzyvKPVrIzJsZ07Ip7cHt+zIdVtRW
         YOo/kdS/gqrH5/bR9eDUE1n3p+6BEjiYvSce6FVNpalMm3EdSZK8TSAAXtz8r+FnYIeU
         RBjA==
X-Gm-Message-State: AOJu0YyfJmEVYBxYlFhrRnNg5FEHLdG4Jn+3DnwHrGGd6Khl3QuWX3vX
	xmxtzPvRRS2vX20OlQtjuHRWMfJ8yeR36e5q4z4X3L5DuCbFcXja4EML5+YQlBKrOE4ZhiQpcSz
	kF/uF8VA=
X-Gm-Gg: ASbGncuBZFFjUNM0mqLPq03uT+q3gufghgvzJShrc+y3rDdhA3jZ4QKNVqV2aPK1fvl
	ChVgb/vfuv3X08qcHd3XEdSWCwUipZkEOiBOW5VwgPF9NSilPbQ3nlMlhWMvB95RTjyw5NFwnO1
	5TQ+EVrMAeMHLOzCp9M9tp1Vbr6a6WgTJ1r1H8LFSz6WH09HSTj4UoU23zKf8ATx8KXmOueOxy2
	9cWganVKnle/tiLhAeLNf66LWxbMXaQ6WKn0tx3XHBk7MbS02B36xTL+GikA+QK5QMTprPV14TJ
	ezkiqLNKdqxNzeALLZMSWKLcu409y4vHIl5vC/qRU3zUkQoccRMAqfaOdl9M1b02g3MfVNgCpOF
	0eCDUhUrzPYdu/PtbmTnbS1Z1eRkWZzv6xFMoA4PdOI+7kqPqySk+he2Mnz8z+MuqkqYC3iZEPO
	0bie9cSrliVXlB9O3aMTgS6FXYbOc9zA==
X-Google-Smtp-Source: AGHT+IGoUpZa0pzGYCl9DP2YZAkTpLbzv4hbWuPq8hYAQ5a9yK50yuvCsau1Sqzk5SEJE8aGHm3dfg==
X-Received: by 2002:a05:6000:40da:b0:3f2:dc6e:6a83 with SMTP id ffacd0b85a97d-405cb9a5341mr71162f8f.59.1758574997262;
        Mon, 22 Sep 2025 14:03:17 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee073f3d73sm20954876f8f.8.2025.09.22.14.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 14:03:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] migration-guides/release-notes-5.3: using runqemu with compressed images
Date: Mon, 22 Sep 2025 23:02:49 +0200
Message-Id: <20250922210249.467942-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Sep 2025 21:03:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7578

From: Yoann Congal <yoann.congal@smile.fr>

In OE-core commits:
* b5f8c3e029 (selftest: runqemu: add tests for booting zst compressed image, 2025-07-31)
* e069fe2480 (runqemu: Add support for running compressed .zst rootfs images, 2025-07-31)
runqemu gained the ability to run compressed image (+associated test).

Add this information to the release-notes for 5.3.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 documentation/migration-guides/release-notes-5.3.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
index 0ff3883bf..417087e35 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -330,6 +330,11 @@ New Features / Enhancements in |yocto-ver|
       machine's CPU must also be recent enough to support these instructions
       natively.
 
+   -  ``runqemu`` can now run compressed images with snapshot mode. For example,
+      with ``IMAGE_FSTYPES = "... ext4.zst ..."``, you can run::
+
+         runqemu snapshot ext4.zst <image-recipe>
+
 -  Documentation changes:
 
    -  Part of :term:`BitBake` internals are now documented at
@@ -445,6 +450,8 @@ New Features / Enhancements in |yocto-ver|
 
       -  ``context.py``: use :term:`TEST_SUITES` if set.
 
+      - ``runqemu``: add new test for booting compressed images.
+
    -  :ref:`ref-classes-testexport`: capture all tests and data from all layers
       (instead of the :term:`OpenEmbedded-Core (OE-Core)` layer only).
 

