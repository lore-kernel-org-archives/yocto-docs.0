Return-Path: <bijak.dawid@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A594FFB44B8
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 06:23:58 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15498.1777011829771370601
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 23:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mxK99RJk;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: bijak.dawid@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso71267695e9.1
        for <docs@lists.yoctoproject.org>; Thu, 23 Apr 2026 23:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777011828; x=1777616628; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yZqqwzpzAcKmjv9ffq9pAwrAH0YXXJj00327dPzEUY=;
        b=mxK99RJk5cRNNSw5ai5xdwD9S1/F7iQVT3z//8ee9f8ZwNIGgyIxS2h2HoKj50oSCE
         XQ49HiuZkxwyXk2tV4RRH1SF/1zlLjHJqMKYV+xpTrGL1N4/x0kDaPFCP2fycpvbMUtB
         ZOwlGKBG0jN9NAbcaTTJBEWjESVljE6HQ7wZhB/az9ZgpxsTtrJDuiZLTBtnWYhpybc6
         5bpFf1IGzvYtdSiQLTwK7WukqdZwwwQXT/j2YnSn5Grh6At5W+7aike1nYkrr4V+n4Pi
         72zqCLJEcUPGB97qWIpAm6Rry1imb/4/8G28us9koUGeoQDd0ZWKIrIa4S0D6ju1jR+H
         cpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777011828; x=1777616628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9yZqqwzpzAcKmjv9ffq9pAwrAH0YXXJj00327dPzEUY=;
        b=Dc5Fe9cbnoxiroO+bcXsVYxdW5aZ/4KQvBoEevUZTIbfhHjBDgRFkXbmgNwSax80jP
         +UCVY4qPohHsvvGyux7MhJgV6fQCcWyrUyLBgZ6KMeccaDOTzrn0gnQN1Q54+EkZQ3xS
         V2Oh+I6qYvFvtzlVz6SSt/xI98PgLgomMaAwMxg2Db0ZR12wsIV0/014q9xAMSJMRAZj
         MlLYjzNNMHxB46foWfOkzVaiOtoJTn0A3ryfqM55rhfy+bab4ZC7tCspcXcGTjAfxu4O
         xrmJjHQLyRyt3aGc8R1VGzpspgBd9FcFjWmKlcPtEj7IRPvk0W3YVuPU4KLJne/5UScY
         WsNg==
X-Gm-Message-State: AOJu0YyH8NV6+ohrWowHOa8qjdHfjE5h1PZagE8AS6sBc3fKGbq0LKtp
	4Rktg8CHoApZWLcYgQBCXEFjX3FNcCM5ZHCBkDAQRTdOPrbuwgE37RwLYXIC50k4Q24=
X-Gm-Gg: AeBDieu+nDl2yHZgBKUmHtf3JYkv5cYcKIXZ+BO49lRheSU3onGeEg7lTYvPZRu2e0x
	sIUjnA7kzB6+Xw2ZxFdve8ul7cyyn3JzSnT0qGRXSs1aLB1voIoczXTb9YAniwD6QV6mR84U2ev
	PQnMfcpGLmPgsdQs1iINfWLKM789wJODR8FMXJCU8WqhxWEU7iulG8nH+0daaaGdE9jHctDAfOx
	GBR+LMWgrIsc/uGu4nN9Mog1Lbua72HSZu+Z0C34rf9wstMrNv2NOiqM7mFQO040rhEgcG6zVN/
	KGLQtJu+TduTtEDosDUofwOZblhCX4D40DqGn7SU9U21/gbvABhfncVctksCiL3lTJMuVaz6i6n
	r+B9QbpYDFJ4IGQ5ZuyaI1767n20050nHzvGwv7ty3LlffVB9wV/703T0xDdg1yImmHnFwQ6jxU
	3Ts3PmBY8Rnf+KU8y7szRGCcn+X7tcP7cB4NiT0UHYB3RNykVD2YCPIMYVXlcSSqgJ6dOSYiOcb
	xg4IHMO8T5itgtYZdzhdxTz3RaBhqkRQxfIL+xo/XY3BPIqQKPjDsNDynl3M4nYQbVeFxPx6Q==
X-Received: by 2002:a05:600d:8447:b0:487:338:b4f3 with SMTP id 5b1f17b1804b1-488fb778734mr332214575e9.17.1777011827946;
        Thu, 23 Apr 2026 23:23:47 -0700 (PDT)
