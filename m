Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.12626.1608651040920334049
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 07:30:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nEpJokky;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id t16so14923767wra.3
        for <docs@lists.yoctoproject.org>; Tue, 22 Dec 2020 07:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F07TU/hCYjJKKkB2o+Dqv7/+c6v7cItXATstFfesKjI=;
        b=nEpJokky2nYckiM3ioSqJeeHE1xQJDzVB1a6oSYG2CLhYUB9mhbt72SIhTuodrEYwQ
         D0dw6dF/nbhE/cORaLvEY4igBvtn8NrobSYWKSNQQfQtoWUn2oO8tL83KDSfsL+wDZKq
         xM/MhXRqVn0RHmYlZj1lRLJ+3XcbDjUWOMnrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F07TU/hCYjJKKkB2o+Dqv7/+c6v7cItXATstFfesKjI=;
        b=M5A8cB/aHZFFgWkywRFDhPKa6WsdC6nzrasICe0UX4GwCKLDvawTZD5+/QS3OSq9si
         konbhK2gFTQnLeDPHDTpRNBzFPh9BFBFO1gOpAC+CXC2Hxdrm0f4pe3Yc9g66fjiu3Wz
         QsFGXQILBjh4Rj2OYaFIWhcXd7oo0wNbx4K9JifF04sfcAhiycCpLvqyQELSogpDPvfq
         rvB2CxsaCHaX/x/8WGl22F27zLV5wLi2XTB40TYwJd6Fqm+Bg4f/xfWdJcEBXYYfPM8U
         oI/iHBjxCBDzWYzTMKgeb4VtK745Tu3OQ3W4ucYYKnmtOmHWW+BlTFfaL8IjlmLMtq8c
         b5gg==
X-Gm-Message-State: AOAM532E6bWBcDG3SAHdpdB5aP65CFWLmRnPAMTpbCpgiTlSRe0Vzr6N
	SEh1Q2cbE5TB7L8PwSct7rB/9iO1VlmM2A==
X-Google-Smtp-Source: ABdhPJxwchJSqnZhmqSomgyC6dVhlGgihyB2h81gvykk7ymXieNw5FjE/vvbS4SberCUvs+tGowoRg==
X-Received: by 2002:adf:9d83:: with SMTP id p3mr25341786wre.313.1608651039299;
        Tue, 22 Dec 2020 07:30:39 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id g192sm27808276wme.48.2020.12.22.07.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 07:30:38 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v3 5/6] ref-manual: Simplify oe_lists link
Date: Tue, 22 Dec 2020 15:30:31 +0000
Message-Id: <20201222153032.6909-6-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201222153032.6909-1-pbarker@konsulko.com>
References: <20201222153032.6909-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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

