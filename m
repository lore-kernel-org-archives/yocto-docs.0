Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6769C5B543
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 17:46:29 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.1402.1748627186630086865
 for <docs@lists.yoctoproject.org>;
 Fri, 30 May 2025 10:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ejq3G5sc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234d2d914bcso16972545ad.0
        for <docs@lists.yoctoproject.org>; Fri, 30 May 2025 10:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748627186; x=1749231986; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgGYCNySipd4ppI63ftVduUi0ygavT87vCUGC6Bt89o=;
        b=ejq3G5scJY2clarPjsxu4XDX+vwA468z69+DUjxv0m/BZ2yexL71o+rBLHx+pFT7Le
         yTr0cOVRaNHvKSHqfrVmt07f3ZDPYn6sEUgJdJoD+FhEIHsqQ0M+rtkTZsJ0MnggrzQI
         lW1rrZwtQl+aaujzz8G05sCgcyt84PenboK1BqDH0b6ZC2roU1IgO9Auw19MKFTvjfPZ
         KTK9o4Jf+cF1XOoqK3sPoH4DNu571JBVC0knQec8cx2Qzo85FnX39OmeZrxxWhAjYpUW
         TRcmJ9S0KKgS2RMGXWE6EGsIKniiSQadPXET3Tn4s1xqB7cQCyDHwb5ti4kiBWi+XFJg
         smJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627186; x=1749231986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgGYCNySipd4ppI63ftVduUi0ygavT87vCUGC6Bt89o=;
        b=fYRLFuxgytJDszraYCkkdzyPkC835lSlzds25IGtrkEn6shLGDuF982jN9F+WkhrC+
         8UzkR+0Ty072Qyzk6j5f1mQj32myrVsm/zKSxhTG7n6NSuHDtuNHKsHYKWYgX8Skqz5g
         PxHLGxlS/1cf+j8huqM/mm/G/2ToZap66PWUTulWW5DbrKRelWzpx5t2IsTrLPZq2VwA
         Ro6mVDUVFdPIrgqpOQFk3XGgPENYxw62thL8uvghB2v16VfA4y1+6CCou8/hi5zD/6qS
         uJHc9jQQtT6kccQJtbUXH8Gw3aC1It/Pk/spm9/y5ayJccp+azUgM4QzQ9sKRiNWI732
         Da/A==
X-Gm-Message-State: AOJu0YxhSxC3Y6qU6YN/8KEjj6Q3GmGGODhBF2qExoVXTPT/FqpQHAlT
	gx+wRWn9zCi70boNKRp7yt4hWlCnqFwAA6ZMyeBECoJzU9pgVjjkM3eqrfHqs0v6JFzlj+qvzHm
	KNOlU
X-Gm-Gg: ASbGncstMAjlkTzoPY7jmO4EwS3DygAOu7sycQ/2eiw4LkiYqOsqf51PNW5cQR6PovQ
	H1CyhjiCKyDxIb1lphldldu8/UhV53yzwriCDTJp23BX8IST5Ipyie0MMd9FwLT9wgQht8hn1Ib
	HAZgoVvEkftfb43cfM3uwYM6RQjxAPDRCpVT6vzoDnvMpIskPhXlR4O+UCN+ghtqF+rqQDqV6GY
	zcknK0/AZAS/TkyjIdPAu+IlPWDg2Z+AABCdpJsd+vednAbIBJC3yntvdNpGuQg93lQ7o174993
	VsY6sbxqot8M4cafp6rZR7gUBB7xJ/aGkfPtjro2zM4=
X-Google-Smtp-Source: AGHT+IFXujkoH1rmzbgM44ozxRYkv7MjjQo82N/bdbk2AaL4NzasANevgy4+Ww8j3PkqQkHtFsVYzQ==
X-Received: by 2002:a17:902:ea0d:b0:234:914b:3841 with SMTP id d9443c01a7336-23529a17ffamr63381845ad.39.1748627185817;
        Fri, 30 May 2025 10:46:25 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bcd56fsm31205955ad.48.2025.05.30.10.46.25
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:46:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][walnascar] brief-yoctoprojectqs/ref-manual: Switch to new CDN
Date: Fri, 30 May 2025 10:46:21 -0700
Message-ID: <152466764d89ba25a1e259d917a16c69438c6f9a.1748627115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748627115.git.steve@sakoman.com>
References: <cover.1748627115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 30 May 2025 17:46:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6949

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The project is switching the way handle our CDN provision of sstate objects,
update the URL accordingly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 406e8a8e30404c0538f5aa46f211540bae2b206b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 2 +-
 documentation/ref-manual/variables.rst       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 2f6e4cf02..6de3b84c5 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -252,7 +252,7 @@ an entire Linux distribution, including the toolchain, from source.
       file in the :term:`Build Directory`::
 
          BB_HASHSERVE_UPSTREAM = "wss://hashserv.yoctoproject.org/ws"
-         SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
+         SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
          BB_HASHSERVE = "auto"
          BB_SIGNATURE_HANDLER = "OEEquivHash"
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 643a3e7ae..b4a70519c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9025,7 +9025,7 @@ system and gives an overview of their function and contents.
       The Yocto Project actually shares the cache data objects built by its
       autobuilder::
 
-         SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
+         SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
 
       As such binary artifacts are built for the generic QEMU machines
       supported by the various Poky releases, they are less likely to be
-- 
2.43.0


