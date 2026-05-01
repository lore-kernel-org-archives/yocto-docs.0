Return-Path: <bijak.dawid@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166B5FF885A
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 09:14:51 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10684.1777626880463553141
 for <docs@lists.yoctoproject.org>;
 Fri, 01 May 2026 02:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BXxjYHVV;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: bijak.dawid@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so28382085e9.2
        for <docs@lists.yoctoproject.org>; Fri, 01 May 2026 02:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777626879; x=1778231679; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbkVjOYX2ZTYDmcV+w119AsgVq2edC5qOkWuWs4zWTQ=;
        b=BXxjYHVVtPPnHDhL7k93kRrOcOimBoj7jIa/SYEHDZtMNAIKSfyZoRQ8pnqg3nM7rY
         MP4DnmkCuVWZuVdSyd19DrsPVxrBhuX1ngAHxLVX+j+TAEPr7/QbekwatQQI8yLICaPi
         5d6AnyGjbduqoNIdcMSK33DHN0OZePgrduzgMeGQVm59W/HY8OQU0DLQLC40O1yMMeiF
         xABnnIlvTWmSE+h+fbFnkexEmr+oxMweycbk+0uA+o9VYKBTghmT0B5LHTe5Tz+VP9nP
         GjzSYJS9CNhIbHYS9beyJbQ8vfPJ9eUsAALUR9Jp8dbhTkGY5NPm7MamMMeEWBbfK7Is
         kVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777626879; x=1778231679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EbkVjOYX2ZTYDmcV+w119AsgVq2edC5qOkWuWs4zWTQ=;
        b=fg7Aj76U0Wi0SAWXDtoKIU1yrFpynJ32hkwoiFOiS1/34H0131VyMIqv0PMM9/dYgq
         nZWYbfyXbz8pk8ktHK7jhf4eQk/HJ/LLajzZg/8gUT49mffpQHKdVbu2HvZAe63xN5dG
         OYoFz5LMWtLX3L/VmvvRNE4PKaVOP2ut99CoE12KYWFsWkzXa5ep0hB0krZ5uKksubUi
         cyXolzdXZaW3qg+/p+zpeGQmkgufFkjU7prUx/SMOgGowyW2XJ+uFOsjKMX6KaceCJVz
         llWQ785vKpCcAfll9OtNhZAepsM1TD2kzA3MLbm/jpap1FA4oPhJXy3nUQwOmbK3c/E8
         790w==
X-Gm-Message-State: AOJu0YxgNnnl28W4QEDa3WUid+296xx4cIcuRMq0fOM8+jpcjUyorgHK
	SLQHCXZykBIsfVSybfn8ZgdzpULaY/13DUFXbA2MGU9Jnio96bkQA0lJ9TR1gYmUJKg=
X-Gm-Gg: AeBDietj21BkVQFG/VBGo4bmBWhiOfv37Rs4LcdJSgeyBjJqXY7oUlcuNzALJv8iLVm
	0CbNKiklpCsXo1/N2xU0AlIJxl1UwegrEcxjzUBGRo1ZoCgUWyORda1itdxXOTkxbF4DI6EQxfu
	KxH8TRbMPIXUYy/xgo7p0pYlzR8XFQQGRRZ9IJ3XtJAtJc7pMrm8lK/poPyAHVbDbuKv+ovxuim
	SpKSGS9EINsKP2T5g8zA/FA9proAEfdB4NV84biRftd36S0/DM8KKgqfCpwcSJIq1xo64FJ0A0i
	4a6H0cCBPm8pvEePSVpHvnUDM2SYakK+Fb3lfBcwobuT4W6Kvq1Rt3B5uPTRWk1LJwKL9tt3UAF
	De1m1X+3j5ydSyCbjtc0Hi3dAk3+nKLr4cZ8P2FD9tGBnvf/lOqUMFmL8kxIXVcUhN7Bk5wpACo
	n5ZEiUGSKkoayU3bYWXkdFJYwzqk96ijPht2kZBXN57AuKFnPegb5p+xpKhnuKt9lxP8pP/FDqc
	UWcLV3mcOuedGmyFzb6cofZQxyT//OKjyH9TMkKzhXxedv8I0EZ849KMZYUpOcH1xJYr/1JkQ==
X-Received: by 2002:a05:600c:350c:b0:488:f453:b976 with SMTP id 5b1f17b1804b1-48a8449e51amr108314065e9.27.1777626878747;
        Fri, 01 May 2026 02:14:38 -0700 (PDT)
Received: from thinkpad.fritz.box ([2a02:8070:d188:380:6a5d:7450:e8b3:758])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a8fe953besm12097955e9.2.2026.05.01.02.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:14:37 -0700 (PDT)
From: Dawid Bijak <bijak.dawid@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	quentin.schulz@cherry.de,
	richard.purdie@linuxfoundation.org,
	Dawid Bijak <bijak.dawid@gmail.com>
Subject: [PATCH v2 1/4] doc: bitbake-user-manual-metadata: remove incorrect claim
Date: Fri,  1 May 2026 11:14:15 +0200
Message-ID: <20260501091418.76994-2-bijak.dawid@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260501091418.76994-1-bijak.dawid@gmail.com>
References: <20260501091418.76994-1-bijak.dawid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 May 2026 09:14:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9389

The documentation for inherit_defer contained the claim
"If VARNAME is going to be set, it needs to be set before the
inherit_defer statement is parsed"
which is incorrect and contradicts the purpose of inherit_defer.

Drop the incorrect statement.

Signed-off-by: Dawid Bijak <bijak.dawid@gmail.com>
---
 doc/bitbake-user-manual/bitbake-user-manual-metadata.rst | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
index 40cae6b05..ee6919dc4 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
@@ -829,9 +829,7 @@ Here is an example::
 
    inherit_defer ${VARNAME}
 
-If ``VARNAME`` is
-going to be set, it needs to be set before the ``inherit_defer`` statement is
-parsed. One way to achieve a conditional inherit in this case is to use
+One way to achieve a conditional inherit in this case is to use
 overrides::
 
    VARIABLE = ""
-- 
2.48.1


