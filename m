Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.8770.1605110894436902391
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 08:08:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kKirXEFW;
 spf=pass (domain: konsulko.com, ip: 209.85.128.66, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f66.google.com with SMTP id c16so2823787wmd.2
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 08:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PFt0iaqXWp4fwA8goL88YZd6O6suW58n6ogu6iGmdoY=;
        b=kKirXEFWY5MAnOflq4n4PbITWdnk/bkuxPy6xXcct+qKEDpzUz2C8v0NsUOuKZGUPT
         tCRpwX2XZuiWQN7/e7UinGhrgmYze9rH2Js012Wm0OfH0xBPwg7kWQth8iyraky7dapS
         a1F4s+b5qllMU77jPbZL85IalCvqKiFJlkaDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PFt0iaqXWp4fwA8goL88YZd6O6suW58n6ogu6iGmdoY=;
        b=g6jhKIoOadmw+3n7Z3CmZlJlo9PjvKvgAg3uvYGyugR82DCcQKgz6u6+ep42xNJA2d
         W79tnjQhkjgLt//EYVL06kZ+OFzuAa6FBMefqY/++zLvw+Oaek0AjmOB0zeEGraSksY1
         72xxgsO1owbxJQKWGCzfWhJRco/yCSTVUUXE6iFCqzDyEAkBfBxLaijOVfv0rtTOlQpS
         6xirIUw7qIk8H/dAASaaumKf+kDDitJbC7GoAeXtJo6WMYdYdAZCExa/sojiSAO2HjKQ
         MFVfe40mUU+FK8ZOyWTK4x4XwZC5hVJY4wHQF8LwCUSH8GhzXL2XYSlQZ4R6nUQpZClB
         G7VQ==
X-Gm-Message-State: AOAM533zt35Dggz518Lwd5hqrfVpUSY5i1fDcJ6gZzrvvESrcIOw7O/w
	WXeJL1V1zI+E7pKVtZ9cPTCUZ2UGRm7t3g==
X-Google-Smtp-Source: ABdhPJwRxhlctedKi2Tz4PGLvLZXP4ILPFmVMjFF3sltuAIppqeI/pzuMHkAHYkWECFR8ngaeZGB6g==
X-Received: by 2002:a1c:20d0:: with SMTP id g199mr5273631wmg.68.1605110892825;
        Wed, 11 Nov 2020 08:08:12 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
        by smtp.gmail.com with ESMTPSA id u195sm3174617wmu.18.2020.11.11.08.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 08:08:12 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 8/8] documentation/README: Refer to top-level README for contributions
Date: Wed, 11 Nov 2020 16:08:00 +0000
Message-Id: <20201111160800.5669-8-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201111160800.5669-1-pbarker@konsulko.com>
References: <20201111160800.5669-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This may help anyone looking for patch contribution guidelines in the
documentation directory itself.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 documentation/README | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/README b/documentation/README
index 534ae66f8..5beed2517 100644
--- a/documentation/README
+++ b/documentation/README
@@ -318,3 +318,9 @@ References to the bitbake manual can be done like this:
   See the ":ref:`-D <bitbake:bitbake-user-manual/bitbake-user-manual-intro:usage and syntax>`" option
 or
   :term:`bitbake:BB_NUMBER_PARSE_THREADS`
+
+Submitting documentation changes
+================================
+
+Please see the top level README file in this repository for details of where
+to send patches.
-- 
2.20.1

