Return-Path: <atanas.bunchev@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6630C4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 10:20:22 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.3934.1668162020675577926
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Nov 2022 02:20:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZeQ/T5pg;
 spf=pass (domain: konsulko.com, ip: 209.85.218.42, mailfrom: atanas.bunchev@konsulko.com)
Received: by mail-ej1-f42.google.com with SMTP id i10so2898509ejg.6
        for <docs@lists.yoctoproject.org>; Fri, 11 Nov 2022 02:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/hlDCbpFkDULLN9gWCfmmFz5jB6BBJgnHaVlTwfEyD4=;
        b=ZeQ/T5pg8yeuZFUbRohSN30v27yXh1nYj/jbTJMWKTbl1/c/6w80nDCEr11tizSDXs
         wuE99CTBlpOmX7hXUxb9+Wk+SKvs41m4x6aFqhQ1GtNU4n+SMSw1mB9aAJrGip0g5gsB
         bi6JClyC9ILZDX0UNnsF73thyrUO5aQvKqVM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/hlDCbpFkDULLN9gWCfmmFz5jB6BBJgnHaVlTwfEyD4=;
        b=DgFp4KM6yM9TlFdKsfolwJZ/KuU2VVLA5jHS2lP8uW5liCq+Fkh4sRUlCO+RBAmeL2
         aumqNJelp9cbJhtnY6Cqx5glQsah6DcGKjkl0yE1LSDJZWXTGqV4EStImy+51gsyaaFc
         DrO7ydhW3IdHGnphWWnungMdBKw+OHzjHNEKmkpNy4/v71mwaVj7LMYyfMBloxygH6iL
         OlwVj+fDHnSLEoEQtCVUeKRzR+jzxhsmmY5EQuAINeKivSffh3dj89ylzgrsD6J9V9gZ
         akw5SHf1tgCMKJ88jJT73bmoy5QE3feZ8qUv7hlStyXbtiL1Wo16D+pGk8d5xkKz247A
         nGeA==
X-Gm-Message-State: ANoB5pkpOBfHavc/rTpHU8wQIMw5HPULCrZ5jI47wDUau+hDKHBOAQvG
	tOvSnYxaRa+ssCTbNHLZrXAIT8ldOqsZs8dg
X-Google-Smtp-Source: AA0mqf5tDGgOEoAK3CtrwxCBbtCriej/EN+YQcDHvIkj0oFolN/tn2TC2LiXGkPuwarB9gSH+GrtOA==
X-Received: by 2002:a17:907:990f:b0:7ad:79c0:5479 with SMTP id ka15-20020a170907990f00b007ad79c05479mr1288436ejc.392.1668162018954;
        Fri, 11 Nov 2022 02:20:18 -0800 (PST)
Received: from localhost.localdomain ([195.214.248.20])
        by smtp.gmail.com with ESMTPSA id b3-20020a170906728300b007ad86f86b4fsm720203ejl.69.2022.11.11.02.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 02:20:18 -0800 (PST)
From: Atanas Bunchev <atanas.bunchev@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Atanas Bunchev <atanas.bunchev@konsulko.com>
Subject: [docs] [PATCH v4] qemu.rst: slirp port forwarding details
Date: Fri, 11 Nov 2022 12:21:51 +0200
Message-Id: <20221111102151.7159-1-atanas.bunchev@konsulko.com>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Nov 2022 10:20:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3491

Explains the default behavior of `runqemu slirp`.
Explains how to forward ports from the guest to the host machine.

Signed-off-by: Atanas Bunchev <atanas.bunchev@konsulko.com>
---
 documentation/dev-manual/qemu.rst | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 5a4a82ce6..03a05c071 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -426,6 +426,29 @@ command line:
    networking that does not need root access but also is not as easy to
    use or comprehensive as the default.
 
+   Using ``slirp`` by default will forward the guest machine's
+   22 and 23 TCP ports to host machine's 2222 and 2323 ports
+   (or the next free ports). Specific forwarding rules can be configured
+   by setting ``QB_SLIRP_OPT`` as environment variable or in ``qemuboot.conf``
+   in the :term:`Build Directory` ``deploy/image`` directory.
+   Examples::
+
+      QB_SLIRP_OPT="-netdev user,id=net0,hostfwd=tcp::8080-:80"
+
+      QB_SLIRP_OPT="-netdev user,id=net0,hostfwd=tcp::8080-:80,hostfwd=tcp::2222-:22"
+
+   The first example forwards TCP port 80 from the emulated system to
+   port 8080 (or the next free port) on the host system,
+   allowing access to http server running in QEMU from
+   ``http://<host ip>:8080/``.
+
+   The second example does the same, but also forwards TCP port 22 on the
+   guest system to 2222 (or the next free port) on the host system,
+   allowing ssh access to the emulated system using
+   ``ssh -P 2222 <user>@<host ip>``.
+
+   Keep in mind that proper configuration of firewall software is required.
+
 -  ``kvm``: Enables KVM when running "qemux86" or "qemux86-64" QEMU
    architectures. For KVM to work, all the following conditions must be
    met:
-- 
2.37.4


