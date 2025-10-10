Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 851A7CCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 14:23:17 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.9923.1760106194380264750
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Oct 2025 07:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SUo225z2;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-637dbabdb32so4075017a12.2
        for <docs@lists.yoctoproject.org>; Fri, 10 Oct 2025 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760106193; x=1760710993; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+QHYV+tKVofYIzNPyqBCpXznNrzzNwBP52ussZA4Tc4=;
        b=SUo225z2muFJ+G4uqZCv5R/kxbF1cNdz3lDz7W7owhkBxTcxCESg/8Ir+2yPoMeir5
         qHPTTGID1305makPmdgEBTwyUCnwWGqAOxDBZ9KWZPlYjuPk5P/cLu/6ujpasLscJd0h
         MYaLXRAF8Mp2nniaHZq6/Wp5sYU1uc9ePOiZnVlA2yOWzcL8rxWo8HyDM30f3M3/FdrZ
         UPreRpSONpHA/UiuNrYClgxR7jSpem7TPrXud9NDm9L3+hKe8O2UAcxgAbvuIYptwkoa
         LbhcTDOgx+ZMUIkYuIVomrS58SxWRIMo2TwApuSuFsnfX3Kx5zsYvmDr2HfabGdrN9Nm
         5Rmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760106193; x=1760710993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+QHYV+tKVofYIzNPyqBCpXznNrzzNwBP52ussZA4Tc4=;
        b=mT0phijGBznoDVL1Bhf9I83jEipZNPOz6Jjgs5EQgCsstE8BsazUwVf1cHWtKSmyM4
         exiqQUfoecyUHTfz+RPWUXjFMksJfmIqdaRx/gQhB+h3DOCW3n64pz3D/rYAYfOf7ilT
         U9mEjM6mqd6OSBZp/CpE7PHYeisRwBHMrB9j1+ilcsP0QVpR1iQnJUWXrWjP1Wiy8eHk
         ELcyKNvakRm8shHhlnw02xAe8yZyIcxMojvC9o1m6H8K/dOxPvPlOd73gh+umhfZJswH
         5Bebxe/xurBNNLGbN5dd9f1/jtIdTYvdLMs4EnEnO4RoBayrzp2YBSJFbv73g/+HUMHU
         kffQ==
X-Gm-Message-State: AOJu0YxEUihDpVJ9XBHL1NvSRkW6gLBfbSGC8+y5GEKNL8Yc5hv8qhUE
	fPj5BgC1uY3QTFgUI9Hg2By6uAb6EU6zNIGZGggBGHPfnQfLvw4wcTsw06zhbjQi
X-Gm-Gg: ASbGncuz9E1J+h49NFcBeEmG4qyQ1xWmC/gfoy5kSVkPnvMQT4j6Y1MCFmmzf9Vvwa/
	mdutHYEa0QT46hcd/aOssy2a6CXKjNDIb/+DXcl/I7QQU7SQaduf9pGlYgPftg45ylMJGzaK4xj
	rNdGkBCbH7yK5bN5x3Oh+X57w+yB6qU8N09qm4cd2BLN4WDADhHS8YYp9keO0ONbTQ9IV22cKwt
	WbuZs6HI+pFOXxo1ZH/KIUZZbKqGByr071LDRxovT23FPpC0tm5E+l2vmwrC6jMR5k5tH+1cxeT
	s9r2BzPbYTmAvar6yDmSBC9i8majvNn9jaDd+SfhyMBgfGhpInoNO1rRzZ3NjcRW8WPYmJIPcBX
	WQqjVoNfHkMJtwBk1n2Qq7lEWt885dRUdaEHbumkhGiYSpG8olA==
X-Google-Smtp-Source: AGHT+IEYt8qFkKPz+3nI3BO157ReaChrriATQhOKWVmgSNtMnbOd/xSZD7UC1odW/hEwOrcKydr0Fg==
X-Received: by 2002:a17:906:eec7:b0:b46:8bad:6960 with SMTP id a640c23a62f3a-b50abfd69e0mr1273965466b.31.1760106192293;
        Fri, 10 Oct 2025 07:23:12 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d65ccfe0sm239608466b.25.2025.10.10.07.23.11
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 07:23:11 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] ref-manual/variables.rst: add note about PSEUDO ignore/include precedence
Date: Fri, 10 Oct 2025 16:23:11 +0200
Message-ID: <20251010142311.3509374-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Oct 2025 14:23:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7682

This commit[1] in pseudo introduced the PSEUDO_INCLUDE_PATHS variable, however
the previous PSEUDO_IGNORE_PATHS variable is still present also. Add a clarifying
note about the order of precedence of the two.

[1]: https://git.yoctoproject.org/pseudo/commit/?id=2c43381180f9cfef4c0a8bb0c1658a86c3fcc876

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 documentation/ref-manual/variables.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1d4ec413ca..d180341079 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7567,7 +7567,9 @@ system and gives an overview of their function and contents.
       by pseudo when monitoring and recording file operations, in order to avoid
       problems with files being written to outside of the pseudo context and
       reduce pseudo's overhead. A path is ignored if it matches any prefix in the list
-      and can include partial directory (or file) names.
+      and can include partial directory (or file) names. In case a path prefix is
+      present in both this, and in :term:`PSEUDO_INCLUDE_PATHS` variable, then
+      the latter takes precedence.
 
    :term:`PSEUDO_INCLUDE_PATHS`
       A comma-separated (without spaces) list of path prefixes that should be included

