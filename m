Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B4C7E7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 13:31:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.101332.1733751062537912501
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 05:31:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mFn0yIhb;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434b3e32e9dso48503335e9.2
        for <docs@lists.yoctoproject.org>; Mon, 09 Dec 2024 05:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733751061; x=1734355861; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DaWVtEraI96EotCAFZpzZ5DvNz5Q/jDTFWC2/H+Z2fE=;
        b=mFn0yIhb/8pPZ4p2VuypgcUIXflS7SpPG9FZ/eOF6CJnr5ixJpChPxtRGeAINSGGoD
         FyhvLh7pOaG7ADcj5D7jv87mDx7NHSvG4E/BgRGKuqB1s821h7LCClkejPgfulYQ45Oa
         jwLDfZnB5DHd9QP6PWe7t6YXkZDm21FflJbA0YjimgR7BwdlJa+phGVJ2zlSGPqTuqVG
         j4qFAhoAboJe0q5JmAmtHRgMIGvnkNfeNc5GYokhhEunarOjkzxdoMe7Z03b3jmXovTe
         Z/ba6YjQye0GomdrPlECVYHh0Z5y2h793zOUZgLnDatZ25MZPR/c81mVReaRWAKIqcTh
         s0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733751061; x=1734355861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DaWVtEraI96EotCAFZpzZ5DvNz5Q/jDTFWC2/H+Z2fE=;
        b=DwQ+sgj6pxcLQ7XCbpf5qbhCIdpsxOcrmHiGA+ZeOe+2TajoYcEvSfFICDJF4iSaCz
         crxeXu+MrgbhFWS3I+olTKT2N+2JbRscdXTNhdHG0hvkoC9rEB6oUy/aWQcKQ2Y3H1h5
         CjrLvbC8PfFUMEnVFF6DsMh/tAOPf2Uqx9jssvtrayc+ZDmZ21p8yL8ST5MzlhggLVUT
         Xg0WUTU62RciqzwCe6hjDPpzNSId2/FLzWN1SevJzFh/ECM0aST3PfJyABOhEoRtJk9y
         CIa0Dmt6SNuRcp9fK7faQM5k6UZKTaeWa/gmTxrwYFIePl3+MZ9DtrNUS6Ft8D9nU+5e
         BmPA==
X-Forwarded-Encrypted: i=1; AJvYcCXmBQfIYS75+as/VlkvyQYQ3XyhYbV1/aPSb84S5eDC3SVkEpTcImMweLZ1+wmaqK0o1TAN@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yz1LetXyluNZNJumlhIUvnBYjNTNvHq0gH2XbYxSUy2pcZ5IYxt
	w0wRRsTionWbG80T1ZAilM3C8VtVmbB1jb6jG388Ya2USX3DeAEJ
X-Gm-Gg: ASbGncs1sDw77vJxnxp0qL68/CdeAI7Z9kkm6Q9paPMUYgitLPfcNCdj5OJs6XeqLE3
	V0s7Kni/8rSJ/YFx24PHsBhR/Q0f8yMe274abz1WJaLJDvwRt9dJZ0+c7Bt8b++PCpE5zzBCFbp
	IYHfckoZ8CG6OugwVIgKIPmPFqMPHyza6YNKi1LCm2qKTw0X/zEVfnXG+E6br38sk+37O8K25IV
	uSeLSc1iw0hGlPpkkEGAwsT9aU9hxUZon8HizskncLqkwVcOHZxBWNoQ3nqVX+ZHXjh5QFCfZMI
	vaBCcQ6POJk=
X-Google-Smtp-Source: AGHT+IGRJRVEtWQ5rOOZS6KVPbdPoQCjn7vaShWpfRjgfibYsQIxIAfzwcDkOYs7N9L9vWzU2me76g==
X-Received: by 2002:a05:6000:79d:b0:385:c511:240a with SMTP id ffacd0b85a97d-3862b37c2f8mr10254197f8f.25.1733751060689;
        Mon, 09 Dec 2024 05:31:00 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861fd46cd3sm12975313f8f.55.2024.12.09.05.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 05:31:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: bitbake-devel@lists.openembedded.org,
	docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] bitbake-user-manual-metadata: add a section about 'addfragments`
Date: Mon,  9 Dec 2024 14:30:53 +0100
Message-Id: <20241209133053.2494088-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Dec 2024 13:31:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5895

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../bitbake-user-manual-metadata.rst          | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/bitbake-user-manual/bitbake-user-manual-metadata.rst b/bitbake-user-manual/bitbake-user-manual-metadata.rst
index 40a0c6f02d9..16e4946b282 100644
--- a/bitbake-user-manual/bitbake-user-manual-metadata.rst
+++ b/bitbake-user-manual/bitbake-user-manual-metadata.rst
@@ -754,7 +754,9 @@ share the task.
 This section presents the mechanisms BitBake provides to allow you to
 share functionality between recipes. Specifically, the mechanisms
 include ``include``, ``inherit``, :term:`INHERIT`, and ``require``
-directives.
+directives. There is also a higher-level abstraction called
+``configuration fragments`` that is enabled with ``addfragments``
+directive.
 
 Locating Include and Class Files
 --------------------------------
@@ -962,6 +964,37 @@ the ``autotools`` and ``pkgconfig`` classes::
 
    INHERIT += "autotools pkgconfig"
 
+``addfragments`` Directive
+--------------------------
+
+This directive allows fine-tuning local configurations with configuration
+snippets contained in layers in a structured, controlled way. Typically it would
+go into ``bitbake.conf``, for example:
+
+   addfragments conf/fragments OE_FRAGMENTS
+
+``addfragments`` takes two parameters:
+
+-  path prefix for fragment files inside the layer file tree
+
+-  name of variable that holds the list of enabled fragments
+
+This allows listing enabled configuration fragments in ``OE_FRAGMENTS``
+variable like this:
+
+   OE_FRAGMENTS = "core/domain/somefragment core/someotherfragment anotherlayer/anotherdomain/anotherfragment"
+
+Fragment names must be prefixed by the layer name where a fragment file is located,
+defined by :term:`BBFILE_COLLECTIONS` in ``layer.conf``.
+
+The implementation then expands this list into
+:ref:`require <bitbake-user-manual/bitbake-user-manual-metadata:\`\`require\`\` directive>`
+directives with full paths to respective layers:
+
+   require /path/to/core-layer/conf/fragments/domain/somefragment.conf
+   require /path/to/core-layer/conf/fragments/someotherfragment.conf
+   require /path/to/another-layer/conf/fragments/anotherdomain/anotherfragment.conf
+
 Functions
 =========
 
-- 
2.39.5


