Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B001BCF58E5
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 13:20:37 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.16018.1727270432536287580
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Sep 2024 06:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Xct0khZh;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cae4eb026so66302575e9.0
        for <docs@lists.yoctoproject.org>; Wed, 25 Sep 2024 06:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727270431; x=1727875231; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPX/JZO8GBIctpE56BiYJihouBTYqdW4NWl000GzJUE=;
        b=Xct0khZhOTGp9j0Zf3rPnKdMICLaQQ30hFjMudBCmsNV6nBsvikh+Jx9YS5uSobrO4
         LKhxxttya7pyU6TVQ4vquPuAHN893v2yFepJNa0BszmXQ09oDzsdMV5RfMvdTJEJqfDC
         aEZfLeAK8ruoCnZdhlAk1YQfRb738O7Pat6Vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727270431; x=1727875231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPX/JZO8GBIctpE56BiYJihouBTYqdW4NWl000GzJUE=;
        b=NDhhQD+F35xfbM2Fv78hS0voppKrxvXEEWrzSoUaKIL7sugMlg3hn1tpD0XD6lYLcH
         whcitGd9Bzy56V/8d1nEYLJh+SjyUsk4iv72u9JsQk7em9eisvT73LD/1z48kMiUMcaE
         +hyee4odouf0Q/h7TTEiUABKr8RlmR9yM2KZ1FGK6xA6OCSxHJEXTm2pDS4TzpFL+rue
         qAt1BEdohw94Xdxnc3myMzbcKDyeoyZeTeA46/Vk2wIRhBabunVDsQbVQGMtiym01XGf
         QW8Jb17ixhe9BRH287IoE6ZGF5xy0Iou1pUSqRPAqY0toIqjmSLGOssJSwdRsfkMgZWF
         vwyw==
X-Gm-Message-State: AOJu0YxrDN1KLKmlUitr3QcnlFyMXTCjGVkFjsikxk+E74tdXakdeVy9
	QCnYD76zH76LaA3omFsBp5CwBQqpe2wPh+rWuMLDSRFOjA61umsCElysem62Je7PFpa+Yg303jo
	x
X-Google-Smtp-Source: AGHT+IHdm6+nHKrL1KVkZy35pv/ziVHzC3SYsRfa4PcFbu7MH7vDTJOzPYQOlNomzvZLUE1UdvuZHA==
X-Received: by 2002:a05:600c:3844:b0:42c:b1ee:4afb with SMTP id 5b1f17b1804b1-42e96145f51mr18867175e9.26.1727270430727;
        Wed, 25 Sep 2024 06:20:30 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ddad1sm18808675e9.9.2024.09.25.06.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 06:20:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 2/4] release-notes-5.1: document added python3-libarchive-c ptest
Date: Wed, 25 Sep 2024 15:20:15 +0200
Message-Id: <20240925132017.3427438-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240925132017.3427438-1-yoann.congal@smile.fr>
References: <20240925132017.3427438-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Sep 2024 13:20:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5369

From: Yoann Congal <yoann.congal@smile.fr>

This covers Poky's commit
c01e633ab91 (python3-libarchive-c: add ptest, 2024-08-02)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 documentation/migration-guides/release-notes-5.1.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index c2600b07f..3d5a885d3 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -28,6 +28,8 @@ New Features / Enhancements in 5.1
 
    -  oeqa/selftest: Only rewrite envvars paths that absolutely point to builddir
 
+   -  Enable ptests for ``python3-libarchive-c``
+
 -  Utility script changes:
 
 -  BitBake improvements:

