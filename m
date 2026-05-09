Return-Path: <bijak.dawid@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FFFCD37B5
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 10:44:14 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9804.1778323446985771696
 for <docs@lists.yoctoproject.org>;
 Sat, 09 May 2026 03:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nRjzjrHA;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: bijak.dawid@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso24522575e9.3
        for <docs@lists.yoctoproject.org>; Sat, 09 May 2026 03:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778323445; x=1778928245; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heDiQGmStxsWzjZ7C89JEP4FQGM193j9xrAoXMmBsqA=;
        b=nRjzjrHAsdbyRbVdOGdbCE8AWRVz1ryh5N2U7mJGoIP+hGvcwjDmPZPRe0ejrqHuJG
         T5XdvSIXLX5YKgKU9iGpahfBI1/o1owrMpQy6Z+zgqhSggYRWPnZR2hmnPzRU/dtd36M
         skYWfJZXl0OpE73WSg7TQmR7j013QpzEx5ORTERbyiFOFWuohL8j/DKLe/q+Jt8g3SbL
         SSQBaajjeeS/sL6005FtD0ZBzh08hoeusAQiFBs9GorbcW+V6Jz1athkG1VUkC4mHJRY
         ljj8vrOnYfwGrSvBncQeKaVa5dM1blbanp57wzHMC4ZY3Xdas5TUmd4jkfo/IEZhOkWu
         77Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778323445; x=1778928245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=heDiQGmStxsWzjZ7C89JEP4FQGM193j9xrAoXMmBsqA=;
        b=U9IwQyAFV5gCKaYkxMEQNkPiH7v4KLV0S5oaVNLhJZK5FJv/659fM6WDAZ15EfI2i8
         xHYN1ODSZ5+49tPNOtgNYXGV3Tlxk0KUfCgTlFDHXlO0o7kL145pyUcO5KX/GNhmoF4d
         FHhl16lQI6PK4B2/z7a3OhQ/9oM8X6Pq2objS91ALzEZUCxJ/D/46+FKc7E5abzWFcYh
         ZKTs9ZM5fyiiMrEIAD5NH7CVcuGIxV/p2I/Mfwv12oN432dzaS7uJ6WQO/t/iOx77Pnj
         XN/s3+8hT+USZNyRdkKGh6vBb2OVfhx9dpH7Mg/e1nwKkmf7EQ37wDo9h76gmqNjOTdu
         WeDg==
X-Gm-Message-State: AOJu0YxnuqaQUpa+TT4ByWhrkolrgqI6mX2E7CCs4qOr4gvnHUopkMt3
	KaDEa1rqEnZhbi2m3u8dTrrXSYncr+g816PJJsQy4HhDQzWNDsFBW+kv
X-Gm-Gg: Acq92OHQcodqCipKV1umtcvYoSL/JhrhVzrEmKayjHTodVBV2JmUSmAzAfvIFAHpNGK
	J6djXaLGlSXUtToRzJpMJZV74wnfJYQjoNbmO/uf+NgW57qj2DqruyeK6YqTFY1ZlzoHzSyVH+6
	+Iv9mydxd8MM+GvZvfoTviXVROVxx+aSzWTtZjg3p6vCmhYfqMsvlZ4iSkkuiX1qD1YUdudReYo
	xBhy8CArPq7Y4tHtBVZ5XqlgUA3j+qUpK7+RIVQQSIhKsOETgNnOAuVbNstyMfHrcBMfGKd7UrV
	Td2DVnfDs9/e4Gqr1MSYk17TU9I/d+lSBJWbV/df+yaIkFTN8RY1ahILN6uemmt22WqCnzSBP4K
	hPLzTIy/a89lGF/9p1dpbyaARRA52EMxrzjEq/b2K+PvUkYsBeCwO/OsB9fc3ybCBtorYU0tWRV
	EXXjXb4qntpKYmENSxjM5hv3/O3BjIE/tEWeF70tZYbQBD45isHAJ0zE45NzXhvQnU4HL6+yMjm
	BgVfd8kw4PXTYtK8yXB2+et9mZWN8iZ5yE3oC/Dy70QWsRY8tZMSWg=
X-Received: by 2002:a05:600c:3b0f:b0:48a:7965:b943 with SMTP id 5b1f17b1804b1-48e51f4e9admr256583085e9.29.1778323445268;
        Sat, 09 May 2026 03:44:05 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8070:d188:380:b100:f430:86bd:b50])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e6d895781sm38837255e9.0.2026.05.09.03.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 03:44:04 -0700 (PDT)
From: Dawid Bijak <bijak.dawid@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	quentin.schulz@cherry.de,
	richard.purdie@linuxfoundation.org,
	Dawid Bijak <bijak.dawid@gmail.com>
Subject: [PATCH v3 2/3] doc: bitbake-user-manual-metadata: remove invalid anonymous Python example
Date: Sat,  9 May 2026 12:43:06 +0200
Message-ID: <20260509104307.26698-3-bijak.dawid@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260509104307.26698-1-bijak.dawid@gmail.com>
References: <20260509104307.26698-1-bijak.dawid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 09 May 2026 10:44:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9424

The documentation for inherit_defer suggested that conditional inheritance
can be achieved by setting a variable inside an anonymous python function
and then referencing it from inherit_defer.
This does not work: inherit_defer is resolved before the anonymous Python
functions run.

Replace the example with a warning explaining that anonymous Python
functions cannot be used to drive inherit_defer, since they run after
the directive has already been resolved.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Dawid Bijak <bijak.dawid@gmail.com>
---
 .../bitbake-user-manual-metadata.rst          | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
index ee6919dc4..52a9e7fa7 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
@@ -835,17 +835,6 @@ overrides::
    VARIABLE = ""
    VARIABLE:someoverride = "myclass"
 
-Another method is by using :ref:`anonymous Python
-<bitbake-user-manual/bitbake-user-manual-metadata:Anonymous Python Functions>`.
-Here is an example::
-
-   python () {
-       if condition == value:
-           d.setVar('VARIABLE', 'myclass')
-       else:
-           d.setVar('VARIABLE', '')
-   }
-
 Alternatively, you could use an inline Python expression in the
 following form::
 
@@ -859,6 +848,14 @@ In all cases, if the expression evaluates to an
 empty string, the statement does not trigger a syntax error because it
 becomes a no-op.
 
+.. warning::
+
+    Setting or modifying variables within an :ref:`anonymous Python function
+    <bitbake-user-manual/bitbake-user-manual-metadata:Anonymous Python Functions>`
+    will have no impact on the value of that variable in an
+    :ref:`inherit_defer <ref-bitbake-user-manual-metadata-inherit-defer>` directive
+    as the function is run after the directive is resolved.
+
 See also :term:`BB_DEFER_BBCLASSES` for automatically promoting classes
 ``inherit`` calls to ``inherit_defer``.
 
-- 
2.48.1


