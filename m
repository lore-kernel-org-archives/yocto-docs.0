Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0945D167EC
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:33:46 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6817.1767951221826058782
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 01:33:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0cjKzo5e;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fbc305552so2747466f8f.0
        for <docs@lists.yoctoproject.org>; Fri, 09 Jan 2026 01:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767951220; x=1768556020; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bc+9RpQyvN2tyeK8DoDL94RwT8LpkWjCnilBIw7Q9Ho=;
        b=0cjKzo5evGpGZfXunGjPVuwixIHexO6+/SWMvCD/UpS4X0cUpuapbLg41uS+ctEWrl
         Voq2jXo8bXg6i0nblvINv29jatd6011G+vv2ks5kcKIMErU2J6Dl+V+lWf+0LKB/SQ5a
         RIefQjytpdrxawNordEIppAL97pE4Khymc5fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767951220; x=1768556020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bc+9RpQyvN2tyeK8DoDL94RwT8LpkWjCnilBIw7Q9Ho=;
        b=jaT9ZT9zajzhC0HHvgWMu5AHZi0gJZP02tagamr+b6nsb+fxbUC0x6iw+23zvducUz
         DNZQwms6CGlSSvpd+wQnxoytFvV96YEVy4TInKjOxnwbu1uCdMEzCakeSfKVUeTc55hm
         Y9phtZQfFjHD+kZsM2ipbMmcT++3JpeYTGiL2Kg0qHHS1iVrbrkTUlXBebN9P2QvfC7Q
         QrBfAWb7ngEmJUGzipmfvOyQiTuFOYU6+Dwe+gLXfw/CeS9YpdOWei7akrzLEHsRn0Fb
         9ixcyk7KVyQ+8r3IHGjMzteuLw0wAENp+G23k1EkHVtB277MpQdZRY9IXmN5Nl4ChN6p
         TnyA==
X-Gm-Message-State: AOJu0Yy3xWHNwTnoz6/WeFIgcidUNAll1uonteD63kTwe+5QXYclJO+P
	5JMSf4x1BAB9PhV98G0dJJCTW/pguJnHGUAWmGw1ys231jLfR4odKGZ8zru96Uauug0sK0kKrRO
	/cVAKQ/I=
X-Gm-Gg: AY/fxX4SdVK5N2e3auyHPPAm6gVnFLE3K+jbo9YPKvTOwasbSzhsK8tbjtR7iEeFBpL
	nOe2eFkjT6K5z8kKMGdJJCgU2Ymt7bNOuAG+Na03wJ/ocrRSZiSzEr+1yYoLvghQRAy/H095Nhz
	EDKkGzQRHecBXJ+Z4QOHDR4rk3/4UjoKmPtfibxECF5dM+ul3xeQlWUBQ8z8vghW/2SbkeoHsXB
	wMQoqonJtvN9Q2VegZ/KiJ4Ho9knOKcmFyUAYvKqoV2J5jYYdkQD974kkVohGtPS4Ah7Gb9Ue5L
	ZiRrwY6ehz3FG3PVXOe7vbQkHOP6DPx/sxsZmFOyOwUh2bgMHbl8n/kxpYaLjbghHOiGQ9wQQEZ
	AxlOXrjgUERl2vEF/tPT7kbZpqZzBOTHo0wAFIbv6hdhAygF+gmQegZ0e9nUDGOmKfXuKBQ7ljN
	RThFjoVInBwQmEdxnJtBT8EOrkEnau2MmSv4cRDjJGwpM7Jt99tt5gD7U+SoPRyqlxh84gSgEzl
	WYATnZwUOWSU2yu0WRhaO8KHERfxcL3aZLE2MRMl3Pf6PXJEkknnv69HlY2GruUV63+ym4TBSPj
	BwXy251Y1TTlbw==
X-Google-Smtp-Source: AGHT+IEeuI9280ovOPJUoY8Fj15PHO4mqOiotoQ3qbcpPEes4PdzmaQ8UA5YazfSJ26Pyo/7D3hwPQ==
X-Received: by 2002:a05:6000:1a88:b0:432:5bac:391c with SMTP id ffacd0b85a97d-432c379b81dmr12443340f8f.52.1767951220209;
        Fri, 09 Jan 2026 01:33:40 -0800 (PST)
Received: from FRSMI24-BLUE.example.com (2a01cb000301bd00fac876ea81338aac.ipv6.abo.wanadoo.fr. [2a01:cb00:301:bd00:fac8:76ea:8133:8aac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee24esm21452920f8f.33.2026.01.09.01.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:33:40 -0800 (PST)
From: pierre-loup.gosse@smile.fr
To: docs@lists.yoctoproject.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 2/2] migration-guides/release-notes-6.0.rst: add U-Boot initial env binary
Date: Fri,  9 Jan 2026 10:33:05 +0100
Message-Id: <20260109093305.1137281-2-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109093305.1137281-1-pierre-loup.gosse@smile.fr>
References: <20260109093305.1137281-1-pierre-loup.gosse@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Jan 2026 09:33:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8441

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

Added by commit cf11b14a4cfc ("u-boot: make initial environment binary
image") in OE-Core.

Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
Cc: Antonin Godard <antonin.godard@bootlin.com>
---
No changes in v2
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


