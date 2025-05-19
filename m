Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DE2C2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 12:28:44 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.49870.1747657717094584858
 for <docs@lists.yoctoproject.org>;
 Mon, 19 May 2025 05:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QAicT/ZT;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-551ed0038a0so1766523e87.2
        for <docs@lists.yoctoproject.org>; Mon, 19 May 2025 05:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747657715; x=1748262515; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oTh643VVgpnmG4fAosPIT4w/XB3pFaPcXAnCtdujSSs=;
        b=QAicT/ZToWH0QsFJt/VN8WQpeq6uxRI2UMCU+OqClFjjppvIi7/VpRm4DPcjBf1c/c
         k0U/6SLaAxxecQTFky6PdjtgFCCenvR8EVUFjSf/hVfdR0A6p3wgo5mIzCqvRvlGrdoT
         a61P1hD7AWrvFJliDDNsD0rYlZZz4snhMzIUy9fMFRKRzkua48XYb2Ygf/Pl+OBzrewx
         vCFk/z3O2XUzEQvQJczNOpdeIoQJzBMF94gOynSQLjL72bhMqyh1F4XRxV15Gao9gDia
         zDVz64f1ZWmEw595B+zgbfuKv01RgIqswNox/ivfKEvRbbsTHo6hWOBy/7nkWFd7rTdZ
         R2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747657715; x=1748262515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTh643VVgpnmG4fAosPIT4w/XB3pFaPcXAnCtdujSSs=;
        b=pjRUgobjqcWodntTAy8kW9EFNt06fN/Z4r0qNgml9hxsOIYkqTBVX/exCAs4+G5ZjD
         pvgCi8C3SdnuuE8gKX6sbNut95V45k9BJa/FdFp5BAOVNyQlv7AOdO0B2gXcEZ8xOqhQ
         WGf+NHyPoATbmWkH3uv93idwtoOmki9rcl2wX1DfJjvXcwlaTB7otAZLGj5cDFSyy8e9
         XqP8IAOk/KX6qVlP6jSEbiQEAUMZhX1QXiMNA3Ho45120v5FC7myo0/H8f2iRsmp/YT/
         AMiZ9qLwk9FjxSiQ/qjb7q8JB6azyjtC3yJyDP/r8sO2tj0EbdF0mPhjdyEMjecOOAn4
         XXYQ==
X-Gm-Message-State: AOJu0YxiVSWfxINRfXdDC2LjU+rLdEsS4Y/259VsnPDpJW7t4ViA9U+H
	88khnsW0nrpVFYT4GVev0PbTscrOk5J1lSExTLWkGZA1Tc0SVtHbsbjiKq+jIxvV
X-Gm-Gg: ASbGncuBwOmcNBffBrMl1LFzWefE87JbuUzscT4iTaqU+Z9VUumNZf6l1NKZyZptw63
	6qYSZHc8nIcEfBkULMMeuAk/8PAeLx7ngxkBIWPrKTFCEHjMmvkkZMXsYz6OxJ8HU4FJmt5o9L6
	IlbPKG1nIWhg5m8STScY4+dUd31Ggy8kvA8c/70YzI9N3MlrsXJgSxGImHrieqrvCFQ1Re+zYYV
	H2PmnNebc5WRVoYlJUJ3BRQzDXzXy3M0BK2uWmq7LQTtwihfedav0yQ7ELKd0/+8X+eEJUztMU9
	LA9RggG5VyMySKNb1iWzeQiuTTc3+anNxc4uKJjTa5VhfS/rMmLG+j3zj4Stnh3T6KRx
X-Google-Smtp-Source: AGHT+IFre+qLXvAXAFgElDacyXBec16JweY2dR2ZfXzxO50iQ6UpccT4y6jynN9fuFZKLqEfDPcuxA==
X-Received: by 2002:a05:6512:650e:b0:549:57ae:ab38 with SMTP id 2adb3069b0e04-550e7246386mr3466579e87.45.1747657714461;
        Mon, 19 May 2025 05:28:34 -0700 (PDT)
Received: from localhost.localdomain ([176.33.69.152])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702cff9sm1873275e87.180.2025.05.19.05.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 05:28:33 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [PATCH v3] ref-manual/variables.rst: document INHIBIT_AUTOTOOLS_DEPS
Date: Mon, 19 May 2025 15:28:25 +0300
Message-ID: <20250519122825.63816-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 19 May 2025 12:28:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6841

Fix [YOCTO #15756]

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 documentation/ref-manual/variables.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 643a3e7ae..bdf17166f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4487,6 +4487,21 @@ system and gives an overview of their function and contents.
 
          INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool create-spdx"
 
+   :term:`INHIBIT_AUTOTOOLS_DEPS`
+      Prevents the :ref:`ref-classes-autotools` class from automatically adding its default build-time dependencies.
+
+      When a recipe inherits the :ref:`ref-classes-autotools` class, several native cross tools such as
+      ``autoconf-native``, ``automake-native``, ``libtool-native``, ``libtool-cross``
+      are added to :term:`DEPENDS` to support the ``autotools`` build process.
+
+      To prevent the build system from adding these dependencies automatically, set the
+      :term:`INHIBIT_AUTOTOOLS_DEPS` variable as follows::
+
+         INHIBIT_AUTOTOOLS_DEPS = "1"
+
+      By default, the value of :term:`INHIBIT_AUTOTOOLS_DEPS` is empty.
+      Setting it to "0" does not disable inhibition. Only the empty string will disable inhibition.
+
    :term:`INHIBIT_DEFAULT_DEPS`
       Prevents the default dependencies, namely the C compiler and standard
       C library (libc), from being added to :term:`DEPENDS`.
-- 
2.43.0


