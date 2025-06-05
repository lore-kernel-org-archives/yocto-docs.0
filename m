Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7F5C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 14:03:30 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.8594.1749132201403797376
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Jun 2025 07:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jhKeeh6G;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: dixitparmar19@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235f9ea8d08so4228165ad.1
        for <docs@lists.yoctoproject.org>; Thu, 05 Jun 2025 07:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749132201; x=1749737001; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P2I6jVptUU475Hvka7dVodWoUeZXgfhWtjBCa9282qY=;
        b=jhKeeh6GQtKLzaYOu3DkaELR9gr3yny3K4yEkeA5wQXksfKSEk7H6SQv4HFq0BKGdx
         4zxfMOYVeyegR7VyPpQaen6fmkCrvztgj7feXcBhVzIXXfwB90UYqxIF684sWp2U3U+a
         Ibj5luEIZ9q7TX3MOsv7vQ96Y6so2Q9w/ZB1QlWoNsmQ26bQ5od4EiXSUHy9zmIQewcd
         uy6Tbs8jpjGf+kdy9FM+50ap4Y61yWSFqvdFCCdvO9kW6tT+oVDlUeimLeRzY0m7+5b6
         WSn8HGrjCMWiujqnlN7V/MwwJj+lOz7KsIkpBwKSnzvdzVeUc/hvuhFk/E3lU7Tq8zzE
         A7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749132201; x=1749737001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P2I6jVptUU475Hvka7dVodWoUeZXgfhWtjBCa9282qY=;
        b=WR/x42siKxMMURO7EJGGov5n4VGhrWWTnuaLoqwsEe4fgnweFlZuVDHFcPZq9WTcKO
         13Jw90I/yjR4lD9LCIZ7bid7j3CUEzslDZVp/EzHQGChvTelGkLGYR5jPFDiNP/DeLUL
         kzGRwrki5C9Vax3OKFzAPdxUqV3PrOuz1q3SzgonfT7D9V9vH8St2nfJJgArH+/w9vAd
         uStFNyiP3ZL0lzlNJi1KlGaVi4NZlhnTv70IC/kRyKTICfHJ5QHZIAtziJ3Bdtso6Vrf
         cPZWn4axzo4L8kNSuk0H+5hxJ3H098ZnQo0O95wPio5DpEfehqKL6k53oYYppTCkUdw4
         B8tA==
X-Gm-Message-State: AOJu0YyE8JLXQAjjCfP3scn9LJkV8IuaLbYqHt1bg37fPtSmp5vEWEiT
	TpbNqRU9njDn4fv/N5yDT9aB/Hsohc7xiXk+R2sxnxgDmj+TZx6bMN9XPREVDw==
X-Gm-Gg: ASbGncuxY8S0apBBDKgD0ziq+2YMdLttVjwsEwbLynm1op5sizItzjjvFZUQ/QMKpsS
	GDMBw4G4U+uZihesrHvAvnolXJYeQ1YvjM6LgqUInRtxQb4LIjOufwPEaPz9omBTlalAZpMcCGx
	GWjKWQKQuvauPugwmkBa7h//LZwYjX7KVfiQXgp7/FgVnU4PDFKTfNhcEX/ZbK8B0cbChbhngpZ
	tZnn7Nacp3sNyKnr98Q3E/qkf+xGqfNA4Y5XYrE1icFS/QdX0/8mv2um4vSjrD3iSWLnvmUobFE
	7HY9ypkbOXwjmjZmzF8Mc4MIh72t9S/QTUe5Wzsn1D8EFJUAV735hac=
X-Google-Smtp-Source: AGHT+IGr806zbg40tFzxdlFE1XSSN9EHyEFEsa7sUKaVHi5z61oMkPmdba7CTGRbddH6CsF9EjtQdw==
X-Received: by 2002:a17:902:d4d2:b0:223:4d7e:e52c with SMTP id d9443c01a7336-235e111ed15mr105767455ad.5.1749132200586;
        Thu, 05 Jun 2025 07:03:20 -0700 (PDT)
Received: from dixit.. ([2401:4900:1c44:a779:7fef:8c20:c62d:6de3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d14abdsm120185455ad.239.2025.06.05.07.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 07:03:20 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Dixit Parmar <dixitparmar19@gmail.com>
Subject: [PATCH 1/1] ref-manual: document KERNEL_SPLIT_MODULES variable
Date: Thu,  5 Jun 2025 19:33:14 +0530
Message-ID: <20250605140314.369551-1-dixitparmar19@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Jun 2025 14:03:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7006

This variable controls the kernel module spliting.

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 documentation/ref-manual/variables.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 9768d8f5b..2c23b6864 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5359,6 +5359,15 @@ system and gives an overview of their function and contents.
       the :term:`KERNEL_PATH` variable. Both variables are common variables
       used by external Makefiles to point to the kernel source directory.
 
+   :term:`KERNEL_SPLIT_MODULES`
+      Allow opt-out of split kernel modules. For some use cases, a monolithic
+      kernel-modules package containing all modules built from the kernel
+      sources may be preferred. For one, download time is shorter and
+      installation time is faster.
+      Default set to 1, one subpackage per module. Setting it to 0 will
+      generate a monolithic kernel-modules package containing all modules
+      built from the source.
+
    :term:`KERNEL_SRC`
       The location of the kernel sources. This variable is set to the value
       of the :term:`STAGING_KERNEL_DIR` within the :ref:`ref-classes-module`
-- 
2.43.0


