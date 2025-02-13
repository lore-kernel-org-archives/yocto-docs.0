Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99133C021A4
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 22:04:34 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.6365.1739484267547103187
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 14:04:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LsLnT8Yc;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-439585a067eso14517885e9.3
        for <docs@lists.yoctoproject.org>; Thu, 13 Feb 2025 14:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739484266; x=1740089066; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yavD2BcmgOO7XUHSY7fsZzq0vzDpDqtoOxnWNRfJkRU=;
        b=LsLnT8YcbxovttmV0RWcxH6UojQJHS1+Vu5RcfP7l/elmUKSxYGzw00ZkBqlsDLKPE
         Dt3Eh+ITaXG+PH3hYhm3vt/XCnr5N/DeV0/rRpmqIU4HIYoNCCF9mGD3xNNiJr5nK3nw
         gwnP1ex7LYUfZMAmEJtZDYBzCiJFSIyZnUH0xA+dYa3IrpYCzU2Tcs/YzkuX7juSOfjy
         pt0ldziNSWeeV8oonWPApTTPY7tPEKtYv7jS8FqrclcqPfU113q34QgZOcvXtWQxXvbw
         T23Cqbw9/MSne4kqpUdLruCtOWxQbWRDF20y7UoVx/M4VtY/12N1MN/p8crPYNoMonGS
         D3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739484266; x=1740089066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yavD2BcmgOO7XUHSY7fsZzq0vzDpDqtoOxnWNRfJkRU=;
        b=CEG5LjwSBEEiK7PEiJjy3xWtgtTXh+qbeXoJd2L1pXew6DqoTNPJnRymlRzTw+4Q1N
         lDsri0pyk25SqZLFvpALfIPrXw1Bo5XmiRZKBP4L7Bhzvq49Q8qlHvlItrLfGRKLrodO
         +GYZECy0Y/cB8UrbGfiaCuLYkht8uGq2lJKClF8dgjNww2rCuY8SgHQ3vNUKaVeU0smE
         iu+M9fydAYeEtF3yulV2GDUfJwcvLcZLhHaBxCPbH3j5T5dwgTNCfgV6/qXXxX5nlsx8
         xqg4Y8zwsReoitDwQIVnXYyeodZraDWIGM5dDw42XStVihRPRmW4LnZ/W1d5jijA97qG
         o1zQ==
X-Gm-Message-State: AOJu0Yx2TDSeuY7G1BMtj5V+oNzRccvm0nJxNzvcnE0iJIc7qd1m93rc
	zEGJhynl3nQSl2UzidYVFdYbG5AzKvIwj1GETBgK6hhzIIQeXMJS39wcxg==
X-Gm-Gg: ASbGncujCWZgBpCelwpyKwWpD15iZc9Zn7+Y4h1aaxVRYdE6AEaamNSUJnFOzy76F6U
	6tvWIEU0dSFdzhDRXHJhyUKq/c4xjkvamgfmHr4n8bxdfxtZyXF7zXLZ7PQBmEHPKLH49o028Gn
	qWirtxbJOFcb8UWM0LD4dYUQMu1lThJt/186zTrme9o81HhCpbPxK7IITQ9DS/UEfo5qdtjuDjD
	B6WDBW3yulYl+hSPFPASAduXgNwkRgqs/VtqLTHPkJf09YV8ZmW9QC9ZZIgWQaJOVvQjFaXIzNU
	+/26h8UZVlfGhkxDZHeNnLPiJxk87ySBYQf7Fg==
X-Google-Smtp-Source: AGHT+IHtDcGNr3CeOarymPm77ZMfgFeoantYMLe72dU/Fr6CCcySsS0Jd+l/0GVNaNv7U5A2C3Takg==
X-Received: by 2002:a05:6000:1847:b0:38d:d906:dbb0 with SMTP id ffacd0b85a97d-38dea252e94mr9487020f8f.7.1739484265662;
        Thu, 13 Feb 2025 14:04:25 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5ee2sm2874191f8f.80.2025.02.13.14.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 14:04:24 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/2] migration-guides: cover FIT_UBOOT_ENV
Date: Thu, 13 Feb 2025 23:04:05 +0100
Message-ID: <20250213220405.3920122-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250213220405.3920122-1-adrian.freihofer@siemens.com>
References: <20250213220405.3920122-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Feb 2025 22:04:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6365

Add a hint for users using the UBOOT_ENV variable and the
kernel-fitimage.bbclass.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/migration-guides/migration-5.2.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index de2ea773e55..e945e17a9df 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -182,3 +182,7 @@ Miscellaneous changes
 
 -  :term:`ZSTD_COMPRESSION_LEVEL` is now a plain integer number instead of a dash-prefixed
    command-line option (e.g. it should be set to ``3`` rather than ``-3``).
+
+-  :term:`UBOOT_ENV` is no longer handled by the ``kernel-fitimage.bbclass``.
+   There is a new variable :term:`FIT_UBOOT_ENV` which is supposed to be used
+   for adding a U-Boot script to a ``fitImage``.
-- 
2.47.1


