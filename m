Return-Path: <atanas.bunchev@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309B9C4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 11:47:00 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.2318.1667994414743498677
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Nov 2022 03:46:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=R/GXOgYR;
 spf=pass (domain: konsulko.com, ip: 209.85.218.44, mailfrom: atanas.bunchev@konsulko.com)
Received: by mail-ej1-f44.google.com with SMTP id n12so45852358eja.11
        for <docs@lists.yoctoproject.org>; Wed, 09 Nov 2022 03:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1LeRJRuy63oUps575l2csXqhtbKf+4IFc1BLkK86qis=;
        b=R/GXOgYRnbj9PA1xC9kS5XlZRjtC3Jc+IrH05KTFTDwv0CD2dMfB3/ftFriRDnMYsm
         ndOJPo0hSHiaPUus+PCDvgQsx2pEzThyzeeSCzExDP4Z4o9AWSMvB3z8/2AyMqIQr/ss
         Qsh6c9FTAeoPdRYwhn1YgBIeLJU4GgW9yip5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LeRJRuy63oUps575l2csXqhtbKf+4IFc1BLkK86qis=;
        b=EkCOjgQM/mIfiRJpcr8Srl8XY5ypTjYWPIpNKiFAIt7xAf+BAn0R+JIbXfy2XnS82K
         ZS70Cm4O+2QXqhqn1GbeAogzBvTuVDHDnA9piFxFwoQDeNxjc3ldVS/WqjhzziLEOaei
         L2YGR22k269gcsPcPgI2EI9hanclrpAcHvdR2AXRl9ZZus0TYiMd754YgIkQB56mOoPx
         AzbgJDb83Q/XogvNEYTnUbXMt0gHuqyGSDmLcun5WrdbwmtLJ7roB5T4ypEKn/AJ9In8
         BlBdUciMH18kgr41kEGqzucsFb9LEXwHCNUHJJeidBMbFUwWj/75bH3JPwl+AsvGRti2
         TH8Q==
X-Gm-Message-State: ACrzQf2kZBBy2ZbhHgj2pGVWMDHKhxsH+SChadntQudZzDeBdIz7y+1N
	utyPYIpfHldunQM+HVAY+VWbc7JbScH8AUDdmKw=
X-Google-Smtp-Source: AMsMyM7WpMZqdZ084s7e2LM6QC1RN9BL5mCOsElvTAnAr+kXgwW0MmEz4Ypwf1n4HHeF/AfPnfRiQg==
X-Received: by 2002:a17:907:b16:b0:7ad:855b:c08c with SMTP id h22-20020a1709070b1600b007ad855bc08cmr57575385ejl.667.1667994413186;
        Wed, 09 Nov 2022 03:46:53 -0800 (PST)
Received: from localhost.localdomain ([195.214.248.20])
        by smtp.gmail.com with ESMTPSA id kv3-20020a17090778c300b0077a11b79b9bsm5799531ejc.133.2022.11.09.03.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 03:46:52 -0800 (PST)
From: Atanas Bunchev <atanas.bunchev@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Atanas Bunchev <atanas.bunchev@konsulko.com>
Subject: [docs] [PATCH] qemu.rst: slirp port forwarding details
Date: Wed,  9 Nov 2022 13:48:23 +0200
Message-Id: <20221109114823.16010-1-atanas.bunchev@konsulko.com>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Nov 2022 11:47:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3477

Explains the default behavior of `runqemu slirp`.
Explains how to forward ports from the guest to the host machine.

Signed-off-by: Atanas Bunchev <atanas.bunchev@konsulko.com>
---
 documentation/dev-manual/qemu.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 5a4a82ce6..1f866f1b7 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -426,6 +426,16 @@ command line:
    networking that does not need root access but also is not as easy to
    use or comprehensive as the default.
 
+   Using ``slirp`` will forward the guest machine's 22 and 23 port to host
+   machine's 2222 and 2323, incrementing them if they're already taken
+   by another ``runqemu`` instance. Specific forwarding rules can be
+   configured by setting ``QB_SLIRP_OPT`` in ``qemuboot.conf``.
+   Examples::
+
+      QB_SLIRP_OPT="-netdev user,id=net0,hostfwd=tcp::8080-:80"
+
+      QB_SLIRP_OPT="-netdev user,id=net0,hostfwd=tcp::8080-:80,hostfwd=tcp::2222-:22"
+
 -  ``kvm``: Enables KVM when running "qemux86" or "qemux86-64" QEMU
    architectures. For KVM to work, all the following conditions must be
    met:
-- 
2.37.4


