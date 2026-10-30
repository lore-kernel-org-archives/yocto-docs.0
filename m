Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14305.1793374393241247868
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2026 08:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f8RfV6+A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso4192915e9.1
        for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2026 08:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793374391; x=1793979191; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p2pUtm+bqi1TfyEzfsiee+2UFJPVNt71VUgSMZCJNwQ=;
        b=f8RfV6+AhgW1e6orGg5oxHOr4AcBpS4sRjS5Q5B38Z3y2m/75iQINQScGcWhPvgA0B
         9FqKm6nZVLtByq357egJk9Q/I4Rejl6YYeCulrlF6t82RP2l1tkgUNe3gi3eu7hTnu6S
         og9zKZCmw4/JX9a5b+MHnQ2W5FGxWeYdACN58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374391; x=1793979191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p2pUtm+bqi1TfyEzfsiee+2UFJPVNt71VUgSMZCJNwQ=;
        b=L8VjfqHJDHFKzo3IEuDR/Nx/4UxZHl2Nz0gNypUSD3tcG3EtsMbktDlfWm8UPkLEPO
         oJhbgwlvUFDZT/5/CS8RgDCBgDcS8SUOSNanyaQ6ejSmM0AclajZHtY6eNIMh+hqvrKV
         Bq/5aNMYRUxvk2mim7oTTOeWC6rLN+XkFwKhZIrY2mNwIJZpSAV2hutyeXF+jAzowRxN
         t3yKjkALbX25zJP05dCynBSU/cwB8lsXdJGPg+q8Xl0socrGevLzuA66/ms5G+k75244
         F1YK8mRNVzgCeNb16jEHE9615ouwQy8JD2znDx6ZErgZwuQra3KCJ959N55RGjjrpa51
         m5lw==
X-Gm-Message-State: AFq9FYIyOfUKFpG++9bWwxiRQBpzyrA49n4X5PGyYKYS5e1TmEOGgzuT
	ft+nFvbkSMBJiEqL8BfCBHzuzclfz5pdw+CojsqO6vl0z49x1r7HZvF3qdCX7KX3g64RpOPm9Oz
	4OIVwpEE=
X-Gm-Gg: AYBFou1dJHyYazhbZVRnkKvYrGVVzD8OkGGtVExWa+9WFDoibNwN08oqyoZzLvWTkvH
	WUnhaqhJqdR6qihyUueIf1K8vogeNKYJ/nuNXRcRIgJCAtKfwrD/x3BsusjKjcf8/tHdSw6KHfu
	Vg7CQpRn9laIY2+koW1hXEZxFBDUWjKPfeKemFKyXea+82Mbo7pJKMnWFmk1LlyvzZM9XSNK/HS
	aqwaU4dt2uOQri2oqqkEhu+4KtOAWrIrHDOBfMIMq0QfcO3F+HlGo/Wqd2VFquHlFgR+X5Ogyr8
	z5as+q5s84jtSodNWGeeywWMYBjBbFm5g/4s5SfVdpAiVttPl0+5JxBVm2Genk4eJ6pelJo0zei
	oHV4re2xvEMDNb4OnYLud6RpEPG1Aws/JhW6S0MlfSmjU97vJgIbTl/yJU0lCd6MnL34ybfMh+j
	Vs1rpRCDUHLu/pqxAordBBPbdMv6tvK/cbzr9CtcgcF5qzpgJ+1REc08giG7m8ZHTrRLd/BAthY
	ahOJ4LGO0UDHKB9YnjXL95Y7tEYDPfPbrlVfiUIauGx6APqaNDby81YGwO0UUR6VnlfOjXLs1rN
	Rm6BIRyINjwdNpIHsnFLNPIxYCZZKSU1xMFKdNpVDIo4CysTB09md3BBPg==
X-Received: by 2002:a05:600c:3554:b0:4a1:f7f4:7cf2 with SMTP id 5b1f17b1804b1-4ac1737c474mr59311335e9.17.1793374391033;
        Fri, 30 Oct 2026 08:33:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:50a1:2666:faf3:9570])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf7146621sm70020035e9.13.2026.10.30.08.33.09
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:33:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] ref-manual/faq: Add entry about emails on patch merging
Date: Fri, 30 Oct 2026 15:33:08 +0000
Message-ID: <20261030153308.3269691-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2026 15:33:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10746
Content-Type: text/plain; charset="utf-8"

Document why we don't currently send emails when patches merge in the FAQ.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/ref-manual/faq.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 3646286a6..6b1707733 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -88,6 +88,25 @@ Our automated testing includes it through the ``poky-altcfg`` :term:`DISTRO` and
 we don't really need it to be the default: it is tested, it works, and people
 can choose to use it.
 
+Why don't I get an email when my patch merges?
+----------------------------------------------
+
+The project hasn't felt it necessary to reply on the mailing list for each patch
+that merges for two main reasons. Firstly, it would generate a lot of email
+traffic with content that may only be useful to a small number of people and quite
+annoying for other uninterested people to filter through. That could be avoided be
+emails direct to the submitter.
+
+Secondly, sending such emails accurately, takes time and it wasn't felt to be the
+best use of limited maintainewr time. We do track patch status to some level
+in patchwork and there is automated tooling which could extend on top of that but
+it hasn't been possible to fit that into the projects workflows with enough accuracy
+at this time.
+
+It is very easy to check whether a patch has merged by looking at the repository, or
+pulling and rebasing.
+
+
 Building environment
 ====================
 
