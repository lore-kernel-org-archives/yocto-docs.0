Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D11CEACEA
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 17:23:01 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.87568.1727803372804395340
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 10:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SHLsMocD;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42e5e1e6d37so52902795e9.3
        for <docs@lists.yoctoproject.org>; Tue, 01 Oct 2024 10:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727803371; x=1728408171; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjwdVabV9dtO3JjeFAI4f2l7Uu9g0NFKDxf/EFtJbhY=;
        b=SHLsMocDDGCacSZopySMfxvsZgI2TBx8+wJ91MdAQ3r+NHxCX9rKy/N2mYW3DwhBPB
         xUFHMPr93ZF365ug+1uynt+zTTlORyQs9BWdbxDZPWMjZ9Zt6b0hK/wk/X55NDakBGFq
         Edqy7HzC931c1foe8CLhPMfjyk6b6aKtsjLWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727803371; x=1728408171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjwdVabV9dtO3JjeFAI4f2l7Uu9g0NFKDxf/EFtJbhY=;
        b=jCyNi/fPe7XGpXqeHtp34VaspX4tWKd1tfMnsoxn8x7IWWSThO8S9dLMBtEhgfX4Ei
         UwriG8FV/PTZ6OxQp9TOCLlIQGqkurwkyGTLrhoa56iY0ZwzMpawlrRfw4ZQjHUIJ7mL
         mYkHv1FQwv8mIIz8IoebCluBikbLBt6GayktduA1bZMKppXGB21Mm8oMGm/OC7M4L8Sj
         xxMkkh4EYb8ULiqw/nFQrR9gIG9qvOalj5w8T/I3hjYZxyXBabt+GI7WXyVNu0i5d75f
         ISlXHiygUjZgmeI7OE9xJ5xL1xWJhIgOPsTqNTFvhICTPPXCC1Zn00DCDt/msr9XJLhg
         VexQ==
X-Gm-Message-State: AOJu0YxwuN09QHH2o1PImoZtsGtA8LD7k6WEOABI/sJqia1Pqtv2w4CQ
	oViJ7wefODGmR69TSstCAbvcANCgvNloC2gaj4gW8ZtR3Lcjn20oRzcbRxwJByTEFthxgJ+HcNA
	D
X-Google-Smtp-Source: AGHT+IE+P2BrOFcolLSh1MdJouaAgqquHuLEIGDB/hM2GjaW5BsweaYwvho4tgqMlnt9U1EcKNHOfQ==
X-Received: by 2002:a05:600c:1d25:b0:42b:8a35:1acf with SMTP id 5b1f17b1804b1-42f778f2bb8mr1980275e9.25.1727803370910;
        Tue, 01 Oct 2024 10:22:50 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a36292sm185589715e9.32.2024.10.01.10.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 10:22:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v3 3/4] release-notes-5.1: document fixed _test_devtool_add_git_url test
Date: Tue,  1 Oct 2024 19:22:37 +0200
Message-Id: <20241001172238.2872529-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241001172238.2872529-1-yoann.congal@smile.fr>
References: <20241001172238.2872529-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Oct 2024 17:23:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5392

From: Yoann Congal <yoann.congal@smile.fr>

This covers Poky's commits:
3c05286fa10 (oeqa/selftest/devtool: fix _test_devtool_add_git_url, 2024-04-26)
268dfbd9491 (Revert "oeqa/selftest/devtool: fix test_devtool_add_git_style2", 2024-04-26)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
---
v1->v2: Added RST markup
v2->v3:
* Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/release-notes-5.1.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index 3d5a885d3..75e57ea1f 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -36,6 +36,8 @@ New Features / Enhancements in 5.1
 
 -  devtool improvements:
 
+   - Fix ``_test_devtool_add_git_url`` test
+
 -  recipetool improvements:
 
 -  Packaging changes:

