Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.9567.1608631086942271329
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 01:58:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gbiSof/u;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id d26so13883738wrb.12
        for <docs@lists.yoctoproject.org>; Tue, 22 Dec 2020 01:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nkkHiRpjqRosp75OOlAJ6xCmNeP/y8kDwwBGGQ75CUQ=;
        b=gbiSof/u9YF6t+zbI27i2zcl9rtKgMRkqMSflp5RiPkXAn04qy7xeAMdhryZ//9he4
         1e+WBLNKCa5kF0eWi5dnwF7TueIcSgYeDZC2zL5wUnl6dbtgaIz+fDBpjDqDIYYtRTd7
         AaAWC2ZGgA+kvda9isGKcgxTuX9iSRvvbqC4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nkkHiRpjqRosp75OOlAJ6xCmNeP/y8kDwwBGGQ75CUQ=;
        b=g/XcHc4tbjCuyzC38taRptnMw8edrHEI3IbUlGaZO5mAS1X+gPR4zvR3nhooIq4qPY
         aWxSTgkZ4QO8E21jkPwfatPqHgTQwJd9qRx9n6Y5oACl1lIo8GeLkAUrZOkDEWwSfTXX
         O9uSHA5fh6VK+OfreTOQJEJ3w6d5v/ZrTcoAHv/caIa+2gLIQpvtv+A7hSqwLItpK6z0
         3bX6Oz8mh8Ufj6mlhFxGZhFtkz40j9nA1v/lNNkjj7WbvjElCyZxEZbUymktyIVDkpx5
         Gy5hEGyMhcTPIMiYzoW89DEcbQ89kfNkzi0SLxENSVHAVgcOER0u4v3QbftiWTqFNfiw
         IwYA==
X-Gm-Message-State: AOAM532KFdyqID9UBYYfGEV2O0AOqXpWFcKuXqFcCxJ7cUTO/mryd8YW
	Uu5I40vQNDKK7xXvtpK/Nt0KYbqIpcOECg==
X-Google-Smtp-Source: ABdhPJxB+0UHV/Qwsm5tlZnZORnKKnORnfkoP2APCP/Us0BpbyJ6egvCBsgshz3JCEMud40Mmji0Uw==
X-Received: by 2002:a5d:61ca:: with SMTP id q10mr23273350wrv.124.1608631085385;
        Tue, 22 Dec 2020 01:58:05 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id o125sm27291772wmo.30.2020.12.22.01.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 01:58:04 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 5/6] ref-manual: Simplify oe_lists link
Date: Tue, 22 Dec 2020 09:57:57 +0000
Message-Id: <20201222095758.7411-6-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201222095758.7411-1-pbarker@konsulko.com>
References: <20201222095758.7411-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 documentation/ref-manual/migration-2.2.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/migration-2.2.rst b/documentation/ref-manual/migration-2.2.rst
index ac247dce4..5c6fecf32 100644
--- a/documentation/ref-manual/migration-2.2.rst
+++ b/documentation/ref-manual/migration-2.2.rst
@@ -28,8 +28,8 @@ The way directories are staged in sysroot has been simplified and
 introduces the new :term:`SYSROOT_DIRS`,
 :term:`SYSROOT_DIRS_NATIVE`, and
 :term:`SYSROOT_DIRS_BLACKLIST`. See the
-`v2 patch series on the OE-Core Mailing
-List <http://lists.openembedded.org/pipermail/openembedded-core/2016-May/121365.html>`__
+:oe_lists:`v2 patch series on the OE-Core Mailing List
+</pipermail/openembedded-core/2016-May/121365.html>`
 for additional information.
 
 .. _migration-2.2-removal-of-old-images-from-tmp-deploy-now-enabled:
-- 
2.26.2

