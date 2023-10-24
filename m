Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C10C07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 17:28:02 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.153880.1698168479259503803
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 10:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=R6b3E2NP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c9daca2b85so34294655ad.1
        for <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 10:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698168478; x=1698773278; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N4sKOAEs2ncIinqE42ir11JEmRYcn2mfoFF4snMaows=;
        b=R6b3E2NP+xaGT7nyqz+vNkdxaZeGDzvhE2Hr8VTOVDE1eq7oJicI5Ck+cqyslgwuRg
         SX5EZtoOUDNtziRrv1ex1poXVX8K1C0Lr4LBARhL49DRR+EplWBUKBM/Bw1xmsZTHwFP
         4Zz/JT+zeD5YMwO9rOcjGcM/zIYMa5cMNeLXWurDQhRLc6XsxHYE3d++2PCN6foIPA+I
         fbKxxDW4n/kGLp/ozYNrQNh/I0XjdvFlRR9P1ukUMGIGSd0K1j6tcIf4UQSIruiZyNiY
         CSbGugKIX69sINb8zFUpA0Zl6LQWJL6Hk6/+LTzaYwdMNGeokrZniuFu//X3O5PBZOd0
         ACng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698168478; x=1698773278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4sKOAEs2ncIinqE42ir11JEmRYcn2mfoFF4snMaows=;
        b=dxZpWZNfqTFJnZWrq+FWGLInqDpyZFPENZlc3xe5aqerKJ9169MTO7m6KcCTf36rwq
         gUAaMGKGFBc8tVsrLrrjRgl6MrNyqi9uVYbpO8it7UsgW/+wgUTMKm78eeUTf50amG5D
         V1zHt1WTUmXsoVB13oEHc9LoasDEhY0Kjsp44ayrjh6Aydu44aH3ssp0iug/HSpT+fBc
         s/+cPuC9l5pax4zd5gfivDXentP5wbqxAZyucrogAvSFLLYN49FpMyFXaa/KzHnrupVb
         DWVrJAI/NjwIEJzBIJtxxFUcsLk02HEM3xWVEVXxsDxO9GVbYzlMn3mMp1XnMReYKCOQ
         P+xA==
X-Gm-Message-State: AOJu0YxwlbvdX3ZrecHp9Ehq04hbyrKSKiUsDmuaJbPPWH37HcLOy3Xz
	dmNVbRnUelaY6d3oEL+YnH4GNYiY3cFX20Gm5uY=
X-Google-Smtp-Source: AGHT+IHqsJ4/mkN2m1NZM6OvUqZB9RW8TBF6uarXaY74dZODFNU2ZHMkM8dFPjZXaUgk6QaNs5F48A==
X-Received: by 2002:a17:903:48c:b0:1c9:e77d:62d3 with SMTP id jj12-20020a170903048c00b001c9e77d62d3mr14765466plb.10.1698168478042;
        Tue, 24 Oct 2023 10:27:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b1-20020a170902ed0100b001b392bf9192sm7636431pld.145.2023.10.24.10.27.57
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 10:27:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: update for 3.1.29
Date: Tue, 24 Oct 2023 07:27:49 -1000
Message-Id: <1ec2b22e02315e00520e7c0291e9c4ac1990b21d.1698168357.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698168357.git.steve@sakoman.com>
References: <cover.1698168357.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 17:28:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4492

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/poky.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 0d27d329c..132b772c1 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,13 +1,13 @@
-DISTRO : "3.1.28"
+DISTRO : "3.1.29"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.28"
+YOCTO_DOC_VERSION : "3.1.29"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
-DISTRO_REL_TAG : "yocto-3.1.28"
-DOCCONF_VERSION : "3.1.28"
+DISTRO_REL_TAG : "yocto-3.1.29"
+DOCCONF_VERSION : "3.1.29"
 BITBAKE_SERIES : "1.46"
-POKYVERSION : "23.0.28"
+POKYVERSION : "23.0.29"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.34.1


