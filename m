Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD859C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 07:54:39 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.8879.1717660473904801587
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Jun 2024 00:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mOeMDNAR;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: alexandre.truong@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-421572bb0f0so8238845e9.0
        for <docs@lists.yoctoproject.org>; Thu, 06 Jun 2024 00:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1717660472; x=1718265272; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SZn4AOj3xaiDh6QRUkQFwusF4qqDOc7L921AVp1XH+4=;
        b=mOeMDNARBhiS83yPlwGwT2xUUsufCMc00v8E7U9kiYb3qHnJUyTP9PgGzb8Ak4edGA
         llcFxrQb0zVimxtJeP8GNilLj6m38/4UrwpQlK03/9J533Ap7dgW9Nw2D6CKHY6iQj2E
         JaR7zYMO7IWh51r1b0KUTtq+0KSwxX62WiHF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717660472; x=1718265272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZn4AOj3xaiDh6QRUkQFwusF4qqDOc7L921AVp1XH+4=;
        b=FtE27X0d1q2/Oo+nAmKeG8IddstkUyNhqoOx53fFswvO492Zpab5Nsj2FEdqQ/I8Lx
         BattoUSQyIOTxWtPe9m9OHIl++cKdZrA1gO0gf4+M84NsN6QM8e5wqVNSa/xruej8Z79
         kdoZYbilYiY6ydPU1LxuTneEp3PZ/IB+DouBtlJIniPBoNb5slKtaBg4vOvwH/OVCIPl
         9kM/N8wmuF/dLCIhADYcbrkouJ5512Xc5C2l5JuYnwjcRbIK3NJLXSzSg6lNY9N0QhyB
         rChMNQxgU8Q+y7o+sYKdfIYW+qTqXhdVCW2j+jWZiqVFyy1P86QhLbQDltQnoWshVCsZ
         RQLg==
X-Gm-Message-State: AOJu0Yx9P+6s4esAKZJ5QCcqUY4j8gPPCKC8SK5i9aCSANw9tElNa7JG
	ANTqdk22SzU1B0p8sc8A71VRR34nfA0mZZuAz0BPO5+0XJ3uJA9sFGVbeexNPwbgjkM468LQQke
	m
X-Google-Smtp-Source: AGHT+IGAXI8BOadbtw58Rp5Fy0XbTyN4h2T6XWisde0cdnXce6qocDWplN+uK9jiv2lnibA0couFug==
X-Received: by 2002:a05:600c:4f49:b0:421:1f68:f80c with SMTP id 5b1f17b1804b1-42156340bc3mr38436185e9.25.1717660472253;
        Thu, 06 Jun 2024 00:54:32 -0700 (PDT)
Received: from P-ASN-MOON.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c1aa1desm12372125e9.11.2024.06.06.00.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 00:54:31 -0700 (PDT)
From: Alexandre Truong <alexandre.truong@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Alexandre Truong <alexandre.truong@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2] recipe style guide: add recommendation for patches without signature
Date: Thu,  6 Jun 2024 09:54:15 +0200
Message-Id: <20240606075415.6666-1-alexandre.truong@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Jun 2024 07:54:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5273

From discussion [0], the presence of git version signature at the end of
patches has been questionned. To avoid a bit more noise, the setting git
format.signature is added to the documentation and its use is
recommended.

[0]: https://lists.openembedded.org/g/openembedded-core/topic/106323318#msg199967

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../contributor-guide/recipe-style-guide.rst         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 08d8fb425..142c02db1 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -409,3 +409,15 @@ This should be the header of patch that fixes :cve:`2015-8370` in GRUB2::
    Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/grub.git/commit/?id=451d80e52d851432e109771bb8febafca7a5f1f2]
    CVE: CVE-2015-8370
    Signed-off-by: Joe Developer <joe.developer@example.com>
+
+Patch format
+============
+
+By default, patches created with ``git format-patch`` have a `Git` version signature at the end.
+To avoid having a `Git` signature at the end of generated or updated patches,
+you can use `Git` configuration settings::
+
+   git config --global format.signature ""
+
+.. note::
+   Patches generated or updated by ``devtool`` are created with no signature.

