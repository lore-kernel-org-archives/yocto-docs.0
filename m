Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E051AE7AD71
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 15:17:52 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.111379.1696346264460897877
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Oct 2023 08:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=NaA9yv/t;
 spf=pass (domain: baylibre.com, ip: 209.85.222.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-775810b032aso75894085a.1
        for <docs@lists.yoctoproject.org>; Tue, 03 Oct 2023 08:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696346263; x=1696951063; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LVzeeCZ04fB648DFwPVGvxBW30ebfWfTVBHv6LdxaZ8=;
        b=NaA9yv/tmHXKSihRMvetXX3hIbDw8JVp/kXoCJeqybiqLrntr3c2IKykxO4eZ+kkST
         jL1GE03+jnZRwG+7xZVoC3/Z67lnCHMWZaJIrtaX0X/IfSshjOnDcrzVUeTpbIuln35o
         Iyvwv8meSqCOn+8/308sDLshcDUfVSh4LKkV7Rvz0eZD0UGo/zCoTmwsXtqoko6zvf4O
         VOYzozlxABQfHjECESezAPABA4+CnstFX3EDGufTxQk0fbt/7XO43+LxyVuhtVzoZfLa
         6ccoxmrqV5b0rl67oIgO6YJ8rOJGxDu4APAgzvT+QTKrZfxbDNpjwdYHbkAG7wAGUtxo
         Wudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696346263; x=1696951063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LVzeeCZ04fB648DFwPVGvxBW30ebfWfTVBHv6LdxaZ8=;
        b=PgsxG2w6t7XbfF2NX4uoRMfOfXmWRXguN2sAizQ+GKEgdAp7A/MtUmqz3shXRQ28qi
         xIEYAHJr8Fu9c8j6BeUwPMZyMLHu/2/2xVwh3YWCM9pV1Ygbw0Rod+GbFwojHFcn1SHH
         NY8FIZ2IfhqIlhzyqxbCNFWk4bavmz7+120C0PWwKlVf2OHNHJRIl4gSPC25meWt1pXi
         SySXpOx4vjozSrxPrul498zkttB74JtfZ9+1ke7H7nhIWeAMb6SDwCv1m3rgTH6tmT99
         odMCHmL3piNsbaFOfwqZzjJwNQm88OmlPkYaYaB07f2zCO7CgyXIXARfOqpEePObbF2/
         Jz+w==
X-Gm-Message-State: AOJu0YyKYS74KeMQOpa1xxBc9Ox+laDFRqWHIZVGqPDhiPQB2WkNR2R/
	o+X1UEB/p4sbEbqlyEPYXs9Q+3NG7JDw8f7WkHC0YQ==
X-Google-Smtp-Source: AGHT+IHO+NgztIuKXB6mVgyA1I6Jc5XdLaxKyMs92V+HNkNZffU6bKyEL89HZ2GBdqEh69fzYEZnWg==
X-Received: by 2002:a05:620a:404c:b0:775:a3fc:a9f1 with SMTP id i12-20020a05620a404c00b00775a3fca9f1mr10352466qko.21.1696346262954;
        Tue, 03 Oct 2023 08:17:42 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id j6-20020a05620a146600b0077413b342e9sm526405qkl.128.2023.10.03.08.17.42
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 08:17:42 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] dev-manual: fix testimage usage instructions
Date: Tue,  3 Oct 2023 11:17:41 -0400
Message-ID: <20231003151741.1255292-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Oct 2023 15:17:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4304

The proper way to inherit the testimage class is now

IMAGE_CLASSES += "testimage"

so change lines with 'INHERIT += "testimage"' to match. This makes the
dev-manual consistent with the migration guide, which already specifies
that the old way causes an error.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 documentation/dev-manual/runtime-testing.rst   | 4 ++--
 documentation/dev-manual/upgrading-recipes.rst | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/dev-manual/runtime-testing.rst b/documentation/dev-manual/runtime-testing.rst
index c5c5653be..af3fe2c1d 100644
--- a/documentation/dev-manual/runtime-testing.rst
+++ b/documentation/dev-manual/runtime-testing.rst
@@ -229,7 +229,7 @@ The final thing you need to do when setting :term:`TEST_TARGET` to
    statements in your ``local.conf`` file::
 
       IMAGE_FSTYPES += "tar.gz"
-      INHERIT += "testimage"
+      IMAGE_CLASSES += "testimage"
       TEST_TARGET = "SystemdbootTarget"
       TEST_TARGET_IP = "192.168.2.3"
 
@@ -335,7 +335,7 @@ You can start the tests automatically or manually:
    inherit the :ref:`ref-classes-testimage` class by editing your
    ``local.conf`` file::
 
-      INHERIT += "testimage"
+      IMAGE_CLASSES += "testimage"
 
    Next, use BitBake to run the tests::
 
diff --git a/documentation/dev-manual/upgrading-recipes.rst b/documentation/dev-manual/upgrading-recipes.rst
index 947ef138a..4fac78bdf 100644
--- a/documentation/dev-manual/upgrading-recipes.rst
+++ b/documentation/dev-manual/upgrading-recipes.rst
@@ -117,7 +117,7 @@ The following steps describe how to set up the AUH utility:
       class, which is optional, you need to have the following set in
       your ``conf/local.conf`` file::
 
-         INHERIT += "testimage"
+         IMAGE_CLASSES += "testimage"
 
       .. note::
 
-- 
2.41.0


