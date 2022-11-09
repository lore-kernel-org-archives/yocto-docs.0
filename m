Return-Path: <atanas.bunchev@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31883C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 11:49:00 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.2259.1667994536465688867
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Nov 2022 03:48:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=l7s+BF7S;
 spf=pass (domain: konsulko.com, ip: 209.85.208.45, mailfrom: atanas.bunchev@konsulko.com)
Received: by mail-ed1-f45.google.com with SMTP id s12so17218212edd.5
        for <docs@lists.yoctoproject.org>; Wed, 09 Nov 2022 03:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jAEVgI+asufbskcTc4pqWAUtDNfbe+J+OfRrUkw/YXg=;
        b=l7s+BF7SLaE1MSkg6cO8RH7B1a6gY5hgoORWxCZJTyNpwkTURzjSb03KndQq/galhJ
         nwCxnuNSjErGvHEaW+nkL0XBPSIP65Xc9as2joQV62lEP5AXe46qzEqiphr5lSad72wv
         PBjCb41GHFIFJ3bPfaOcXJV96goqrfHxsrJsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAEVgI+asufbskcTc4pqWAUtDNfbe+J+OfRrUkw/YXg=;
        b=bjtVmB8Qqa4KvCfILDog928fo+YeZ7DkHb0IOjw+EKZOMnzN0tVyqn+kgT2/TWQ5FO
         4bevfsQNNtJg+vZZw5w3sEvA3gyw1Jou9iErHJzpzwNRqpw+jQ761cAfgiITFXY+R5M8
         32W0lFOr7692+YcCnW7hyaV7HjbOgh7YZuKQ2LZPW3CNVObDobrcFY6izTCSqPx5IbMW
         QOy7uEioYPGXcG2GRDXENEVS2GP9NKIHLQgAuz6KQFCianco7zoGpvGehtKOT0Hs7OhT
         gJTfwtEK14V7JT3brcdN/KxIYJyik7sj0yyVHGN5xygQ5IcKOldBCd4+UMMWd63kViS3
         RmVQ==
X-Gm-Message-State: ACrzQf0Q4D/7Vag2KsCgE6TwyDO2/HOvXF0JgopA4GRZFqjZel+Qx8zK
	o28m4mMaDv9lUmbMcy9bYmEFahwdpk9210Fy0yg=
X-Google-Smtp-Source: AMsMyM64SJzXpnA36Z7GaVtL6/2QUAuDPPhEhHBdec4II0Xx4JvSMLE6EK5Vv9PlW53pTCv6Mh23QA==
X-Received: by 2002:a05:6402:518a:b0:464:5ec3:c5a with SMTP id q10-20020a056402518a00b004645ec30c5amr28694187edd.90.1667994534828;
        Wed, 09 Nov 2022 03:48:54 -0800 (PST)
Received: from localhost.localdomain ([195.214.248.20])
        by smtp.gmail.com with ESMTPSA id eq16-20020a056402299000b004610899742asm6761723edb.13.2022.11.09.03.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 03:48:54 -0800 (PST)
From: Atanas Bunchev <atanas.bunchev@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Atanas Bunchev <atanas.bunchev@konsulko.com>
Subject: [docs] [PATCH] qemu.rst: audio: reference to Command-Line options
Date: Wed,  9 Nov 2022 13:50:18 +0200
Message-Id: <20221109115018.16086-1-atanas.bunchev@konsulko.com>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Nov 2022 11:49:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3478

The previous statement can cause confusion, because this is the
first time when the `audio` argument is mentioned.

Signed-off-by: Atanas Bunchev <atanas.bunchev@konsulko.com>
---
 documentation/dev-manual/qemu.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 5a4a82ce6..4fcfd0686 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -125,8 +125,9 @@ available. Follow these general steps to run QEMU:
    -  This example specifies to boot an :term:`Initramfs` image and to
       enable audio in QEMU. For this case, ``runqemu`` sets the internal
       variable ``FSTYPE`` to ``cpio.gz``. Also, for audio to be enabled,
-      an appropriate driver must be installed (see the previous
-      description for the ``audio`` option for more information).
+      an appropriate driver must be installed (see the description for
+      the ``audio`` option in the Command-Line Options section below
+      for more information).
       ::
 
          $ runqemu qemux86-64 ramfs audio
-- 
2.37.4


