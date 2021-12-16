Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C31C433FE
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 11:22:52 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.9375.1639653771412274382
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 03:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Jld5TfDE;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id v11so43520286wrw.10
        for <docs@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 03:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7wgTSR1nHu67Bh4Ahk52J8d8vbohUssNYTgFcD/TKG4=;
        b=Jld5TfDEPKF2tD8LO+P6KY14FpJ3Pbe30ZCXSQ6Nrys1BKN7d8ARLaTFZGyirEMbTh
         95jbF+fe1D/N8ZaAng1AzJUF3P8VhevAQ9cFnc/sGFSz8cUskj4P0EUKNiPUOzt6MoMB
         Mu4ujKt1D0nCF0JEYNgUQPpHVfKoy8vORWGt5MK7YEHs5Hi/2qtHLfT/lGUf7WPA345S
         gaNcnT1hL9KF6wpdCz4JuMJzMBERrpyhIwGO+ia1vvaENNEQ7DlXvr2E6QviZ5BwKVdF
         lx1Z9D4SF6fh77tw5o+M9w34jOIPdNItnxh6i3CiSzitW5zCtiG7P5MRIk4scdsFp3ib
         PZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7wgTSR1nHu67Bh4Ahk52J8d8vbohUssNYTgFcD/TKG4=;
        b=Hp29WHnIDV8t3VWY+yNGb4Hw/ULwf7G8anK2ikvWE0iKOdnBZTAh50AGa+g6F5Cq/Y
         Y9MnvpvoLjw2cikr3qKUVMPoarQc+nrug/RC/ztToEkyduMFajidRqzdWaetHtxZfvRe
         8FiCsSxOZMtJbzcdWXpC6ip6rBpQDUllkm3di6+s5MHeyV+pb02WjWpNb/sBfOQ/zxYW
         3VmxQsgPQ61M6N274ZCEknXFpPin8nU70VyfawhrZ6TdCv3A9cVXQE3Q6rmkSGz61gUV
         OCo6JNtvIJZj70/5A6jZLqppSy/94tmhU2AirQ6qeubyHdmZ4xitN5uFVHtfNty2jiw8
         ErmQ==
X-Gm-Message-State: AOAM5317zeES2BS6fLx9iaEvju+SpBE2xjKBS8lda0cwnzbWuqckkmCJ
	kMfvd4osnPHaXEv/HLZk+c3ephjvA3AiGQ==
X-Google-Smtp-Source: 
 ABdhPJyQRhUPlDlRq0aIF/g7rD/pzKf94YIOuGOaXgY5EQK0QJgmrf4giijw1D2wjiqjo5kmE/Zq6g==
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr8777207wrn.82.1639653769719;
        Thu, 16 Dec 2021 03:22:49 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-169.002.205.pools.vodafone-ip.de. [2.205.7.169])
        by smtp.gmail.com with ESMTPSA id
 az38sm3936626wmb.42.2021.12.16.03.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 03:22:49 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 2/2] ref-manual: document overlayfs-etc image feature
Date: Thu, 16 Dec 2021 12:22:35 +0100
Message-Id: <20211216112235.129737-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20211216112235.129737-1-uvv.mail@gmail.com>
References: <20211216112235.129737-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Dec 2021 11:22:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2287

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 documentation/ref-manual/features.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index ded653221..57fe0cc3c 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -219,6 +219,10 @@ Here are the image features available for all images:
 -  *empty-root-password:* Sets the root password to an empty string,
    which allows logins with a blank password.
 
+-  *overlayfs-etc:* Configures the ``/etc`` directory to be in ``overlayfs``.
+   This allows to store device specific information elsewhere, especially
+   if root filesystem is configured to be read-only.
+
 -  *package-management:* Installs package management tools and preserves
    the package manager database.
 
-- 
2.28.0