Received: from thinkpad.fritz.box ([2a02:8070:d188:380:d82e:7b6b:5e9:c77b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a5549f582sm81692205e9.33.2026.04.23.23.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 23:23:47 -0700 (PDT)
From: Dawid Bijak <bijak.dawid@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Dawid Bijak <bijak.dawid@gmail.com>
Subject: [PATCH 1/1] doc: bitbake-user-manual-metadata: fix inherit_defer documentation
Date: Fri, 24 Apr 2026 08:23:27 +0200
Message-ID: <20260424062327.820993-2-bijak.dawid@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260424062327.820993-1-bijak.dawid@gmail.com>
References: <20260424062327.820993-1-bijak.dawid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 06:23:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9337

The documentation for inherit_defer contained the claim

"If VARNAME is going to be set, it needs to be set before the
inherit_defer statement is parsed"

which is incorrect and contradicts the purpose of inherit_defer.
The wrong claim is replaced with an example which demonstrates
the contrast between a plain defer statement and the inherit_defer
statement by using an override assignment placed after inherit_defer

Additionally the inline python expression examples have been
moved from the inherit_defer section up to the inherit section, since
they apply to both directives

Also add an anti-example showing that the previously documented
pattern of setting the inherited class name from an anonymous
Python function does not work with inherit_defer.

Signed-off-by: Dawid Bijak <bijak.dawid@gmail.com>
---
 .../bitbake-user-manual-metadata.rst          | 61 ++++++++++---------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
index 40cae6b05..38efe6b11 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
@@ -803,7 +803,17 @@ An advantage with the inherit directive as compared to both the
 :ref:`include <bitbake-user-manual/bitbake-user-manual-metadata:\`\`include\`\` directive>` and :ref:`require <bitbake-user-manual/bitbake-user-manual-metadata:\`\`require\`\` directive>`
 directives is that you can inherit class files conditionally. You can
 accomplish this by using a variable expression after the ``inherit``
-statement.
+statement, as in::
+
+   inherit ${@'classname' if condition else ''}
+
+Or::
+
+   inherit ${@bb.utils.contains('VARIABLE', 'something', 'classname', '', d)}
+
+In both cases, if the expression evaluates to an
+empty string, the statement does not trigger a syntax error because it
+becomes a no-op.
 
 For inheriting classes conditionally, using the :ref:`inherit_defer
 <ref-bitbake-user-manual-metadata-inherit-defer>` directive is advised as
@@ -827,39 +837,32 @@ the variable after the line is parsed will take effect. With the :ref:`inherit
 
 Here is an example::
 
-   inherit_defer ${VARNAME}
-
-If ``VARNAME`` is
-going to be set, it needs to be set before the ``inherit_defer`` statement is
-parsed. One way to achieve a conditional inherit in this case is to use
-overrides::
-
    VARIABLE = ""
-   VARIABLE:someoverride = "myclass"
-
-Another method is by using :ref:`anonymous Python
-<bitbake-user-manual/bitbake-user-manual-metadata:Anonymous Python Functions>`.
-Here is an example::
+   inherit_defer ${VARIABLE}
+   VARIABLE:someoverride = "someclass"
+
+:ref:`inherit_defer <ref-bitbake-user-manual-metadata-inherit-defer>`
+defers the evaluation of ``${VARIABLE}`` until the end of
+parsing. Assuming ``someoverride`` is in :term:`OVERRIDES`, ``${VARIABLE}``
+expands to ``someclass``, which is then inherited. Contrast this with a plain
+:ref:`inherit <ref-bitbake-user-manual-metadata-inherit>`, which would evaluate
+``${VARIABLE}`` immediately, before the ``VARIABLE:someoverride`` assignment
+is parsed. ``${VARIABLE}`` would expand to an empty string and the statement
+would become a no-op.
+
+Note that assigning the variable from an
+:ref:`anonymous Python function <bitbake-user-manual/bitbake-user-manual-metadata:Anonymous Python Functions>`
+does *not* work, because deferred inherits are resolved before anonymous
+Python functions run::
 
    python () {
-       if condition == value:
-           d.setVar('VARIABLE', 'myclass')
-       else:
-           d.setVar('VARIABLE', '')
+       if d.getVar('SOMETHING') == 'value':
+           d.setVar('VARIABLE', 'someotherclass')
    }
 
-Alternatively, you could use an inline Python expression in the
-following form::
-
-   inherit_defer ${@'classname' if condition else ''}
-
-Or::
-
-   inherit_defer ${@bb.utils.contains('VARIABLE', 'something', 'classname', '', d)}
-
-In all cases, if the expression evaluates to an
-empty string, the statement does not trigger a syntax error because it
-becomes a no-op.
+The conditional assignment of ``someotherclass`` has no effect on the
+``inherit_defer`` statement, which has already been resolved by the time
+the anonymous Python function runs.
 
 See also :term:`BB_DEFER_BBCLASSES` for automatically promoting classes
 ``inherit`` calls to ``inherit_defer``.
-- 
2.48.1


