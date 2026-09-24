Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891A3C98321
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 17:29:19 +0000 (UTC)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3798.1790270951397177297
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 10:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FLnjRT0e;
 spf=pass (domain: gmail.com, ip: 74.125.226.235, mailfrom: twoerner@gmail.com)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-98531196e6aso35161241.2
        for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 10:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270950; x=1790875750; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FRYlRZ/sVKf9jkcGldiO64rkotBICjDkz35RxCANhvk=;
        b=FLnjRT0er382/B8UMq4AOb3eiUnhcLad1N7uPEUO/oxCCelKaPfEtGAizBIZeJB7XE
         sPnbWXCTBUOA96/Ma1kUVo2as7QwNz+fuYkL6Ar/pxqOTnuhMa00rA5VY4f0f4y9EGRX
         KR19TFeqhGlJuSz1UoTmn1GEguDumueM5xEvXOmHMg6mSqF2PW0yGklVQJCS1//fMoDo
         XFV2G50aUVc+uW/k45RM9PJBVU2I2ho4UQhfOIVms4MmhjbQ7NhwIDuJRZ/L/5qkfZoy
         r327d0uIJrdTgi0c8dfhbp0WWGfekycvHQTWhY19v0Zfg0BrieEHrLWlsmG2aXPliH/a
         EanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270950; x=1790875750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FRYlRZ/sVKf9jkcGldiO64rkotBICjDkz35RxCANhvk=;
        b=nlvrcnUz67OTcMRPdFTiFCnGEkXojIRgivuLIC9qFHbDbcQBlL5eyldtrYwvgxJhIj
         bkDa9UZPTKyeSMOIHZGicneTb3lsKyE5XdB6dTlcbkzhstwk2/rG82X2M5R0xLTyXe8H
         K7AKM4NQoOzXHV1CAq4AdkP5RWBOeqcBKfllSejhTRT2pgjav4tvWxxmZ9ar1BkSKjs5
         aXBcLQW77Oh1qpgy0YMsRWNGmQgK/zt8TWZa16Xts275taD8t7xUPyB63Lqi3fUkhbpy
         aIRIVi81FjPkAZgBygLA9BYpAZKhk4PFqaY/OBQGndeipMepKIofzA3PhiqacWEU9YZ0
         zgmQ==
X-Gm-Message-State: AFuF++lF+VXTx3U95BBquQ5aovSBFlkVaSaPNeQHsBHWVDDCWAA/9Xgx
	BfsPUptt4e0jrI7KnyVpAcvbYdKUtMJ7lhk/QsgQECYEzrfZ1khokVFWMauq6A==
X-Gm-Gg: AYBFou1u9RLLKo9DaMYm+PrtLoRmRof0706A32M4+RdTM2cw85vx6nHgDyHw5xw0raL
	VZuUkNmyr+VHwomvzC8l/t5H6aitiSf+d3yiYtXL7ELa7iaKqiYPPOXe2cLrIce71enKcIsgPZ/
	1+dzNJxnfBxRfYLSrYlAh+jmYQdFnOrMvRsRHqdiJViRcSTSeegOEKRLSbKPDwa1U2F12tzhQQf
	UwOwzIYwU5FmF/F/X0wVDeqKHX5M4zrY5Fn2nzvlg9KiB0PpimmSLkKr0O7L1knWsgGD3bdKA6Q
	ifsgB82QZSmNfuA63NjGgHExMvUZodihAXmFvkMQ6OEHsM8x97Di/lzRmzppx5GAx56hUjW8dpW
	3W5LnI1zRxUnBmVIP9rlr44UBq0I9uWvx4FJQqR3pcxVrCdRIl1UXTxhW8ArQdlbgPHUf/mPPKy
	eHER4/QQvl52oKFfmGzJjs2uuRDCSZkvYO8Q+t4geisnLuUy0Ui/e15j11NPIGuLQH83TavzLqi
	ym3V3YCNCvpp9GV7FqCPOAqjJKhai0l8Tde96hf
X-Received: by 2002:a05:6102:d89:b0:7a1:f7d2:e83c with SMTP id ada2fe7eead31-7af1dadc07fmr1578927137.28.1790270950279;
        Thu, 24 Sep 2026 10:29:10 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98530725838sm1797974241.0.2026.09.24.10.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:29:09 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v3 08/10] ref-manual: put the ARCHIVER_MODE comments on their own lines
Date: Thu, 24 Sep 2026 13:28:51 -0400
Message-ID: <20260924172853.2665062-9-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260924172853.2665062-1-twoerner@gmail.com>
References: <20260924172853.2665062-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 17:29:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10631

BitBake has no inline comments. A "#" after a value is not stripped and
does not end the statement: the parser simply fails to match the line, so
each of these varflag examples would be rejected outright if copied into
a configuration file.

Move each explanation to the line above the setting it describes, which
parses and reads the same.

AI-Generated: codex/claude-opus 5 (xhigh)
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- a blank line separates each comment from the setting above it

changes in v2:
- the srpm varflag is no longer in this block, having been removed
  upstream in d5216e3fd4be
---
 documentation/ref-manual/variables.rst | 27 +++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ce17d713f399..8f6f4e5998d5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -158,13 +158,26 @@ system and gives an overview of their function and contents.
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
+
+         # Uses patched source files. This is the default.
+         ARCHIVER_MODE[src] = "patched"
+
+         # Uses configured source files.
+         ARCHIVER_MODE[src] = "configured"
+
+         # Uses patches between do_unpack and do_patch.
+         ARCHIVER_MODE[diff] = "1"
+
+         # Lists files and directories to exclude from diff.
+         ARCHIVER_MODE[diff-exclude] ?= "<file> <file> ..."
+
+         # Uses environment data.
+         ARCHIVER_MODE[dumpdata] = "1"
+
+         # Uses recipe and include files.
+         ARCHIVER_MODE[recipe] = "1"
 
       For information on how the variable works, see the
       ``meta/classes/archiver.bbclass`` file in :term:`OpenEmbedded-Core
-- 
2.50.0.173.g8b6f19ccfc3a


