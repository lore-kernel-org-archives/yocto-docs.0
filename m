Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A25C982F1
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 02:04:04 +0000 (UTC)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1337.1790042640851291792
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Sep 2026 19:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lag9Mcar;
 spf=pass (domain: gmail.com, ip: 74.125.230.204, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939eb3249c1so302597885a.2
        for <docs@lists.yoctoproject.org>; Mon, 21 Sep 2026 19:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042640; x=1790647440; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d5Mw9qD9uGGRFBPmA5sLVwmfDZ5Utdp4cNGZgHXpVt8=;
        b=lag9Mcar6I+LBLCGTIRI1yq0j45jLHks21wmE3yar1ruKbOSlakfLrmw+j7pHEd53w
         bXiJxEApNMcWX0NSZWK9b83oikawyDQ1+AArNR6nP6ZxcmC4jjILM2gq9Mu1QKzs2zXF
         eJUtrESmtw//gFXx6MW7WpEKUVtw2glAeFJAn+1EHn5XZw1IzuDNDBCHG1Spx3cJ87Bi
         oVd4vYfkVpywpDlMEEAfABg0PQ79/96GAgT1QjThzJerOozLW3gcM3WgQz7A+EWy4Hw3
         QOs/w0+9roLEb9ELYDqJ3QXSoMphY6jeSZRagvC1tZ0OhAwX8ASRVsWWEmHfU/tJ41WV
         jooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042640; x=1790647440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=d5Mw9qD9uGGRFBPmA5sLVwmfDZ5Utdp4cNGZgHXpVt8=;
        b=NmhlysskE66iPCknIIb5Mflma1waYRr/DZs/HLXCWsuLcir9pVP8Slxz66pb7pNY4t
         ybFWkK05e/2+frCPSSXhoKWhHUPst86Cv6B4WHSepYUqxHYdK9Sv6i0SksjkY70sfmML
         mBtnOT8Eitj+PqYbIldj29SFLv3mncadrx/6lXy6nyugV8HWiDVuFeKJWKd+EA+BmFPB
         k0uOFuh0sz9R68yuS7f/wjNG8q3rKNpgKjEBuN9k1qljUzZ15ebe61iD/hvBOHhrA4tj
         n8fSEQcLDhLkFpqMh3bfZ278DBSiZ+IwbDooP/qHsmFGui3SkNXZNd9wSjTc1GJXandO
         l8yA==
X-Gm-Message-State: AFuF++lYAS+YZfVybnNCurR3Mep/aQk1BvkuFPzAdNqKw5PzLkaDHtA3
	z38moObMS5p5C5T4zeZDu3hRuJMsJUr/+Fbxdj6l8hSWgH7XFaKHDcFkY98gKg==
X-Gm-Gg: AYBFou2meBPtTO5opvy9WUqeJrpB2qYBE2hhCkYhzi2BwoLgtkSljBpDSWkUEZB6YDn
	3YcNVVv9fAA3EOb+3FrYlHCQ+VLCLDq4GYAMp0LM5hYKCE83FfpuV8SSDFICmnP+hMJP8LEjhie
	2aKJcWm+/5GScQNKtFTIeVbZ5SsCH/gYFEgRx1GyWEfv0L5fnoiD3jPtOz22dIVWn8BA/35kJhj
	8mpWepFcVYzVjrvgM6igcHW20kclyiMtBrMDu7Cv+qAdxPoGL7Io+fC5zTIvj47GBD476kThjMC
	xNZo3j/JtW+aLrhDPgkCCcAh8x9Q7/Iq6PwnMcHFxz/IljlCRIaoytwzvIDkRsGnD5H8ZapsaQi
	j+gBFsZA4aP3AKWG34hb+WhDJmI/elQikESnJtubWHU7Bw1V+eszKxau9moP7BL3HRkLscY3wvF
	vv4ybzmBkHiAUigSVj/EOcs2pBDA9iuGL4OV6SE1pgEhpAKDyv1jhLqg/KIJ34F48zROXDqc9W1
	ti5Z1ZeV+o6S4br2tXcAP5Gjl4I4pr1oBpE5Oyi
X-Received: by 2002:a05:620a:2708:b0:939:fbf8:b5c8 with SMTP id af79cd13be357-93c15d763c8mr361037685a.13.1790042639734;
        Mon, 21 Sep 2026 19:03:59 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d253165sm16817185a.46.2026.09.21.19.03.56
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:03:58 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 08/10] ref-manual: put the ARCHIVER_MODE comments on their own lines
Date: Mon, 21 Sep 2026 22:03:37 -0400
Message-ID: <20260922020339.481929-9-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260922020339.481929-1-twoerner@gmail.com>
References: <20260922020339.481929-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 02:04:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10567

BitBake has no inline comments. A "#" after a value is not stripped and
does not end the statement: the parser simply fails to match the line, so
each of these varflag examples would be rejected outright if copied into
a configuration file.

Move each explanation to the line above the setting it describes, which
parses and reads the same.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/ref-manual/variables.rst | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c3722c9e9896..66439ff26e6d 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -158,14 +158,22 @@ system and gives an overview of their function and contents.
       original source, configured source, and so forth by employing the
       following variable flags (varflags)::
 
-         ARCHIVER_MODE[src] = "original"                   # Uses original (unpacked) source files.
-         ARCHIVER_MODE[src] = "patched"                    # Uses patched source files. This is the default.
-         ARCHIVER_MODE[src] = "configured"                 # Uses configured source files.
-         ARCHIVER_MODE[diff] = "1"                         # Uses patches between do_unpack and do_patch.
-         ARCHIVER_MODE[diff-exclude] ?= "<file> <file> ..."    # Lists files and directories to exclude from diff.
-         ARCHIVER_MODE[dumpdata] = "1"                     # Uses environment data.
-         ARCHIVER_MODE[recipe] = "1"                       # Uses recipe and include files.
-         ARCHIVER_MODE[srpm] = "1"                         # Uses RPM package files.
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
+         # Uses RPM package files.
+         ARCHIVER_MODE[srpm] = "1"
 
       For information on how the variable works, see the
       ``meta/classes/archiver.bbclass`` file in :term:`OpenEmbedded-Core
-- 
2.50.0.173.g8b6f19ccfc3a


