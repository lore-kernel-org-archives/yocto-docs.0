Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E2BC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:30:44 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.4292.1665394235499049527
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PpvlFZJt;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id f11so16129386wrm.6
        for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 02:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a3s1TBkhwnBQxmULLgCjC7yqKu79qvC19BGxpyxpVgc=;
        b=PpvlFZJtYp+e+tRiTrCFpGyaBc6aZ3YGut3ORm5E+jjcEuEDGm8/KCHw2j90hCq7xR
         5bjFWDXWP+JfA8hIrvd0qmZQkqA8MHh/NzmKRn254a4IyZk3tm4o5X2tieoup86n/txV
         xDcZ1GLrFaxrRE9tJHO9Vq7xLHU6+JqJSkrXkGhs7zXzvvz7ciH3cSuMGQas7mV2OARd
         +PPTZ4sO/RSl4tOkDkbo5fJUAlOWqWoxAK3W3StJUp9G7fEzGsDCSolf/bikCPwuoeJG
         16buUIe5Ouh8GdMSLHbkxTD9wg5FPjkbKSbRVBSg1W14vHPwK/Wcd2PZw5l9wFmEr9ra
         FGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3s1TBkhwnBQxmULLgCjC7yqKu79qvC19BGxpyxpVgc=;
        b=R9nnFEuJCfAYxywBJNeCY7B4ebWvgu19wp17IJJnxR/hXkNDBxPbz6nZ3LOfryGKPB
         IfTcnOpnmuFeWfiODN7XPWYyvEKsbtbxkv6sW6qzLmGrtO57Zqgfhtc90AJfhCE2CEvK
         pWLWoESJlYWNQ5I+mSsOzf4IplSdpJaQIOwXYrrsuJAzsSKE8irDZddGXd7RTZJYjNCl
         DvqwajKUqeEFUHQ9auQ6TC7eEZX5ujTnfoiKzD4d0dxQa4oglCnY+Lve8Mi+PdfUK7TK
         lJJC6GOxl0yy6r3m6AtNmLGieXckH1vu5ntq0mEFTIubHERHGgxUa3qZQ3ime5sDZbI7
         BDAQ==
X-Gm-Message-State: ACrzQf2qj4NDXJD6nkJjR50COlhidXgGXU/0jym0R4hgpiGGmFuQqe70
	domXnMuMcTd28t+DfDMQ1Bk8Cn6zzdI=
X-Google-Smtp-Source: 
 AMsMyM7VixEkPUIdd0gVQQcSQx/92xqsoo3wqOiB/w9gbDGJP74jq2O6iZNX7Tp3RuIf5r8jvbvc7w==
X-Received: by 2002:a5d:6da9:0:b0:22e:53bd:31c1 with SMTP id
 u9-20020a5d6da9000000b0022e53bd31c1mr11884505wrs.358.1665394233742;
        Mon, 10 Oct 2022 02:30:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 c190-20020a1c35c7000000b003b492338f45sm10050158wma.39.2022.10.10.02.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 02:30:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] sdk-manual: correct the bitbake target for a unified sysroot
 build
Date: Mon, 10 Oct 2022 11:30:26 +0200
Message-Id: <20221010093026.1803479-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 09:30:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3337

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/sdk-manual/extensible.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 09b716981..3e3fa6c05 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -71,7 +71,7 @@ Setting up the Extensible SDK environment directly in a Yocto build
     $ bitbake meta-ide-support
     $ bitbake -c populate_sysroot gtk+3
     (or any other target or native item that the application developer would need)
-    $ bitbake populate-sysroots
+    $ bitbake build-sysroots
 
 
 Setting up the Extensible SDK from a standalone installer
@@ -1274,7 +1274,7 @@ is directly accessible to build additional items, and it
 can simply be executed directly:
 
    $ bitbake mesa
-   $ bitbake populate-sysroots
+   $ bitbake build-sysroots
 
 When using a standalone installer for the Extensible SDK
 --------------------------------------------------------
-- 
2.30.2


