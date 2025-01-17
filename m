Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2637C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 16:11:59 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.14533.1737130316782070519
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 08:11:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HIJRA81m;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3862d161947so1281975f8f.3
        for <docs@lists.yoctoproject.org>; Fri, 17 Jan 2025 08:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737130315; x=1737735115; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CBhvHLXPCgiTXnWmoujLfCxFI3UkJSn0TAMMMmwSMRw=;
        b=HIJRA81myEx0pkSc91YyMzMs/zr2ffiul5yBKgFP86FVtZ6STAyMXArqXf2KjCwKrb
         f1oBTKvwjGG9IQIUlo6wxUMTCdZi4X9/DWrvR/bnI5vqXi7WzhDZnNUcSixTNGYwPvwm
         /nWXVNyVNU36r32CalHy9eGrEe8yG1Ywccs/jM5QHaZ/ukkVj0JbPjiQHe9fXezPtk6u
         ZBBt8g8aGrz8RD6z9i9peZh/wOBhAO324wRGS77PdbIaeCCl+NJLHKrc6Hpx85IKwVdM
         vd3Uoc6lbwFBcbVb7K6VEbNTfY2NiTTpvXesWPozjOgNeurt+W46Mt1wxJUhZIO2EBF0
         jZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737130315; x=1737735115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBhvHLXPCgiTXnWmoujLfCxFI3UkJSn0TAMMMmwSMRw=;
        b=J7MtxEbJF3KqwAaWrsfm4rUBBEyO2BHQ/XjWtaTC+NOPJ9CMOpvHOF1PO0S6TKgZOx
         imoPtQWg+4sJyv5+EybqThpiH4M9ZEbUYy6G7xDKTeGdNMmaAdmuojqLRXwNJVm9OlzA
         V1xocv5Dg/WlqToB2iNVbirbWQMYq9s79K9wJZzl+HBqY3Dw7923bkUjxhpU8jw7kyK7
         zK+Ur8Vh4pimV+jRVS/IyZNfT7YYlsTMHy28gKXJi6KkMQ7u2KpT/RarTAQrZnMHRIc5
         CdcYJw4FUM6Omvxzz3frXtaaaKfJrD5T8Ex0KspAPQOt8pGlTTWak9Wbp1BmG27gzqMy
         pf3A==
X-Gm-Message-State: AOJu0YwVhveMdO9FnneUMvk1r9vjyF0HLA86R4HkiLSncNkTvsCf/MJ0
	rv21zZCfEiyc0y6L9r91ECW6T3a46i3Ov6FNruf5UU/yiA2amfcGc6QRQw==
X-Gm-Gg: ASbGncvceCThefnGlIMY6ZsB55v6u5r2MOYW9rez+EjoLG2amyAjQyUYQZgUKvJSkox
	hfUlRbuteJoCchwymsDBs8WQN31fM5gxEA4Pg9AAmr4K9GQxCi62cKdEhny5DsXwEs83Gy6vkVt
	4IcdkL8fiqnHF/mn+LwEjMq35KaGlqLhYdMnbN+JYI+y8ANaJEeC5ddSlz4UNq9q3b0RhamVG9X
	cDMCoKN3l2mezo8cdTDmfMgxDaQier+z43u3vJNmP+8cXd13NF0UiLqJAlA2loQ1FMnRK5Z7G3J
	rus=
X-Google-Smtp-Source: AGHT+IHzWB4d8cU11sJcNAFBewYKvDI5AuQn8azqA9PqHtarCDHj1Km/zIEV31uxBsP4t0pwZxyj0A==
X-Received: by 2002:a05:6000:178e:b0:38a:a043:eacc with SMTP id ffacd0b85a97d-38bf5655a55mr2557885f8f.1.1737130314651;
        Fri, 17 Jan 2025 08:11:54 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499bbasm103242485e9.3.2025.01.17.08.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:11:53 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v5] migration-guides: systemd.bbclass do not add Also services for 5.2
Date: Fri, 17 Jan 2025 17:11:41 +0100
Message-ID: <20250117161141.2194682-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Jan 2025 16:11:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6143

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Covers the changes introduced by commit
https://git.yoctoproject.org/poky/commit/?id=efa5f65c2214239ed7aaf7bd8998683e755c5660

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/migration-5.2.rst        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/documentation/migration-guides/migration-5.2.rst b/documentation/migration-guides/migration-5.2.rst
index cb70e19da0c..e9de6910e12 100644
--- a/documentation/migration-guides/migration-5.2.rst
+++ b/documentation/migration-guides/migration-5.2.rst
@@ -74,6 +74,26 @@ systemd changes
    As a consequence, the ``systemd`` recipe no longer contains the ``usrmerge``
    :term:`PACKAGECONFIG` option as it is now implied by default.
 
+-  ``systemd.bbclass``: If a ``systemd`` service file had referred to other service
+   files by starting them via
+   `Also <https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#Also=>`__,
+   the other service files were automatically added to the :term:`FILES` variable of
+   the same package. Example: 
+
+   a.service contains::
+
+      [Install]
+      Also=b.service
+
+   If ``a.service`` is packaged in package ``A``, ``b.service`` was
+   automatically packaged into package ``A`` as well. This happened even if
+   ``b.service`` was explicitly added to package ``B`` using :term:`FILES` and
+   :term:`SYSTEMD_SERVICE` variables.
+   This prevented such services from being packaged into different packages.
+   Therefore, this automatic behavior has been removed for service files (but
+   not for socket files).
+   Now all service files must be explicitly added to :term:`FILES`.
+
 Recipe changes
 ~~~~~~~~~~~~~~
 
-- 
2.47.1


