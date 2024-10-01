Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E96CEACEE
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 17:23:01 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.87566.1727803372279160871
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 10:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=elPok6+8;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42e7b7bef42so47621965e9.3
        for <docs@lists.yoctoproject.org>; Tue, 01 Oct 2024 10:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727803370; x=1728408170; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnhRn70MulX2kD884iWq9W4BkbIxi6wjAGezMgvgPlI=;
        b=elPok6+8BCWwfn27noJ/GHWMxXVOQAwZnqqX7maPw5pEQ+b8Uo9vFWBY/qPemOwnyz
         /b8ziFC/JRFcf4yRORcRx+uzFfRRTi8vAfr+kO7mNxykgD47pEdKdX9B0nLe/+LO8TpQ
         djWktqDk1f3CWxX8KEdB5LcZ0DOZLQrwLZJQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727803370; x=1728408170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CnhRn70MulX2kD884iWq9W4BkbIxi6wjAGezMgvgPlI=;
        b=Vc1tpT37qZQF1UyECsyr1wxM+pNFszLjLAJ43CWb8wNxLANvRs+ThRD2dlL5KIGIE4
         Gyf7KGISUG0VaFaLLQdUrtg19iH8/zrF15l208Vu2bI4ab+W1PnPtl9yQ8ALN2hznWB8
         PJhpZ9CzGdmoTB3oMCyyZn9ZdJden/jz9RtKTmnA0tlk1PERuM/Ikx6CvhENDKfx4anR
         teDMpCPNBRyEgQOuN3FGcDuNjD0DSLnCt9rpOTzf2jgt/ziBA/fvg1mpI1TvEIwkxrNU
         TF2/GzJeWv/vZslfECYFbjviyA79ax350aphoft56zk7Y+7XSTIVuZWMmWILVbC7lIL9
         6oIA==
X-Gm-Message-State: AOJu0Yyj0jPgGaeulJPcKxmgeDlB95lM7975tScbiLnXMW6fesWHcL1D
	gDgs2cDb/km8/+56P3BwYsiKoprJ82jwNg0QmWDGVvoFQDLDoIhSTWTB/OaadBZeLKNKW+kTDYl
	P
X-Google-Smtp-Source: AGHT+IFlgfDbWkkDNa+/Z779wq9B7Gls8qDwsP/4FSi8g9MDVh8Hs0qOUAzxu+ce08Ng7tK9rzbuDw==
X-Received: by 2002:a05:600c:3b08:b0:42f:310f:de9 with SMTP id 5b1f17b1804b1-42f777c07ebmr2041315e9.15.1727803370282;
        Tue, 01 Oct 2024 10:22:50 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a36292sm185589715e9.32.2024.10.01.10.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 10:22:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v3 2/4] release-notes-5.1: document added python3-libarchive-c ptest
Date: Tue,  1 Oct 2024 19:22:36 +0200
Message-Id: <20241001172238.2872529-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241001172238.2872529-1-yoann.congal@smile.fr>
References: <20241001172238.2872529-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Oct 2024 17:23:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5391

From: Yoann Congal <yoann.congal@smile.fr>

This covers Poky's commit
c01e633ab91 (python3-libarchive-c: add ptest, 2024-08-02)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
---
v2->v3:
* Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
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

