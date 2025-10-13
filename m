Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7C5CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 13:22:59 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.43346.1760361770256685736
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 06:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ijm1tiBp;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso31816975e9.3
        for <docs@lists.yoctoproject.org>; Mon, 13 Oct 2025 06:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760361769; x=1760966569; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vHQwbLbyOLZsMF5+qwiJxXjB838jKb/XkviQM5Gxz50=;
        b=ijm1tiBpWbOwyv0PuSVJlq4yRG6rw7qQ8SDNi1tfuu4LysHqymSW8QrBi8Xg7WITU7
         G0pe5OtNrHWOemsaP5TEYrEj3IfRyL8eCoOt6XEpRgI/AsZTzR+J0Rf4WgUKxC3dB1Tr
         akY7SDAYU+MCSxs8wRlSOSayEb3tCT1vHZ3Mtm6GEco3/1lIscrnbTfeTYAhrPyhOyRN
         YlmyF8jDQ5lf/STel3khLAYTxM0IV/sRaaFndaJBQYY3N2p9ZQcyZMLW0ip0jAPWZCnw
         LcIyx5UqBR/cZF7iF58UBXyVW2YIjom48MWPzr6Fu/9W3MQQxltSLC+MSJh09txXWXmF
         kUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760361769; x=1760966569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vHQwbLbyOLZsMF5+qwiJxXjB838jKb/XkviQM5Gxz50=;
        b=mtkdyAc60adseiMMkAH4lC7Ufqo8dNhfAb+/ArT/v8yW4DABY7PPMNbXAuYVGFz/g7
         TNyIXf84wYMAKaqFrBRuktAXsDRQcTBPIOMQdtQZKPvKPjnkI/zIhpIn+lMIePvZldyX
         skBQ8SMi4CQISkxDWs7PGQlj1YbbRuM4u+LfbUj44mklcOwR6y34As3171YFQTS0cB9K
         Ds1BEb6ftjQfYUyc3pH0W6sdNJlLuUSegSsvXHuSle2ua5Gb6ye0kpCUO+V62XAkl8ZA
         BCI71Pk3qprk1n/wqZzZfJPGv5DhMRr79rzYzkNpYY+o6fTFjygE02it3z4bfF+uxhvz
         Jrww==
X-Gm-Message-State: AOJu0YwrXCYl7kB9taeNtSJ71JS/Z9MjIuOg8WcCipciEsIkvX+5KUZt
	n41OZX2vkJXpd7U6UDSwJq5sxRV36xgbNWDJ81x3ryf6/o3PQFa0GKZaFG4+rA==
X-Gm-Gg: ASbGncteZ92jBIeHXnXNNqyi7yob4dM2LVFd/8pyRTVaFR+ot6/EgldvKuweeeSUbKf
	8QsyXVpnw0CG324RHo/drTecHTL0pC5L3nYgODy71JaOXI2hZB9rSMq/LVm9I8nhf4xgY9C6Yio
	eGTIYgW3TnVcLDM+nIhKl6Uh83l6dmi6jTPKzwf2wjBZ18cB0M2RSbhwp5C1YJjr1A1L8lolAuQ
	hbYHmQkbiuN5cFiwPZSYdy9e9QwfCdMXtlmgTfgAUG1n7ORd2QtG73Ly8RGjWAJ7+3yv9i0Pkh+
	1VsH6/LKNSzKBU6T+IA6b4zQzFSxdimtC4nOSrWV+KST04Shol+GFMAHAJxDXcJQmwKqYNhpwa1
	GYOJnithLnT3VrXxTK5bbMTTENnGrzhFEviwOxxc=
X-Google-Smtp-Source: AGHT+IGepfEU08471EnfKnPL3R4lE4fVpKeme/ZShCPHEqCGPjfjqL//ZIj/464VSNfUihp3GYK1sA==
X-Received: by 2002:a05:600c:a40c:b0:46f:b43a:aee1 with SMTP id 5b1f17b1804b1-46fb43aaf16mr55105645e9.38.1760361768479;
        Mon, 13 Oct 2025 06:22:48 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab633badsm132816255e9.3.2025.10.13.06.22.47
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 06:22:48 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2] ref-manual/variables.rst: add note about PSEUDO ignore/include precedence
Date: Mon, 13 Oct 2025 15:22:47 +0200
Message-ID: <20251013132247.3987452-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Oct 2025 13:22:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7693

This commit[1] in pseudo introduced the PSEUDO_INCLUDE_PATHS variable, however
the previous PSEUDO_IGNORE_PATHS variable is still present also. Add a clarifying
note about the order of precedence of the two.

[1]: https://git.yoctoproject.org/pseudo/commit/?id=2c43381180f9cfef4c0a8bb0c1658a86c3fcc876

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 documentation/ref-manual/variables.rst | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1d4ec413ca..591c03028c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7567,7 +7567,9 @@ system and gives an overview of their function and contents.
       by pseudo when monitoring and recording file operations, in order to avoid
       problems with files being written to outside of the pseudo context and
       reduce pseudo's overhead. A path is ignored if it matches any prefix in the list
-      and can include partial directory (or file) names.
+      and can include partial directory (or file) names. In case a path prefix is
+      present in both :term:`PSEUDO_IGNORE_PATHS` and in :term:`PSEUDO_INCLUDE_PATHS`,
+      :term:`PSEUDO_INCLUDE_PATHS` takes precedence.
 
    :term:`PSEUDO_INCLUDE_PATHS`
       A comma-separated (without spaces) list of path prefixes that should be included
@@ -7575,7 +7577,10 @@ system and gives an overview of their function and contents.
       problems with files being written to outside of the pseudo context and
       reduce :ref:`pseudo <overview-manual/concepts:Fakeroot and Pseudo>`'s overhead.
       A path is included if it matches any prefix in the list and can include
-      partial directory (or file) names.
+      partial directory (or file) names. In case a path prefix is present in both
+      :term:`PSEUDO_IGNORE_PATHS` and in :term:`PSEUDO_INCLUDE_PATHS`,
+      :term:`PSEUDO_INCLUDE_PATHS` takes precedence.
+
 
    :term:`PTEST_ENABLED`
       Specifies whether or not :ref:`Package

