Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E75C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 15:27:37 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.8633.1714663648156292098
 for <docs@lists.yoctoproject.org>;
 Thu, 02 May 2024 08:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=VcSheE2d;
 spf=pass (domain: konsulko.com, ip: 209.85.214.172, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1ec41d82b8bso30922375ad.2
        for <docs@lists.yoctoproject.org>; Thu, 02 May 2024 08:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1714663647; x=1715268447; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pz1sIObkRQEcnvMD7b6ar3VXY4OFf8a2q2L1Gr1RiO4=;
        b=VcSheE2dtIcpWHOcP5kxhuYFCvUbO7KtIPG6PZo3xLDYsPDiYcqSdfWmwUk4R7BoX6
         YjCQtvw4eAAAyF8BPHKrrYcQTYW0iuadv/ZWFGcsYrCuO7sGwjTeNOZ1kAdUzY43Ps16
         3d3DVNetmDRaLt17Rd16oksH9SkK5uGI9zsgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714663647; x=1715268447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pz1sIObkRQEcnvMD7b6ar3VXY4OFf8a2q2L1Gr1RiO4=;
        b=tu39g2fPbXfZbBawe7f0TEXvVyPcQ2y1BbaCZ1BrhZEAqD7k/akdhQ6RNUQGNi/uTI
         y8/jggGHj9dz2c2ZBC2VtuTFM4oCnlhh+pFI2lovis6fc+TknrwrSiVh+SLabOZoLbkK
         Ne+GoiGEFfrseJ5WQXtMeU9G+eo8YfIjYpCpWza4kOYpFEpPv/vlR269FrTYcUaalht2
         APlwicO4q/C4DiByjY280LJkAXTp0kK55/DRtDr6zXIaStet58dHuR+UCBjmiNyUKMXX
         mbJFtUoiWxXYCNQ+8k24U8/gR3TyvSiOTujG/k0kaa54HuS3tpph+r49kA4xnC8PhpCe
         9Vww==
X-Gm-Message-State: AOJu0Yymsl4KojGXtQMWQPQByvZNYavCafCqZ5nWv2/tIgTXhby6wHbY
	FEwqZxcyoZi3lcEAkrOWElHa979rardtw91yqTv/8hr2z2j1Mj4Xf7bgwpgoo0SD7QLIVG9QC/s
	C9V4=
X-Google-Smtp-Source: AGHT+IHD4/ZyGYr4f2M5lhrNkfbvKuc+Az/zG+OJf5FR03pGO1TizR6jso7ryMpTBfkwpNORwATRNw==
X-Received: by 2002:a17:902:8c8e:b0:1e3:ca5a:2d9a with SMTP id t14-20020a1709028c8e00b001e3ca5a2d9amr6219951plo.53.1714663647025;
        Thu, 02 May 2024 08:27:27 -0700 (PDT)
Received: from localhost ([2601:1c0:ca00:bd60:bc27:dad5:cc54:4608])
        by smtp.gmail.com with ESMTPSA id m10-20020a170902f20a00b001e5c05b65f4sm1417268plc.169.2024.05.02.08.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 08:27:26 -0700 (PDT)
From: Tim Orling <tim.orling@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] contributor-guide: recommend format.forceInBodyFrom
Date: Thu,  2 May 2024 08:27:02 -0700
Message-ID: <20240502152701.1798568-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 15:27:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5199

We are seeing a lot of patches failing when the From:
line is not contained in the message body. It is probably
better to just recommend to force the in-body From: to be
present globally.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 documentation/contributor-guide/submit-changes.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 47a416b24..c292a143a 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -65,6 +65,11 @@ use to identify your commits::
    git config --global user.name "Ada Lovelace"
    git config --global user.email "ada.lovelace@gmail.com"
 
+To ensure that your patches are formatted properly, it is also
+recommended to set::
+
+   git config --global format.forceInBodyFrom true
+
 Clone the Git repository for the component to modify
 ----------------------------------------------------
 
-- 
2.43.2


