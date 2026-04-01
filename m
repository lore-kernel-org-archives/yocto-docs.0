Return-Path: <yanis.binard@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC6510F6FD7
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 15:17:04 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15695.1775056615241686959
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Apr 2026 08:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TeGmh5iq;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yanis.binard@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so55602665e9.0
        for <docs@lists.yoctoproject.org>; Wed, 01 Apr 2026 08:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775056613; x=1775661413; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uQ488ni8D3fBBwAfedpzvii9rvMKwWZMtI1If4IYofw=;
        b=TeGmh5iqTC/K7aC/EO+NUp9jcUONX8X6V7rniT+8XlNQaBz82nnvAUF65lEJwFkwaj
         soAvG8lJmMPFfBw86YYa4jDmxvhl8uApDnPlJb2EGoWIsmjjlxOXRecNOQz4+Y2fieAw
         ya3FNcUKGI8Z5Y+bu7aLrYuzVQm6Y3Y2eBMF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775056613; x=1775661413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQ488ni8D3fBBwAfedpzvii9rvMKwWZMtI1If4IYofw=;
        b=VhBHwPpLcJfyk6J1CxmlpTogE3gtn3kPwvakG/DMlDw8VyayJ8F5rIhW8kRZkZcjZn
         tMTyp5rcQdWTAmWv+UX8NMMRSy4bH3CnHpgx/1huUWQS6EDFqEf+DJw3y12Xx/lRD9tA
         qO6tO24abrOTd/gaee5VurWyYJRkrlFW4GZS0L/skAEfljN4Z6Ty2Nyv0k5mzQZeTKi5
         wrB0j5QmT198lEQYdQIWBDL9kR8bJZa8CPx8yAG04U/nrRH7SzsYORyRQQAdghhAO3Vk
         jDpGB1yoJQV2QFyI+DGm79F/T0gu7BaAEIThlPFAiXe2zKT/m0CIn9JwsaqK6uLcZ+iv
         uaYw==
X-Gm-Message-State: AOJu0Yw0+RHJzoB/xzQUClgGy34Vo5KeMR1c23vKoTW0M6/YkM6h2teC
	YzLFir1v/h7ODyW6u3SjHw1zul/676RnXv8GMHyXOZBl+RhgYmcHxodCgxzGgMBQ35yZBPTwbVF
	NGiCMlTTyEw==
X-Gm-Gg: ATEYQzz65ukl7au/Pn5vLxJUsBUsY7rYG6lU5zITmHTI99inJr/viKVcAS9eleVipO7
	aTgyNZMqK0cFDJi5jO4vZsyfuDEPTY0PFq6GjlfKrdOzVwAePYR73IymS2x2jbouhKV5iAgeNfJ
	FSRMvD2kLvGDDzhUYoFwjex5wkqpnGvnDIExMHFnT7Efzmoqeoq/iRGMvT+rBtIMwxAJOL5+HN9
	pc+xUgDwxcJHeHmqbA7q7J/aEFMeFqqsTiKUhIWi/zkdrXXHQIcvkpTe/53LusHebnp8UoyRqOg
	DYjYE0HuKTZxZQBi91PDB9uwH2JWtKTbbxHobLWXesid4BR3GvhJ9s98PF+EqL86ppTmccdO1Lk
	kNQjLYfza7fkCqxSOt4mCS/a4xQjEw6cvuXK495oYgOUsTb3JpMCvmgCtLEuIQRineWa03Jo252
	zSymlhImPWBRPoDx/9fHl5u2V8V80qPoTU4GPF1lbVPZ7bGS2cn143dJffKs07nvTxMAHPwyOol
	mC9UQTnpE9/4MhFZlmovenGOndQ248gFA==
X-Received: by 2002:a05:600c:34d0:b0:485:3c66:e21d with SMTP id 5b1f17b1804b1-4888355e6d5mr75571105e9.2.1775056613377;
        Wed, 01 Apr 2026 08:16:53 -0700 (PDT)
Received: from P-ASN-MAGENTA.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d289asm548488f8f.19.2026.04.01.08.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 08:16:53 -0700 (PDT)
From: yanis.binard@smile.fr
To: docs@lists.yoctoproject.org
Cc: Yanis BINARD <yanis.binard@smile.fr>
Subject: [PATCH] contributor-guide/submit-changes.rst: Added missing word
Date: Wed,  1 Apr 2026 17:14:42 +0200
Message-ID: <20260401151441.275754-2-yanis.binard@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Apr 2026 15:17:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9156

From: Yanis BINARD <yanis.binard@smile.fr>

From: Yanis BINARD <yanis.binard@smile.fr>

Signed-off-by: Yanis BINARD <yanis.binard@smile.fr>
---
The typo is present in documentation for Unstable, Whinlatter, Scarthgap and Kirkstone.

 documentation/contributor-guide/submit-changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 089fec02a..7cf23c945 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -721,7 +721,7 @@ Taking Patch Review into Account
 You may get feedback on your submitted patches from other community members
 or from the automated patchtest service. If issues are identified in your
 patches then it is usually necessary to address these before the patches are
-accepted into the project. In this case you should your commits according
+accepted into the project. In this case you should revise your commits according
 to the feedback and submit an updated version to the relevant mailing list.
 
 In any case, never fix reported issues by fixing them in new commits

