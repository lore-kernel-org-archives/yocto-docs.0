Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F98C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:43:48 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.1170.1639588351238779356
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 09:12:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KwCcKFIU;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id z206so2873999wmc.1
        for <docs@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 09:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hD74xDyqOoOrHzp4RORmpZCKIK2U3jP1g7Q2Pd7etLI=;
        b=KwCcKFIUPpWiFL9A3eCsieNTnb7F/YDozmzQvC8apw8fsujg/LQWl0gsRR5vZnlhV0
         HPAnltsHiXKDPgMbBU5TEVZuss/SbaG8GPDgY/N2iHPotBuMMKyjIvU7i+KHoOodtPHY
         85XZnQmTHqf+YpD+0weKvRxk2j3HLN9BjOVTm+2qOy88lrvWtaAyuED7YzlQ+0FV6Bte
         A7mrVN2ELWBws98dvX70ZhfFvj2ViwfW3EyMGW+YdTITwGiCT1fekUZu8gQVVV9Ce6xd
         Xp5z/9FDWCyQ0fqDOZZjX0BchfwvwkXyhrVtFdx84nnYj+HbpffldLCRWRjOQk2QYwe7
         wZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hD74xDyqOoOrHzp4RORmpZCKIK2U3jP1g7Q2Pd7etLI=;
        b=EGBWSNzxnc8oP9sNdPvOEc1fmJvfswzWMlmCncH39cBeOHRmjxLk9Vmi+X8UgCBGiu
         KKx6b9a73C+gUC2EqWnw9cCbp6zIVAT/nccga30VfjGC2b1SHrK/lZGoUjon4M+OuphK
         jbqSYlP0WcX8IEiD0+axlRRMRebh4foUuzinKNt4TUv8cO9kn72HHyJZuSR3kxghiBnH
         DB6dAO8wcJCN9XfkhJdqlzWOFxUBrEY79be+gXMhiUAkSVlhBUASy1ccDZgwY7RFFLVt
         4/RuXREPbRpw5EU7BgiS0JjP3kHGvgwxsBzumjwn3d3fYJD8NnuHqt6tthjqtQ1jnMC9
         GPSg==
X-Gm-Message-State: AOAM532Tb24nedW1B5WXQYsuq36s7rhvq7KgrsvqzCVSnePrXswyU/fx
	5K3/ppp2NWxMikERv9zdRvcf5O6yAfMAdQ==
X-Google-Smtp-Source: 
 ABdhPJxGZ2RjCbqPNCGCeOepKIJdjG9+TDv8y5jzFZxeNVC01JhfP8SwNRgV1C7nYuEBLY46sldpkA==
X-Received: by 2002:a05:600c:4e45:: with SMTP id
 e5mr845476wmq.43.1639588349611;
        Wed, 15 Dec 2021 09:12:29 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-169.002.205.pools.vodafone-ip.de. [2.205.7.169])
        by smtp.gmail.com with ESMTPSA id 5sm880460wmk.0.2021.12.15.09.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 09:12:28 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH 2/2] ref-manual: document overlayfs-etc image feature
Date: Wed, 15 Dec 2021 18:11:38 +0100
Message-Id: <20211215171138.127272-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20211215171138.127272-1-uvv.mail@gmail.com>
References: <20211215171138.127272-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Dec 2021 01:43:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2277

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 documentation/ref-manual/features.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index ded653221..5f6c00fac 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -219,6 +219,10 @@ Here are the image features available for all images:
 -  *empty-root-password:* Sets the root password to an empty string,
    which allows logins with a blank password.
 
+-  *overlayfs-etc:* Configures ``/etc`` directory to be in ``overlayfs``.
+   This allows to store device specific information elsewhere, especially
+   if rootfs is configured to be read-only.
+
 -  *package-management:* Installs package management tools and preserves
    the package manager database.
 
-- 
2.28.0


