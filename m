Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED47EC61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 14:45:27 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23226.1787669125497756556
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 07:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=e4Pbd4ON;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c207cb16cf5so769272066b.1
        for <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 07:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787669124; x=1788273924; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vx7HQHS1ac8PA+qSllFPFfevsbzcVci2pmbAVnKmq4w=;
        b=e4Pbd4ONvFu6sMENAZZf90WMcz71bhavyTohBEhPD8v1zMPz9CsXAvR6Ssb9VMDCP1
         7T8DLNs9fXW1cOuoI4u5GLD1TUIkdC5opv1ewz3Q3tY+7gZknHKIwRzHk7aWzfS9tnKW
         BaZGKflStb0enikkZQaXiL/9c9d1TIhRDlTPvKO2s0GMlXcoAPwQpcUX4KAeLPRgQybf
         B4b1xpeRewuRuVGwoAB+sdBUd0oxzuB8Go0+DtKZMsER/eo6VDLr2Qngm9pW3gEwVfHH
         FUn8scz1dhPf+iiGIsd0HJxQ3LFhCfPDclTBh4Jdz2te9kjKjnId+gdNLrug6OgpptAs
         vziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787669124; x=1788273924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vx7HQHS1ac8PA+qSllFPFfevsbzcVci2pmbAVnKmq4w=;
        b=S55pJu1LkCs62CoOVtxN79EZs7/CVBkLCPOyHcR2J61/sx29ZyYOOahdvnWLCf3adr
         fz3O+TOykePcd76FwmfaEoi42kXdSZms0q2lQbNjwkXxtQnvAm9l3miAmxU3JKr9TkC0
         dZxWESL/3GIeWDyNn1GGH1adRuubgXqOYNYtWXrG41BQkjjXh/Gj4YU/ZdE5Y0gN2GMo
         wrVrmF5vh1xq681ytL0MvaduTNTwkbTxV2gpLfn8qEIFIo8dNShmhVLS/LZI9e2XwrlN
         Y5ocqdyPFmhyILx6iIL3PrTFw7waKQeWJgIdZtrEu2CGIOnMwwgGuoMOQIdfaRPXIH8S
         seHA==
X-Gm-Message-State: AFuF++lLFpewKoeYRYbm6kEX+inHtfriWbDlPDj3+PiCbKRtl5dW3qaD
	2+rdj4co00qgWDkAa/UgWHgvYumSRH5mPlR4lq99C7kYsNY/hYQJNWycVH77onh7
X-Gm-Gg: AR+sD11Qj8qoypFRlzkkgxj93gj/XND0oNkRStjdntUkOXjhD6KaI0m8cNZFEaJDurc
	SjFhifaU9QQjEss9GswjcB1pPy4SXS2iwGLMmG6XOAAq9jJHJuZvLq5fqhC6BTJQVZ+ksz5o9Qt
	Ei/XeaqwRKPk7Dmls4OwGJy4ADJOpCS9aXNpDmz48k8PdHRf7h8pWTDSPBhurMs6CHsCX7b/pZU
	Dw3BTuE1UrjgdQqYAh08+yiok32rCwLYrMahgCOOhbUiPxKlJWp889bNtDOhiHJZojIFLKcEPFk
	TsWTiNYd+sD/0RAhC+U3yPVYVxe3kpl6P+bB7anP7S9aJAgFpUfGUsEiz9eUCWkH8YNOlIkBgz4
	COEVh5kfzfLqG9r412numzXr4P0KDmOn3SnYpsldQQWm+9K3bC1zP9Pq7WRuJvZA3u0Rx9mwsmV
	pwYihwf5SUxwmBm+yMUJaUTQrMgbq0X9cHyDv4A4oO1/TI7LS0cemOUwtE7fX+OzvJC/RoTuJbn
	KhlRVdKjb5K
X-Received: by 2002:a17:907:c20:b0:c1f:b883:ed3b with SMTP id a640c23a62f3a-c246a2cf2d0mr3976498066b.4.1787669123281;
        Tue, 25 Aug 2026 07:45:23 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810d:61f:4100:e4ef:e83f:1a8f:1ecb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968d5f59sm1792779766b.63.2026.08.25.07.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 07:45:22 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
To: docs@lists.yoctoproject.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [scarthgap][PATCH] ref-manual/classes.rst: document the vex class
Date: Tue, 25 Aug 2026 09:45:20 -0500
Message-ID: <20260825144520.16267-1-aleksandar.nikolic22@pm.me>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 14:45:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10338

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

This class has been in OE-Core on Scarthgap for a while but never
documented in the reference manual. Copy the description from master.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 documentation/ref-manual/classes.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 79ed905d5..887cc0c15 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3642,6 +3642,27 @@ using the Vala programming language.
 
 .. _ref-classes-waf:
 
+.. _ref-classes-vex:
+
+``vex``
+========
+
+The :ref:`ref-classes-vex` class is used to generate metadata needed by external
+tools to check for vulnerabilities, for example CVEs.
+
+In order to use this class, inherit the class in the ``local.conf`` file and it
+will add the ``generate_vex`` task for every recipe::
+
+   INHERIT += "vex"
+
+If an image is built it will generate a report in :term:`DEPLOY_DIR_IMAGE` for
+all the packages used, it will also generate a file for all recipes used in the
+build.
+
+Example usage::
+
+   bitbake -c generate_vex openssl
+
 ``waf``
 =======
 
-- 
2.47.3


