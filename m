Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD1BE77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 20:08:52 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.4072.1736885326256796370
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 12:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZkrLR4hT;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361815b96cso42291285e9.1
        for <docs@lists.yoctoproject.org>; Tue, 14 Jan 2025 12:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736885324; x=1737490124; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKsMMRHtXqXu0xwY+WBi2gY8jaWyVSHqys91kI7v4Qc=;
        b=ZkrLR4hTJuod+i0ASGAiklecel3znYb0rY1wMi+uUw8dNNH4LoyHU6yhWOwF0zIJEz
         TAnrcaY+YPk/OR3BRv8t8enavDygcxdX+MavcxhuUKU4ZVwKs6RyyaEC5DiT+6N5zZFs
         4rEs6QHsH5+TaG3Wg21X6fnrQNiEs74gvD+Ju198VxQ9AhaMpxVNTqMJkxFoITcMK8uH
         Fvsihje8YxNLBoV0egwKMyTgJb02UliATOtu0lH/efVUFwrpUST4JrSW9U8S1ISFgL8I
         B8SchkJk5GxNCQnKth7g43uRJAOkN64hdpUEZC1a+ZXt9h0byesUE1Ua/j7idTEAu0GB
         S1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736885324; x=1737490124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sKsMMRHtXqXu0xwY+WBi2gY8jaWyVSHqys91kI7v4Qc=;
        b=QHYhkLwN5AxIUNCTZ+czGvOzketnXIrnmie5YS47nT16fmeKZ+u3mR+95s4Y2htzGa
         BWr4EhN3zyHPYJ+Uh5vx2/cOrqPjkGfmolxTVdosDuzXAy32ep3ImRfiHSdLK5Icdfft
         1hbIs0tqdwcQ1Fa6VOv3EtY0jmJVaPQnbqmzYkbACaKHjlSai+BM58Fpr+mfm0WS5RRY
         QtB941eATfhaZWq49tB4pj3sb+MFRXu+EFh1XlrWcVgSloKw0vNL/K5P6V7vKukH2iOc
         lsf5xmqiZBbOIGVkdns6lo/2Gz5l9d69h4lcO8fjrDdpVctNzBZF4JqinTuqt+1GL7BS
         YAmw==
X-Gm-Message-State: AOJu0YyAoEX0kZbeeRcH+TPmfOaVqy6IKZ9AeII8UHlWGO8T4b9JFY0Y
	2q81afXFXtdy35Z7PWwg1SvJ3cgs3Lpl51YjM3ngaL8gY573TLUiho2O1w==
X-Gm-Gg: ASbGncsQKChnN7CNqMrTHaW/dWrMwjAoKsp10ozgavC+yjiEQbdoZ3RqM1BoD4ejk7A
	/9OLvwfD8r77IbJvnwudz70/75Q05ZxdDAYUOeeD0HbEY3KhtSdgPHF5eF9Gj52C2zCfi53AwFg
	jtKx9HjBhWOTZ3BBxE+4WhLiUQHBpubRe6z5M0hCiD30ZqKknLOLWp0kbTW2UvO35VELPXqwWm1
	yKc2S45XLt8eb8zft29MPcT5JHwpDLX7AYlpHwOAHTRAo94dcWputGEv866QzGNE0x0y7se0iRV
	EdI=
X-Google-Smtp-Source: AGHT+IF0A6Jby/QQwMx3pTdkN12RSkTIaEqq2HlJxQZWN78ntSSNZY7HNp0bZlf7XnGY0Orvy47i0g==
X-Received: by 2002:a5d:47a2:0:b0:38b:dc3d:e4be with SMTP id ffacd0b85a97d-38bdc3de511mr9256392f8f.51.1736885324168;
        Tue, 14 Jan 2025 12:08:44 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c76esm15463787f8f.47.2025.01.14.12.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:08:43 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 4/4] release-notes-5.2: cover devtool modify --debug-build
Date: Tue, 14 Jan 2025 21:07:14 +0100
Message-ID: <20250114200734.4191354-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114200734.4191354-1-adrian.freihofer@siemens.com>
References: <20250114200734.4191354-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Jan 2025 20:08:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6110

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/migration-guides/release-notes-5.2.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index 0eef448330d..06dce8d17a4 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -243,6 +243,12 @@ New Features / Enhancements in |yocto-ver|
    -  Remove the "S = WORKDIR" workaround as now :term:`S` cannot be equal to
       :term:`WORKDIR`.
 
+   -  The already broken ``--debug-build-config`` option of
+      ``devtool ide-sdk`` has been replaced by a new ``--debug-build`` option
+      of ``devtool modify``. The new ``devtool ide-sdk`` workflow is:
+      ``devtool modify my-recipe --debug-build`` followed by
+      ``devtool ide-sdk my-recipe my-image``.
+
 -  Patchtest-related changes:
 
    -  Refactor pattern definitions in a ``patterns`` module.
-- 
2.47.1


