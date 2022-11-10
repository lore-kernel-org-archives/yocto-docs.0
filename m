Return-Path: <atanas.bunchev@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF74C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 06:34:48 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.3920.1668062087350718682
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Nov 2022 22:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=J1/gBGqB;
 spf=pass (domain: konsulko.com, ip: 209.85.208.53, mailfrom: atanas.bunchev@konsulko.com)
Received: by mail-ed1-f53.google.com with SMTP id a67so1551317edf.12
        for <docs@lists.yoctoproject.org>; Wed, 09 Nov 2022 22:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pM2fzQWkSfTSXmLngyx31KTU7O4pN7gj86szA3cu05g=;
        b=J1/gBGqBr2E1G9c+z8vmJR3nsK5dCczUGH3b7yGkaDVlCVwQkevaDBfn/q0y4n9Hfm
         XOAA9Aq8vdv60HUMLGxTRlBlbJj6bKX453m7l161Tjx1+9Ju8RoK/Ihk+6SM3cLNLa6r
         p8Z7/b64LT60BJVOm2NrBA32PMlKqxRQ4ZH7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pM2fzQWkSfTSXmLngyx31KTU7O4pN7gj86szA3cu05g=;
        b=j1DPbdufyXhM/V2R0kO1FeRi3AcB5r6ZXhQ8+Gg0zVHN1sZv8GJrNys5R32htZ2SoN
         lx2iaALggB5yYSOr9DeCajUXlqF8o0G72Z2rqZxBQABfM6kGa+K/1DfyeHLBY3lZrZmq
         n5WE9OYk6YQJBQz53grWe1Bn2D8mMwn18fCf58bRRpWoKf/ClS1m/0Hfcnsxsv5cENPp
         EaACq9DIppDIwKBoqQeaukdibgCZeq8EPb/uYmFAsN0Z7ZSWjO+DXmSFK1pqeZa+zf8W
         jFdOrl6s2peGPiVgCwD/j9BzjR72rWDrSLbCrbpsux6HiKjJmlrCMoNvA5q1giFM5uKf
         YbOg==
X-Gm-Message-State: ACrzQf3peWMOBdEbmRi39HXXLQj7g1ve2kgnQlHCMc55FYH9n5Kxq5l1
	Knrf5AXO7kTK/JMBgVzZUx/qRzrF0Zt6f5dk
X-Google-Smtp-Source: AMsMyM5eiK8ONN7UOBbkfL+Z4AJqmkDhL9ZqbEnOeKgixUnvLt+o+TfcvFB3NheTUSwMqg0fufmTQg==
X-Received: by 2002:a05:6402:c87:b0:459:9dd3:2217 with SMTP id cm7-20020a0564020c8700b004599dd32217mr1695523edb.163.1668062085656;
        Wed, 09 Nov 2022 22:34:45 -0800 (PST)
Received: from localhost.localdomain ([195.214.248.20])
        by smtp.gmail.com with ESMTPSA id lb11-20020a170907784b00b0073dbaeb50f6sm6709441ejc.169.2022.11.09.22.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 22:34:45 -0800 (PST)
From: Atanas Bunchev <atanas.bunchev@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Atanas Bunchev <atanas.bunchev@konsulko.com>
Subject: [docs] [PATCH v3] qemu.rst: slirp port forwarding details
Date: Thu, 10 Nov 2022 08:36:10 +0200
Message-Id: <20221110063610.9047-1-atanas.bunchev@konsulko.com>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Nov 2022 06:34:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3486

Explains the default behavior of `runqemu slirp`.
Explains how to forward ports from the guest to the host machine.

Signed-off-by: Atanas Bunchev <atanas.bunchev@konsulko.com>
---
 documentation/dev-manual/qemu.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 5a4a82ce6..bdfa8f3e3 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -426,6 +426,28 @@ command line:
    networking that does not need root access but also is not as easy to
    use or comprehensive as the default.
 
+   Using ``slirp`` by default will forward the guest machine's
+   22 and 23 TCP ports to host machine's 2222 and 2323 ports
+   (or the next free ports). Specific forwarding rules can be configured
+   by setting ``QB_SLIRP_OPT`` in ``qemuboot.conf``.
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


