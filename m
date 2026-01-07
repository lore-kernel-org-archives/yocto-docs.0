Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3145D0D145
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 17:02:27 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11028.1767805343963498526
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 09:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AMf/oekL;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fbc544b09so1615488f8f.1
        for <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 09:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767805342; x=1768410142; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sflFbFkvdSDqkuIdRR0aSy6K8tp6/xe0PV+1Of15bjs=;
        b=AMf/oekL/be/C0wQNWGMDlJIrkXXpWeKuVfJcDz/ZXEcuCLU5BgPHUWkVVg9+Odcdj
         oIF7QNe3j/cvd726kMrKvXhbt/gU8WpXUizdtJ/phVcXpMTHqrW6s9Lp8EeMB8eiplZ1
         a4I3OzgsAW0Kg7EgWR67JIhx6ARNfxwTGqhZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767805342; x=1768410142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sflFbFkvdSDqkuIdRR0aSy6K8tp6/xe0PV+1Of15bjs=;
        b=r8C+DggFrsvXT742fdWhp8xFyVu5e+POXcAwLCgk76aSRHBwkLMMn6vV71hJejguEp
         fcjnYmK1wYE4Rlvdk7nFHm2g3FtJ9kqdIl4PyhTvdP4ZeLm1CaXgKw52rzBkT0Q7/4zy
         QqPHFwN1gxyd/4pNYsiHi9AVg4iGaVqwKfJE1PgMVd8Nu6rug/CHOhnT1xjxVTnY3v0g
         lBZRuustdoGinSqASpKCCmUdpOdnzhdZiI6YgDdN5jiQlV03Cbeqi2HV82KM+mUKqHZ0
         m2BsyXZZSfXuHNq2WJj+Tyt0GuvDIomLg/DQTWSdfrecqud2nYKpFUzI5eYKHmihl2Qz
         BKJw==
X-Gm-Message-State: AOJu0YwBBcOsWVDoUf+2uOcgHvacfSo63pfoVKQBy6JxLn0Crd9izSxx
	JMfxqJYx2tY62rj/MM3tYJte3u2U474v9rWg6Q5KITItrSWDSdnAKnPYDVF5kcnjsma948VJQwX
	qD1kpVZE=
X-Gm-Gg: AY/fxX4dV0Mb0047H5sB6R/bEUV285a1qJ+CU/zpVR5riWUfYtYKSqf4+HJzJ6baYo5
	udz+kWjNAmcyUqw5UwfskQmpDxAUToHMm0QYURqqIWrrp8v6Y8NoWxP/ny2M9ZJRI4ZRHSeTkrG
	DdjIj+zxfRgtK5+WEBYyKyyoLupjxk2vQ6t5zgrzP3I6cHkbmbCof3teuO22yzJyUHTf+8LTDOR
	JmNHpt68yZPIfrIe6i4fRvyYweDTJ72QkdOS1gmkeVeDN32nEUr+5bmrGGW4Xyso7JtuYCC3rlF
	d3UjeD/1DduxVUHafW6+9q4Xb0OALL7Fj/C2tsKd5/uln3ASodC/0SymDSk9JX5uVkBmowazQnO
	O/ufq0YWx3fQ6GNtDvhDm7wX1g5JLbOdJWNzOzh3iXBUvxy++FsCXKKfbTUykTnCTpKoy2v/fKX
	ZouJDHzykjQVmRyNjR39EdgcvTTEkhm6A6At6sjyAsk2+0qL/DdvFRFG2G033SsuqpPXylNL+SG
	9YNGnss9MwoqjmVNUTV6qz/E3mpoapO0MBUe9L1njfxxIQHGdd+MmJ83PyoaWi5mAR1DqRMYxaA
	PkpAzPRjQ9Np0A==
X-Google-Smtp-Source: AGHT+IGxuGXkmnOiSZp2rj5WABH2ta2xUFchCO4bSdtK9Af/Px2rD7n9bTXpjNvgk+gWJtg4MCNprw==
X-Received: by 2002:a05:600c:4fc3:b0:477:569c:34e9 with SMTP id 5b1f17b1804b1-47d84b3b9e6mr46342125e9.23.1767805342094;
        Wed, 07 Jan 2026 09:02:22 -0800 (PST)
Received: from FRSMI24-BLUE.example.com (2a01cb000301bd00d0605e902e807ddb.ipv6.abo.wanadoo.fr. [2a01:cb00:301:bd00:d060:5e90:2e80:7ddb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f6f0e15sm103054015e9.10.2026.01.07.09.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 09:02:21 -0800 (PST)
From: pierre-loup.gosse@smile.fr
To: docs@lists.yoctoproject.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
Subject: [PATCH 2/2] migration-guides/release-notes-6.0.rst: add U-Boot initial env binary
Date: Wed,  7 Jan 2026 18:01:53 +0100
Message-Id: <20260107170153.760421-2-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107170153.760421-1-pierre-loup.gosse@smile.fr>
References: <20260107170153.760421-1-pierre-loup.gosse@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 17:02:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8414

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

Added by commit cf11b14a4cfc ("u-boot: make initial environment binary
image") in OE-Core.

Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
---
 documentation/migration-guides/release-notes-6.0.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documentation/migration-guides/release-notes-6.0.rst
index cfc51fc3a..13ce28b3b 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -71,6 +71,12 @@ New Features / Enhancements in |yocto-ver|
 
 -  :ref:`ref-classes-sanity` class changes:
 
+-  U-boot related changes:
+
+   -  :ref:`ref-classes-uboot-config`: Add support for generating the U-Boot
+      initial environment in binary format using
+      :term:`UBOOT_INITIAL_ENV_BINARY`.
+
 -  Miscellaneous changes:
 
 Known Issues in |yocto-ver|
-- 
2.34.1


