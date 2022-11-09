Return-Path: <atanas.bunchev@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D4FC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 13:49:40 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.3316.1668001773211589910
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Nov 2022 05:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ege8XFP+;
 spf=pass (domain: konsulko.com, ip: 209.85.218.52, mailfrom: atanas.bunchev@konsulko.com)
Received: by mail-ej1-f52.google.com with SMTP id f5so46799275ejc.5
        for <docs@lists.yoctoproject.org>; Wed, 09 Nov 2022 05:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OQypH77Up4cl00X4ngD3jnPR1yTx3DPIvJaScnhAyao=;
        b=Ege8XFP+9oZkHjNdBj/oReSNaZlbIh5tza4+r7/W1OjOMw3ohvHnBqP/PieZ+g3xGf
         HL5GL7/waLn0GXCUquqR+tW3TPUxAde0GUGcxriwTYPdzJFxHqvbDQN0RkNQh3f5SzeH
         EP5gCeZssyMQWTIfIPoaWm4vmQxST51Nsl2lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQypH77Up4cl00X4ngD3jnPR1yTx3DPIvJaScnhAyao=;
        b=tRJ0WhYvU2LxEhA94L+NLFnlFGG2PXhy5H0WvnOS9xfUz8/+hNIrJjaVZ0XDjEilJD
         JfQWv+LlUVLfoUmZOHcxxEXV0CXy2WBKmQo5+L0oxF1sGhitsHQ2C27R/bj2pN44r56H
         RYXVs6WlM9Zu97xe9xlrcIOcSQGLzuVGKGlKVyYHtuOA12pGGDGpZH90pbLA/z9IACT1
         vVjH+Emdhonsd0B7O0rTUn4d1s+Jsa6Ii4TJFbrgG0yM/LNG6uGS9/06nD68rpbQsoGg
         4VqrhdwB+zV6tWA/53pwDwmSlI3NHGDwYHCcL/Bznfa2Jn6cJv0th8m9KJXTHT5FQQCr
         qwGg==
X-Gm-Message-State: ACrzQf1pocwK0oVI4A9nxFqUBvxP51BbWX9ejmGf9PhXmjpfkdAbzQWQ
	Eo9YD527bf7pVmeD+AYKljHlz3UZfukzG9vCYvU=
X-Google-Smtp-Source: AMsMyM59Z/C1gctPfyn/MES7og9faV2B8vk9w4QOi9/Kt0FZkFHjd1Iy2lLShlXn7cEMzknFPqQzTQ==
X-Received: by 2002:a17:907:7805:b0:780:24fd:c4e8 with SMTP id la5-20020a170907780500b0078024fdc4e8mr57721370ejc.78.1668001771658;
        Wed, 09 Nov 2022 05:49:31 -0800 (PST)
Received: from localhost.localdomain ([195.214.248.20])
        by smtp.gmail.com with ESMTPSA id vc7-20020a170907d08700b00782e3cf7277sm5872644ejc.120.2022.11.09.05.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 05:49:31 -0800 (PST)
From: Atanas Bunchev <atanas.bunchev@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Atanas Bunchev <atanas.bunchev@konsulko.com>
Subject: [docs] [PATCH v2] qemu.rst: slirp port forwarding details
Date: Wed,  9 Nov 2022 15:49:30 +0200
Message-Id: <20221109134930.21879-1-atanas.bunchev@konsulko.com>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Nov 2022 13:49:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3481

Explains the default behavior of `runqemu slirp`.
Explains how to forward ports from the guest to the host machine.

Signed-off-by: Atanas Bunchev <atanas.bunchev@konsulko.com>
---
 documentation/dev-manual/qemu.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 5a4a82ce6..a17c8cead 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -426,6 +426,27 @@ command line:
    networking that does not need root access but also is not as easy to
    use or comprehensive as the default.
 
+   Using ``slirp`` by default will forward the guest machine's
+   22 and 23 ports to host machine's 2222 and 2323, incrementing
+   them if they're already taken by another ``runqemu`` instance.
+   Specific forwarding rules can be configured by
+   setting ``QB_SLIRP_OPT`` in ``qemuboot.conf``.
+   Examples::
+
+      QB_SLIRP_OPT="-netdev user,id=net0,hostfwd=tcp::8080-:80"
+
+      QB_SLIRP_OPT="-netdev user,id=net0,hostfwd=tcp::8080-:80,hostfwd=tcp::2222-:22"
+
+   The first example forwards TCP port 80 from the emulated system to
+   port 8080 on the host system, allowing access to http server running in
+   QEMU from ``http://<host ip>:8080/``
+
+   The second example does the same, but also forwards port 22 to 2222, 
+   allowing ssh access to the emulated system using
+   ``ssh -P 2222 <user>@<host ip>``
+
+   Keep in mind that proper configuration of firewall software is required.
+
 -  ``kvm``: Enables KVM when running "qemux86" or "qemux86-64" QEMU
    architectures. For KVM to work, all the following conditions must be
    met:
-- 
2.37.4


