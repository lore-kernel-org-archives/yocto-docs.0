Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0BDC02190
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 14:18:56 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.13465.1738160335133868162
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Jan 2025 06:18:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BeO4OhyT;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3863c36a731so5709525f8f.1
        for <docs@lists.yoctoproject.org>; Wed, 29 Jan 2025 06:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738160333; x=1738765133; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jx/GeuQk057YRjYlY3c7TtuV1aLYTuE7Hq0oDb3CxEI=;
        b=BeO4OhyTDzQRcC7ZawAZL66Vyj6i42LoAy9+3w8tCcrBsC3eSozr5gV32YC7siVnIe
         oqz5Wgb7s2pIMHoqWwDFkMI/2kXZz+C9xOWzdDUIq9442EZuxBmG8af4jwBGNwmpc5pq
         9AIdORdKIaRXJwSKm8Qp7jHEFsqxlldE+BrbGYBmirNflRGBUecshsV5mfzf24m91i3Z
         ukMCOMjye19L9g45nnHFXtE2Ex3OOT+TYKfqGV/Ttm7esoDKby6QCaaG/4l7CYYPZXZt
         CPTIROjyFTP5fWED7Gu0WMLN115TDPJ3ZS0ftxFWrmQFpDqsazItMQFxfNN+dKYj8bkz
         1wRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738160333; x=1738765133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jx/GeuQk057YRjYlY3c7TtuV1aLYTuE7Hq0oDb3CxEI=;
        b=MZATqRppjloui4iVI9EeGbGypx6rBx6aPLoAOCPPkfMJp9MaaAX1IcwXylFMNDfa9a
         x/U+oiXxOlCJxViBiahhi334YTEsMPIsVYBpotIcoE8Waysk4Y9daoNbkWfAeW+VrzZe
         GiqWhtm/TnvyufYrqnsGq1ctyTggPAYXz2X4Vd36k/jVvZUydeghiwjeB6IiCAG5eR3b
         2Xsn68METhCs5eQo4+zuj9Fjiu7NqHbXURsqcLqdD+zJeGu9Ffq5/wBxCvZrXj7fuykv
         u+83kwZB/0gjuCUL1/Kr0coDOwBpCKS5QVNr+5++zSExPMDdYpPP9Gn2ejvwmNgOHOhB
         Qfvg==
X-Gm-Message-State: AOJu0YxE35yrdwBUknuF+mu9LkMV8+kFu80ph/sdOz9YU0QCSbzEdn89
	cOjllHjGaTYvrk2pmTY6nf87O/0An2ynEye3gG4xLAMdlVWuZUMdnCtoJQ==
X-Gm-Gg: ASbGnctfJg0VG6Lps3s2lCvkgZB1Jh7GYk79y+d5/ViujDwLW5yT+AeXnte+SXpTTMU
	CRtGghBGRy5AsEfbqbI76Ce3P/sqf2HdVj06HgB7qAXt79apE8EVZjBw1S44H7ff3yKHdRmUpc1
	ETZlOMn8+OtE7jNGeyD4NQiLUBcPxkLos7KofWRJiQ3pjbXup5hpcPLP3eaU2EA/leAAleHHtHx
	RjyXnihSyXqZkdvuIV7JcbzLpxZHs4uVDzt/BJ/GzbhX/C8qZXhS94qcIjk95FMe5BvwUFZN5Hn
	I9CpAI0l5XrQytFzKonVP9rDG+8cMI0IUyPUyFfiH0Obsw==
X-Google-Smtp-Source: AGHT+IF8UnL5jmIV/T8JeTCeOrYRotJLpLlBhlbUGKtPYj/25kUjXqdJnWfk9qTV91lf2NIW5dzVZA==
X-Received: by 2002:a05:6000:1ac9:b0:38b:d8e0:a862 with SMTP id ffacd0b85a97d-38c52096d91mr2536998f8f.43.1738160333124;
        Wed, 29 Jan 2025 06:18:53 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188976sm16967662f8f.47.2025.01.29.06.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 06:18:52 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 2/2] release-notes-5.2: add information about rpm and sequoia
Date: Wed, 29 Jan 2025 15:18:49 +0100
Message-ID: <20250129141849.838672-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129141849.838672-1-zboszor@gmail.com>
References: <20250129141849.838672-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 29 Jan 2025 14:18:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6211

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 documentation/migration-guides/release-notes-5.2.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index 06dce8d17..b0e538700 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -226,6 +226,9 @@ New Features / Enhancements in |yocto-ver|
    -  ``package_rpm``: restrict RPM packaging to 4 threads to improve
       the compression speed.
 
+   -  ``sign_rpm``: ``rpm`` needs the ``sequoia`` :term:`PACKAGECONFIG`
+      config set to be able to generate signed packages.
+
 -  LLVM related changes:
 
 -  SPDX-related changes:
@@ -300,6 +303,7 @@ New Features / Enhancements in |yocto-ver|
       -  ``gdk-pixbuf``: ``gif``, ``others``
       -  ``libpam``: ``selinux``
       -  ``libsecret``: ``pam``
+      -  ``rpm``: ``sequoia``
 
 -  Miscellaneous changes:
 
-- 
2.48.1


