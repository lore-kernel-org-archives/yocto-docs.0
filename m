Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11A6C5B543
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 21:32:35 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.187.1748640747123332266
 for <docs@lists.yoctoproject.org>;
 Fri, 30 May 2025 14:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=b+GCbIz9;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-311e993f49aso2076637a91.0
        for <docs@lists.yoctoproject.org>; Fri, 30 May 2025 14:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748640746; x=1749245546; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ZoFTKOQNgK/nRgsDi+aRgNfwD/2XAdtIxQ8vRKzu6U=;
        b=b+GCbIz9twEQqXgeuztlpL/qjBGmQijjeQ4HiZxDC0LZIbLziOrJuENVB0KT2Fg5W5
         9y13MGR229LRPbAX1apejljluG6+VGAHJQdQbecWDZ+Gi8jC1pnlne+7PmjGGEYD6V8f
         DsCyiYco5bumpjUAsrfuEKQ4vtg+K/O7qSZpNijSpqNfhH9bF7zqF25AtWc0RajRL/5a
         NHRfUTXmYkq3RzLqbkFWQe0mBnqXn6HoPcfjzS7Zi9mgX7VJ+hpLLZZwnzI7WRfikjzT
         fpiMbs0oXHXDwWKaOdAx2zwR6fqe6Fd/axI6GUWmqghOiO7AfztUIEVQlPqPjFnFEPGr
         rWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748640746; x=1749245546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZoFTKOQNgK/nRgsDi+aRgNfwD/2XAdtIxQ8vRKzu6U=;
        b=VfwBbmrkV2H56OhhY3IuYZ14iTBExJ+Dgitsem+faUCMvJ68izW6o9t4W9X0cJZ6wb
         SNJ3dw2DXPARrnO0m9qJ1M+1jnQKxC8Jm28rJ2EeXJ6vGVjnI9+Za802ARpRZTNNxCGk
         UOJkv9A6GoPk9JytBROaOywM7Hcs/Enb1uWKZSm0VgNl60z9AHu51TThzyVQOvVfTp3A
         3BwtNzIEv3JjlOIrMk7483HsQQqmoldhjLwU7+lHsOQhv4oHEu8UveUGV6tzJLZRBgCL
         ku8M7m7Zd4OSAAOCIoHuD2EZDEg8r5AzraocExonMtrk8eAmGXrq3usc68xP26qXFxPt
         Av2Q==
X-Gm-Message-State: AOJu0Yw3S7PpHTkK78FWTGs4jCdH3r6xf7jdAV6VmYnTgNsLX04PRjVl
	xOsuk5MoVU1xFVVse+XLXllk57OhUr4HmqhKBxUzPnBfFztaudLpVDhPOOKK83lsKgTCCw9390l
	q2eqv
X-Gm-Gg: ASbGncu29xkmDAMxz8YhbJS2rOEvUSXZScB1JEMe76GcWLNnGuX0/5A46pfD3eBnLKL
	oCsOzY09btwzvEcDJo1MwZvXTVjs7V+gCkNSY9BOOpyno7iH5gXv2R5TJpnjQ1AXRUeH1xDbRTa
	LerECQ8U6b0/pdT2pTieeilVPdcCUBNTiBFS8Q6N9z/sMtu64IzGK1nRYQcdmk+ShzzU34gczA3
	dHwdx3FE7koGGj9iDtkRx+F2DsjRtAspf+BKWAJieGVL3XSeryKSeBuRZtdbFGGU54JOzA/N/G4
	Ilb9QVVwlB+fbyrnZfDT+65ccg1jqUM+JsV2EWB/n/7dI+AlxGLMXg==
X-Google-Smtp-Source: AGHT+IEU6q2MPC3fzRagr4ZiLQyHeb8iCTGed/G1aZIcXv/BVHpIHVyJ1L08MjAgZszcJ+VwOyvePg==
X-Received: by 2002:a17:90b:2890:b0:311:f30b:c27 with SMTP id 98e67ed59e1d1-3125034c8bcmr5012972a91.6.1748640746347;
        Fri, 30 May 2025 14:32:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2b544asm1808020a91.2.2025.05.30.14.32.25
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 14:32:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][scarthgap] brief-yoctoprojectqs/ref-manual: Switch to new CDN
Date: Fri, 30 May 2025 14:32:22 -0700
Message-ID: <b24ba407835b0fd7ea70d16fb28d3e69477e46db.1748640673.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748640673.git.steve@sakoman.com>
References: <cover.1748640673.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 30 May 2025 21:32:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6950

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
index 070f5e2cf..a17299a30 100644
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
index 278ad47b7..9591159be 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8721,7 +8721,7 @@ system and gives an overview of their function and contents.
       The Yocto Project actually shares the cache data objects built by its
       autobuilder::
 
-         SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
+         SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
 
       As such binary artifacts are built for the generic QEMU machines
       supported by the various Poky releases, they are less likely to be
-- 
2.43.0


