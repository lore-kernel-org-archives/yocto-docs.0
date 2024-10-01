Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BE1CEACF3
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 17:23:01 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.87569.1727803373226659728
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 10:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NBF0/J24;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cba6cdf32so51347375e9.1
        for <docs@lists.yoctoproject.org>; Tue, 01 Oct 2024 10:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727803371; x=1728408171; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pqu+h9cPbMPFf/JYux8yaCIJ0hBxev02QRZvRfXsTU=;
        b=NBF0/J24+u6CavqYa7506tCbCQeArv2M+glCqDc8CWkCyrxG5WK40Gg/pXXyoFE/i0
         p7545O1x9BUrJxiFiNMoFp0GBSr/KeO48ntbiRWdkb0C/bTycE6k8SLnPwo9J6F7VosZ
         0ywk+ZdVZ+M5HB8OzQcHjoAr0oP+kT+mj1thA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727803371; x=1728408171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pqu+h9cPbMPFf/JYux8yaCIJ0hBxev02QRZvRfXsTU=;
        b=ufOXYOxsIBkzrMJq2a0mAYFOazdDDaLb5mj5CGygveZnE6/H0mh7LlQHHrEClxLykk
         41OA9YuLbCxYQZ3V3TMb0rFgCdZ9ps0ZAAMLcycHK83uYh9zLBV9sT58yWr9XEB79Ffy
         rj/k6I/U3SPLW2OmN6lQyYu/0xT13nlgV71IyyTttQC20/YBmAaLggjJhi7+X7mbiOK9
         musuCnzGCQnTuyhXTeuX/sWgGxbDJCMG+c5Z3PUqPLIGa43ETnVGCDMEPRTGQfwdPJYw
         A6lJbEuirrxTVEWCUDzTEznWmzzE/mhSwuVIF7mtY2HKqM5qP2vdzzHoihzNPYNf45dJ
         dXjQ==
X-Gm-Message-State: AOJu0YySY63KwnVSIiMSopO5hipbYvTxBeqCebx1JL55n0SfrmvRZJI8
	XuRbIvQwGjuwenyEt3DVH0O/JVriHNbkjcXafav9DBSXlOQzZf+UHE7d6OlrRTfExFFCKXN5t09
	K
X-Google-Smtp-Source: AGHT+IFBNtF6TFGEeUT50po9QLXrf1PpEIYXfvQqlHFjVcg0x+rte17teFNC0EzxAAeYwJKUH/qT3w==
X-Received: by 2002:a05:600c:1549:b0:42c:b4f1:f281 with SMTP id 5b1f17b1804b1-42f778ffef3mr1737255e9.34.1727803371423;
        Tue, 01 Oct 2024 10:22:51 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a36292sm185589715e9.32.2024.10.01.10.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 10:22:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v3 4/4] release-notes-5.1: document spirv-tools reproducibility
Date: Tue,  1 Oct 2024 19:22:38 +0200
Message-Id: <20241001172238.2872529-5-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241001172238.2872529-1-yoann.congal@smile.fr>
References: <20241001172238.2872529-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Oct 2024 17:23:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5393

From: Yoann Congal <yoann.congal@smile.fr>

This covers Poky's commits
47ed8ac83a6 (spirv-tools: Fix git-describe related reproducibility, 2024-08-03)
a19bb8c1d51 (spirv-tools: Update merged patch to backport status, 2024-09-05)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
---
v1->v2: Review from Quentin Schulz:
* simpler to avoid confusion.
v2->v3:
* Review from Quentin Schulz:
  * spriv -> spirv typo (-_-')
* Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/release-notes-5.1.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documentation/migration-guides/release-notes-5.1.rst
index 75e57ea1f..074d277da 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -50,6 +50,8 @@ New Features / Enhancements in 5.1
 
 -  Miscellaneous changes:
 
+   -  Fix reproducibility for ``spirv-tools``
+
 Known Issues in 5.1
 ~~~~~~~~~~~~~~~~~~~
 

