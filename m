Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21401073CB6
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 13:05:46 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105898.1775653538474762649
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Apr 2026 06:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TwYnbdbD;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9d166ed21cso255650066b.1
        for <docs@lists.yoctoproject.org>; Wed, 08 Apr 2026 06:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775653537; x=1776258337; darn=lists.yoctoproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6L0CD0rqjxKLPvTBGy4ZTY8/Q+q0fVfM6vRvARI3hk=;
        b=TwYnbdbDP+p+lEfejAfOcCjKf64BXI9t4EBERYjB7L/DFbsD4zpgTt4MtJIsxqJ7Y8
         8Ap1XoBYvTq7AZ3mD2sN5p+bKf8F0yphyK43amiX2RDnvaCebkq6BCnkvB9tP0ZYWFpU
         0CkHaSVkYDlz2Wg2iljv7IzSM+XzjnNFMmxCYmDqjmqChugQWh59AMs1GNchRgarr841
         i4si+ga7caoV79kndeIpye+QX8sfi1nNUn458cpnavogycqt5FlsL4u4dy/lgMqpnOB7
         39uOO7YWWET6dfJQJy3u2pxLiiHQ4ZF607av6PHIVPwFxm0hYydBS18a7AbQqesbY5oa
         91uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775653537; x=1776258337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y6L0CD0rqjxKLPvTBGy4ZTY8/Q+q0fVfM6vRvARI3hk=;
        b=iuxWtyQHwV1qkHURdviKsyoseb/QH6GCqlcvKa/aVcOvPPKRXfPzwpVSeRiP+CoTh5
         OUrgGyYT7XoF+lTmfEgaOtlH2Ycwi7sy6+phIsbu147BSaHgouTIrDBIE17N/KA4TR1S
         5kNzYph5wM/04V6/zPkgjjIF/UdQQ0HdLCH+rhzlT26bwFi6BmjfOSvzc9/zMtYNfRis
         HdrlT9IE7WPW4qqJcSJAb9s68KCA4j7O3MknFS1opaTEIM4pqE8qpVhX6KOkbob8NLIy
         zqAx7oyXD200XR6S2HLCvFvHidGuC0x4RY7UA+8Q+NS9Y43RXuZWWda2ffRinhVMv6R0
         cTyQ==
X-Gm-Message-State: AOJu0Yw3U3h0Dy2VoOcEu7vxMpTuFCHlKWrYD7F0AqDMZglBoM57ngAG
	i38+NA9DATODkANPb5lHeEvAVPG0cT94+04B4YtA7sC6Qrphr5cQrrmZ
X-Gm-Gg: AeBDievF8G19J7iEeIjFoosdFoXYbp2xRWW4wh2/u7e49r0PTt3VfbqKeMKBm6h3fBd
	lNBj0Xg0OVJgD/O1ABATJ7gU+bAKd127JMadK41cTX4QPW2Zs6x5+C2ZiXNFjJHHzKXt3BszLOE
	EHkEzHkjZQAZcRl2yYo2lHKbQyn8kcjjpwgtN6RNAzbSqDnovhHUoRhQivgJlgdVXhZn7wRAR/0
	ph8B61+oVy0pOyPTee3L0x4AAfF5rtpB4MF8aDNPDwF7hi66i+Plvc4GQdHN3MfRjQI18ik62bI
	KBGgMo8EVzyspEcFwfg71FYSl0PU8KcPqHaI3Bzt8n82VIyGrzVUrP9GALTOTUBvyKBWdxEliyI
	UKUNAbi89+vNPBT0Pf5SUjlWeL68iOUjImbgu9r5f8CwBaBENFSJglN0gg1AonIWkidl4KGnrYl
	eQ0XUyFlB4b9czOYIuucpUbsEsVSMbKg==
X-Received: by 2002:a17:907:894f:b0:b98:5648:e68a with SMTP id a640c23a62f3a-b9c679b35d8mr1084639966b.36.1775653536748;
        Wed, 08 Apr 2026 06:05:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:dab4:c153:72eb:4100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca94715sm656643166b.21.2026.04.08.06.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:05:36 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Wed, 08 Apr 2026 15:05:25 +0200
Subject: [PATCH 1/6] ref-manual/variables.rst: update STAGING_DIR's
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-staging_and_packaging_vars-v1-1-387f482308e5@gmail.com>
References: <20260408-staging_and_packaging_vars-v1-0-387f482308e5@gmail.com>
In-Reply-To: <20260408-staging_and_packaging_vars-v1-0-387f482308e5@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775653534; l=1015;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=MT/BfAKvz2rlUNxLC6mMQKXBEG8Bs5PDOc93u5ajsTs=;
 b=Xn9uxBW6yqwpfWwHsMNHaUivtZNlUv7RPUdlqHvUZ/bx3oIvCt2yq1vPyHRW/QG9lZm5lLUMu
 mBM0lq++aVGCwgQy+OCtMdNdgwDWr8veZ7AbwbfwKrSMctP3W1Js+kf
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Apr 2026 13:05:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9200

STAGING_DIR is not in direct relation to recipe-sysroot*
directries. Also it does not participate in packaging, but rather
in staging and sharing files among recipes.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 documentation/ref-manual/variables.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 60e608c0c..7f19723ed 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10160,8 +10160,7 @@ system and gives an overview of their function and contents.
       directory for the build host.
 
    :term:`STAGING_DIR`
-      Helps construct the ``recipe-sysroot*`` directories, which are used
-      during packaging.
+      Used for constructing directory trees used during staging.
 
       For information on how staging for recipe-specific sysroots occurs,
       see the :ref:`ref-tasks-populate_sysroot`

-- 
2.43.0


