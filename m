Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C7FC61DE2
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 02:13:09 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21089.1788142385444800631
 for <docs@lists.yoctoproject.org>;
 Sun, 30 Aug 2026 19:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dUyLNBhU;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-9377f717879so166426585a.1
        for <docs@lists.yoctoproject.org>; Sun, 30 Aug 2026 19:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788142384; x=1788747184; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kxp+PdENhpQR3FYQR7dzyZNTRNUKooc4/Q/UTYOvQn8=;
        b=dUyLNBhUIeBsjK+Z1vHhMbDRFVMiIFF9IO3ibrQWk2X7Xpv+XiKLmSKyoRhzDyL5wy
         v+BHRg77IqWms1SiHOBjIRgNlvcc9Y53O7EMBkcTdGQjELhYUbHOUmD4ZkuJMci3L48c
         wsz/1dobIvwlsO7DMeFlFYRDLmRktknEn3drgKLLGdGdX01c0lMm0+VOKL+e9YBgH5Wj
         dHm/GVJI0OEg2yRMW/HX0j8Gk4ctVu7HAiJWBTaP0B0cTxmK3WzYE9s2PMWPFfu8ONQM
         GrYWr6Obw1IUB6e9dLJ4/VZD+d5AsazkAlzHeZTI70o+J0u/eoa+VWjqViKhNOeDlxzy
         ioFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788142384; x=1788747184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Kxp+PdENhpQR3FYQR7dzyZNTRNUKooc4/Q/UTYOvQn8=;
        b=e7W9vmii011vdCLVk5ekhaRKdV+vKqp+NPxG7703QpzoIEKNHiwVsjTFNqIhDoeZDK
         xiZ3rmfcnPeauqxTlxZxwaEZFnLQD6zxxaynckRK440hkyUPsn5LoWWnNULRb6wFzQYN
         Jy3lAkLmeegdwtK7fylsp2jtsumJlPkH9oRvejxrMCTwV+gYbdn0McLG56LPO2irRBt+
         zJT0A310nX8AOa0mhNGwtAErEDhQ5tQgmGPKG/ZzrzNwgiZK6p6XLwMXCIPmkLtR4OjU
         QomTAZk/Ng7vcNkcXsgWeE48XrlPG0sZ6vIDIAOBCldh/GjS9vcM7z835TsY8OrCeRuQ
         lRug==
X-Gm-Message-State: AFuF++lRMxAGk9u6HeYa9xYjBJrSHJUtZDO6tQBSaNztCV5215ebZLQY
	V1qc1A2Dl4AYwCvYY+cDp4rIhlcZ04NZvX3p9x2lBPfpy7pfjloUvsqxD8ARRMBo
X-Gm-Gg: AR+sD135YKNiWwla3lCe8V3HHSEXS8pT5kLVC2euHu7rIT4QVmVWD6g67nFga2ReSLl
	KFlL2Dq85tfbN2pc3k2FjKZzNYGpY6MFEf0Lkp3mMnK06LeDs0mKV/iBEnL0R79TDljPKgXYprR
	UZGJ/qtnLaH81BSE3nSQYijRec16SiPR0pYaxpHk7u8lfzEnIAagFkNv+b/xSuc5Gs98oot51Am
	Vq/LgM2uMBK7TQy6pcICDJ/cqJi6pwujMWACTn8zMW2KW+UT665UFdyaWXlyyZvxDZGFOFcs/D9
	W3pmIPbf5AhQDCjM0NiXvPiJvGGfw6aHuDvkmNGZeAtpwvQl72s6hIzjLhQr3FtGFAT8OUhBIRV
	Q+2i3xxC5fwSSKvWJERS8N5XQ6l5YEAsk6lzgynq1iV1R5q61a/DwIVms7NjUvtkSA+11lvUesR
	D5E5VFcbjj9FzzUtbTjYjUziOqdR+LAeJ3wemmnIdGwrz+ZlTsAOguAKibY+u6KRR1tjKrrd1NK
	FKLqyIEdR8GG6amhW+FwEQz8AeawA==
X-Received: by 2002:a05:620a:4b41:b0:937:6832:1f04 with SMTP id af79cd13be357-93913958bffmr1972356385a.34.1788142384374;
        Sun, 30 Aug 2026 19:13:04 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93918b0f825sm660825185a.40.2026.08.30.19.13.02
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:13:03 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 4/4] toaster-manual: spell the json code-block language in lower case
Date: Sun, 30 Aug 2026 22:12:55 -0400
Message-ID: <20260831021255.4064163-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260831021255.4064163-1-twoerner@gmail.com>
References: <20260831021255.4064163-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 02:13:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10410

Pygments resolves either spelling, so nothing renders differently. Every
other block in the documentation uses the lower-case form.

AI-Generated: codex/claude opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/toaster-manual/reference.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/toaster-manual/reference.rst b/documentation/toaster-manual/reference.rst
index 3050b5d0f55c..bc065a446a1c 100644
--- a/documentation/toaster-manual/reference.rst
+++ b/documentation/toaster-manual/reference.rst
@@ -408,7 +408,7 @@ itemizes all builds in progress. This file includes the time in seconds since
 each respective build started as well as the progress of the cloning, parsing,
 and task execution. Here is sample output for a build in progress:
 
-.. code-block:: JSON
+.. code-block:: json
 
    {"count": 1,
     "building": [
@@ -442,7 +442,7 @@ Be sure to provide values for host and port. The output is a JSON file that
 itemizes all complete builds, and includes build summary information. Here
 is sample output for a completed build:
 
-.. code-block:: JSON
+.. code-block:: json
 
    {"count": 1,
     "builds": [
@@ -481,7 +481,7 @@ The output is a JSON file that itemizes the specific build and includes
 build summary information. Here is sample output for a specific
 build:
 
-.. code-block:: JSON
+.. code-block:: json
 
    {"build":
       {"distro": "poky",
-- 
2.50.0.173.g8b6f19ccfc3a


