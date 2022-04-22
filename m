Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 492DBC48BCF
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.7317.1650627972615792637
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 04:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KNhFctgh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id t6so7246438wra.4
        for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 04:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MHhnXcn46X2BzQnsUwEERBZBNVW3CV0yQs6pMLVjMAE=;
        b=KNhFctghzSnizdpG+tjsEM2EJdxRlW4u0G/dyTcMt62nBb5x262aPvKMgDzb/dKRPx
         3MU2h6CLx88fIRQqF4CaY2nDsYetgx3ycroKum+8MZi3Kcj67CD38LOGKvrT9tLA9WuQ
         WUbDwzOAU+W3a0Z55nPSl1T5jp/sk6yzOiSsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MHhnXcn46X2BzQnsUwEERBZBNVW3CV0yQs6pMLVjMAE=;
        b=Ez/IhaViqAWFY2Z2SQA/SUbx1wOi/Q5Klz4V/O/aQ4LRWXbiUQ7K96mcOxkW1hIK9C
         AieKu3r684Tq5zRqqCxW1B6RQWv4oK0SIW63mFKpbKReRvdFdQUQsb3asTIefsl/e9aV
         oBARZOzDSELVHkju6Hn+EuXIziF8vNlMj6UvDzGMRwezk7qITAV2p2NmT0V2ixtHb3r0
         Jwn/lkRV9Wcx+cY6tJZNa+bCf4a3Sk/6DRWeZiuPJ2AXbq+KYAcKStDFDtr9SspNLAqO
         dYXll6LCEYOMM0HWsjgldQwl0iLdXzfBV70gDR5Oj6u892oB9TD0JP6liE/nK2OoarqG
         TUug==
X-Gm-Message-State: AOAM532i5jtydcHSXi00ofKqqy6eAa3XoCKO8EZ5s3iBXoc9GZNJMWxM
	R1nUuMI4/S2VB091NMmRi1dTNXWJoQtheA==
X-Google-Smtp-Source: 
 ABdhPJz+DnLTez0kahXTG7K+AlWKCRL6cGaB/IOhrYWXYXa6zZJj6hJA5fam++cjGufukSc5OYG8Vw==
X-Received: by 2002:adf:b64c:0:b0:1e3:16d0:3504 with SMTP id
 i12-20020adfb64c000000b001e316d03504mr3402147wre.333.1650627970900;
        Fri, 22 Apr 2022 04:46:10 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9788:6d00:bfe8:c84e])
        by smtp.gmail.com with ESMTPSA id
 p3-20020a5d59a3000000b0020a9132d1fbsm1805804wrr.37.2022.04.22.04.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 04:46:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Cc: Paul Eggleton <paul.eggleton@microsoft.com>
Subject: [PATCH 2/2] ref-manual: add ZSTD_THREADS
Date: Fri, 22 Apr 2022 12:46:02 +0100
Message-Id: <20220422114602.2648543-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220422114602.2648543-1-richard.purdie@linuxfoundation.org>
References: <20220422114602.2648543-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2842

ZSTD_THREADS is new for kirkstone.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/ref-manual/variables.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 0a5f8c98a..39b21f25e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8772,3 +8772,16 @@ system and gives an overview of their function and contents.
       memory and become problematic with parallelism elsewhere in the build.
       "50%" has been found to be a good value.
 
+   :term:`ZSTD_THREADS`
+      Specifies the number of parallel threads that should be used when
+      using ZStandard compression.
+
+      By default this scales with core count, but is never set less than 2
+      to ensure that multi-threaded mode is always used so that the output
+      file contents are deterministic. Builds will work with a value of 1
+      but the output will differ compared to the output from the compression
+      generated when more than one thread is used.
+
+      On systems where many tasks run in parallel, setting a limit to this
+      can be helpful in controlling system resource usage.
+
-- 
2.32.0


