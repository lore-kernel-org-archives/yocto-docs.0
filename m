Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35467C982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 18:33:17 +0000 (UTC)
Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2915.1790101989058513376
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 11:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WkmtHqxa;
 spf=pass (domain: gmail.com, ip: 74.125.230.205, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb767cc97so2109201cf.3
        for <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 11:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790101988; x=1790706788; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j8VAUAej5Hj4aEqOgyOtBfD58EXW9YDMegZR7opcSqQ=;
        b=WkmtHqxaOyYaH5Ww1VmyNyYj4QTsLDl/khsiCcgIg/tSQLV6jqrZGSU9szGC1MmBho
         3VzL3lGmG75ex6aXKR+7V6jxwLKR0DcUQDJ5M9qqZWRHn+6Q+y4rcf/ZUl51zgHvhSk9
         iVQ2/Mg6wNYKiW2RgbG40DH6hGiCBzUySwET+nKl4NlVR/ASHLJ6GxNGrvgRFJa60wPk
         dsz9XOwuQlQqCzCSqg8Oa+q6cXlII6ODEwluiaJyOmtY+GmCHt529N7Hn5abFFHSmULq
         6iH1BF07jcDLxLxdsCCq2rFu8nwsuT1wchQyC9PjU43TG6AltU6alDlyRr3v6lxFzSHL
         IdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101988; x=1790706788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j8VAUAej5Hj4aEqOgyOtBfD58EXW9YDMegZR7opcSqQ=;
        b=Q3p05LNVo9KY0N2frSL1SvGdgKKMQLchS4rIjtrBz4+gipyLTX1tZr+Lwvr1g9eWc7
         MUxO/NzW6LVYsHSgl2MKRjpVPMx7QrpxCUafQHCYgJ/HhZPi8fb77+PvZ2/WitbAgr8O
         sWDuIPo3N4LVybJ//yW+p0FfoaXuQDM7Jgi2ak+BlkzdFw8rAR5JaJiZ+dBxT+DIAUkQ
         egpcF6AvEdLwNKw+PxGVrs+6sRp2t3xHOt9a3xdez/kSndljG2CMsOAQToSPnpkRzDBO
         FaPjCj7I1f++uOC/XszzLZKFffdeD52j8jeIXQ1kcKwC2w3zaRUaL3o6zSRjIDEwF84/
         /x+Q==
X-Gm-Message-State: AFuF++n1E9gcTrY7xBgZmzHzeCfpzxgGwG7jAgVNDVVCWfTtUHUx1Msl
	bFHR3mP/NRjssrUowIRAIcpccjzo0VJMP8LGxam6KgjGxob3EOV/vVtc0W2EQg==
X-Gm-Gg: AYBFou3aBqDTZl+l1EIoP8NBAhWZ7xB1YGAqaKs5Imo9bU/h8yqXpbNhNsGqoRsFPO2
	foSd1GztYim3s1M+9qHdbfEAc81Q4kNGNpqqJzfGAYOKiYrLvDxvNEGn1+ApY6YYzBsv0BJh1AJ
	M5ffAA4sO6kYlmgYphheMQvcHwlsy9gCKm1xXme5xE+RuApM/mIHr+etDbN1eMtbWscowqAEqYC
	BTSqjUMgpNvYCaZ8IwcRAiD2XK4d1htZx+GlPGLFBnkc6vMtK0zzOAA7a2eenhYgLnEqQV+V6ys
	QygHEF0KOLWPjsSyp0FZBDV9vSaOJX2QqhO2i6djTLaxhroX9MGsIZz2imHIgJDnCsU42bmvORV
	b38drGMgA1Os9UroSfkiBWgZ6c+BbUmcv20ejNWuW2hI7K3eS43uVxPmSbFO6GCyDk7VzGaICN7
	HXXT2obwYvX8tqvllHLH/1Rcz3k1+mPn8F1EVNm/tB1sc5PLS0totSTFSKEpLnxeIMycKgEgQk1
	yUH243FUmriDLZ7Dv9ZipM8/yj+SIqDUgCpxZ6L
X-Received: by 2002:a05:622a:4c15:b0:532:d36c:7096 with SMTP id d75a77b69052e-532ead8904emr6113811cf.56.1790101987968;
        Tue, 22 Sep 2026 11:33:07 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3396f6sm3112821cf.19.2026.09.22.11.33.06
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:33:07 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 8/8] ref-manual: put the ARCHIVER_MODE comments on their own lines
Date: Tue, 22 Sep 2026 14:32:49 -0400
Message-ID: <20260922183249.2433345-9-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260922183249.2433345-1-twoerner@gmail.com>
References: <20260922183249.2433345-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 18:33:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10597

BitBake has no inline comments. A "#" after a value is not stripped and
does not end the statement: the parser simply fails to match the line, so
each of these varflag examples would be rejected outright if copied into
a configuration file.

Move each explanation to the line above the setting it describes, which
parses and reads the same.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v2:
- the srpm varflag is no longer in this block, having been removed
  upstream in d5216e3fd4be
---
 documentation/ref-manual/variables.rst | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8a9bd9075843..0d7069433bf2 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -158,13 +158,20 @@ system and gives an overview of their function and contents.
       original source, configured source, and so forth by employing the
       following variable flags (varflags)::
 
-         ARCHIVER_MODE[src] = "original"                   # Uses original (unpacked) source files.
-         ARCHIVER_MODE[src] = "patched"                    # Uses patched source files. This is the default.
-         ARCHIVER_MODE[src] = "configured"                 # Uses configured source files.
-         ARCHIVER_MODE[diff] = "1"                         # Uses patches between do_unpack and do_patch.
-         ARCHIVER_MODE[diff-exclude] ?= "<file> <file> ..."    # Lists files and directories to exclude from diff.
-         ARCHIVER_MODE[dumpdata] = "1"                     # Uses environment data.
-         ARCHIVER_MODE[recipe] = "1"                       # Uses recipe and include files.
+         # Uses original (unpacked) source files.
+         ARCHIVER_MODE[src] = "original"
+         # Uses patched source files. This is the default.
+         ARCHIVER_MODE[src] = "patched"
+         # Uses configured source files.
+         ARCHIVER_MODE[src] = "configured"
+         # Uses patches between do_unpack and do_patch.
+         ARCHIVER_MODE[diff] = "1"
+         # Lists files and directories to exclude from diff.
+         ARCHIVER_MODE[diff-exclude] ?= "<file> <file> ..."
+         # Uses environment data.
+         ARCHIVER_MODE[dumpdata] = "1"
+         # Uses recipe and include files.
+         ARCHIVER_MODE[recipe] = "1"
 
       For information on how the variable works, see the
       ``meta/classes/archiver.bbclass`` file in :term:`OpenEmbedded-Core
-- 
2.50.0.173.g8b6f19ccfc3a


