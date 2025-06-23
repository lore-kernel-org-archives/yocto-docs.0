Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2309C77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 12:43:19 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.18642.1750682590155940389
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 05:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IGAAW5tW;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a575a988f9so1998277f8f.0
        for <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 05:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750682588; x=1751287388; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/KUXBJDBh02sf06zb1i7U+M8WcrLMZtLlYJY1lXfOCU=;
        b=IGAAW5tWPvsLBKQuKPzISEGVQfHrDHtSC5Y639yFt9WT92s25vv6pIgzObZxbJfdh8
         khpQPY5ZKxF4NxO4imPPWvEb6cQuB8/k/a596R/DcqsNpX/ofr+scelsQWQ72Ut7BHce
         xRa8l2qsRs61tmgRUVcmfu0IsE/Paybq0U44ua9Ojgi/M+Yzr5jLaTUXDFCmJhtpQvF8
         ZNPBwpL2ItWYb5n64dK/99oe0wg93SJObKxDPTDMug2n/Hlb5MyK0W1AxposeplXtgi6
         y/HkCwfzuEoxLg/Kc0mjJlviYBFqq6MHKbXVTQ+KkDzC/1zCnIi60sgTiYx9d+sl6t2R
         oLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750682588; x=1751287388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/KUXBJDBh02sf06zb1i7U+M8WcrLMZtLlYJY1lXfOCU=;
        b=P6PLadmR7LoICflK+V/Pkf21R0riS3vtEHbldduUql6o3/3xCxMnsZkSPmBDBsCJCq
         AZa7FkPTmMaiU6HSfYYnK19GlLRwXS+UuBHxXPxj9T2a99oqBucAImJMPbxP8CJ6Inow
         Y9++Sv5MNF8Vd0AK7eV1TPqohgK7p+3grgPSCnE5RmoGq38SBl+LOEetqvB01IPC4f3T
         m4dWEY+IPHTU27VGg1PMuRxL6aGgq4ygVgUZKOsEMRm6Z24qpqGvoojFD/WF5v9PUlSV
         JhkqvqeaDPN+iqzK9XKp5Nmjw6GmkPuL0xaq2R6nroXfYojNFgjaFCNz/MfIXoIXzR9O
         g/cw==
X-Gm-Message-State: AOJu0YwHtJA+3htS4MEONvJchcG6K1hEnxrLhjM2HmwB8Wv368qEvZsK
	C0+KOkC1sHZqKS1M2DtILU0u9zFPx1Tt6qaBlzKEb3w0ED+/sxuvdW2tqiCmmg==
X-Gm-Gg: ASbGnctAid+K4+jTcvALU3HBy6FqdxQVaCaujYTcqZnhbsJtMaWv/tJQAYd4RgJ0S/K
	ErqixpGyEX8w3jL6PDeg7B4m5SJLbKR34Z96Zx4ygaZwuXAFveXpe4FboPVwukrKfnOAn3iNe7y
	6vrswa+/LzpK6X/w5B3YiWT5hbqWc+/B+Xz6ZagJOpH4KXWgQwKQucywgDy5wP4gmQ7X4cBcqZg
	17sXRohaFnCwd0/lLcC/FgHTSTZIgOt7BfOaRkmjZDVx/JGY0yZdUYFy4jIk556wpdaFS/l3vuf
	etgqhbK1WeEINxAFIXQ686fB/kCcLHuZ0i5TFGM0H24DaSrYyMGJ6rxXtcKUJyLEl4GPlSrHmXY
	HHKX5Qu3a8t+21qTDI32w/kQ=
X-Google-Smtp-Source: AGHT+IEDh0Sdl2JTJ815Ez+TF/i5n04S4QCdXxcMOqCL7yOzFwil8UOaNzq4zLfG25GE6U1090lfEA==
X-Received: by 2002:a05:6000:65a:b0:3a6:d579:b78e with SMTP id ffacd0b85a97d-3a6d579b7f8mr8270746f8f.46.1750682588379;
        Mon, 23 Jun 2025 05:43:08 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1190b00sm9157170f8f.87.2025.06.23.05.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 05:43:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/6] migration-guides/migration-5.1.rst: correct S/UNPACKDIR patterns for file-only recipes
Date: Mon, 23 Jun 2025 14:42:57 +0200
Message-Id: <20250623124257.1544615-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623124257.1544615-1-alex.kanavin@gmail.com>
References: <20250623124257.1544615-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 12:43:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7150

From: Alexander Kanavin <alex@linutronix.de>

It is not necessary to set both; just setting S to UNPACKDIR is enough.

This has already been done across oe-core master, and correct advice
should be given for those who need to adjust recipes during migration.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/migration-guides/migration-5.1.rst | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/documentation/migration-guides/migration-5.1.rst b/documentation/migration-guides/migration-5.1.rst
index c9bb38699b4..94b527bdcb3 100644
--- a/documentation/migration-guides/migration-5.1.rst
+++ b/documentation/migration-guides/migration-5.1.rst
@@ -20,8 +20,7 @@ S = ${WORKDIR} no longer supported
 If a recipe has :term:`S` set to be :term:`WORKDIR`, this is no longer
 supported, and an error will be issued. The recipe should be changed to::
 
-    S = "${WORKDIR}/sources"
-    UNPACKDIR = "${S}"
+    S = "${UNPACKDIR}"
 
 Any :term:`WORKDIR` references where files from :term:`SRC_URI` are referenced
 should be changed to :term:`S`. These are commonly in :ref:`ref-tasks-compile`,
@@ -62,8 +61,7 @@ require to add an :term:`S` definition to a recipe that only uses
 ``file://`` :term:`SRC_URI` entries. To be consistent, the following pattern is
 recommended::
 
-    S = "${WORKDIR}/sources"
-    UNPACKDIR = "${S}"
+    S = "${UNPACKDIR}"
 
 Building C files from :term:`UNPACKDIR` without setting :term:`S` to point at
 it does not work as the debug prefix mapping doesn't handle that.
-- 
2.39.5


