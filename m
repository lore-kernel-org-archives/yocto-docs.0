Return-Path: <bijak.dawid@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FD9CD3447
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 10:44:14 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9805.1778323450838344576
 for <docs@lists.yoctoproject.org>;
 Sat, 09 May 2026 03:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aivqa6uV;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: bijak.dawid@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so25038825e9.0
        for <docs@lists.yoctoproject.org>; Sat, 09 May 2026 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778323449; x=1778928249; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ei4+RvsXLWf6gFAPT9tu8Ww+AIZFSgxkmkl7zyQX4q4=;
        b=aivqa6uV6mTMAF6abhML+idmWoKfGvaNTgy2+orizDjqsUgMJokwFXylqgNV02gIXT
         nq+7nIzGe7nj4+JxrWFPMg6l/LYVYPF7SXcFCPUK1Q1i4hEFy8W8DKVtPhB4RgKupxb2
         5X6AVQZ5EXJzdompGYDOxrgjm8a/ao8SWlTsEj7jR6wuuusXKxFkEBBwCOU2/QdkLB4R
         c7COc8rJr4jRTERh5yZ9wynxrT6whVQqfpiX87/Uu0Czu/rMNkNO991dCDPCNYSRMkcn
         bUW39dC79qRA6IV562n7yKymDWmQ4D7qNnDvdpquGTJaOqGM21zOodgBNjePvcKj9LC9
         oWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778323449; x=1778928249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ei4+RvsXLWf6gFAPT9tu8Ww+AIZFSgxkmkl7zyQX4q4=;
        b=T6IQI4EH08a6LnJmwhON9bp9R1LwFam911Obu3/u+xmtiSDhoMDnnEInrgXW3f0z+o
         UeuhvG1apBwOMcHR2pUKm3gmnf8bZHJG31r3eC8kP8NF21/4fqP78iAKr3l81Eyi+EvT
         Cm2EBONZW7pWxRZ8B5D9WG1a8Ua7rM5QQbVOQ1IxtX2FfXPpBeA9XRwbLqhm4dtcKSLL
         fjomDSOgTvlv96k2+mAY4D194i55SuDjvkPFRTdU9L2FYd0kUb6GdVIm1Pv/t2WouibU
         4dSFRVr03lcD+GwIYlwoL+EURr9RH1Ea4M82bc76Dls+1nG/zJMNWaqbAVb+yCPNrqbn
         bHgg==
X-Gm-Message-State: AOJu0YwCetPEascVt0H2uPH9e6NSvKGfYRgvaDz8RadCdkxmTEaWJxDi
	LUkEUyn/X0NlkXlq5DeCIK+0h83El9lsnBPTBros38zHRq4s3+kJgHrY
X-Gm-Gg: Acq92OH+GSKdWW3idm+BvwctSIb/EfsjHDFdgG1sC+5jzB9Ov3VwiTYVAfR4KEgJDdf
	jDRzRnEfvFGNpxpgx/4Tsmbu2/45tu/7wSggyOHJQ+rO3+yo3P6Fid+NK5SLZA8fTptwacSSXo+
	f6y4uizMeyxTA9lcvK4hsdeHr97i9aaJxxIfUiB1FyGpfdFSXU7poafp2lABJKTSr7LJPXIcS8c
	mm4OB3BomzbK7HAXWnhuTkXi1lSs1+axyPwmPLDTa0aLo8+gyVGtdgQ7ABGSgVSnS27hiykBDb6
	06j+GFHmtSHy4njH989ncp0LYln5z6Mt6bg7ZqCMxplc6QPzMLOZ30LNwq4JZc5K6g3z36dkZ44
	pDC1Vq3+Aiveo/KeWC368M4SrIH/OvwfBtYvO9UJh6XUdxhV/0vo67wnU6MXv/u4eV29FNcbDjA
	Fi/i05e1250AnpwAxlTtc0yk9J/WNq6MMR7AQJihRoh8nDAQ89QkkGHwsk9JEz1VHprWL3i7HBB
	mkMup3pDw8vPEJy3o4u9H6n6Ez+7LCIyGiEHg3WhQn0rvWixgZuCGcDCjYzc8Sl8A==
X-Received: by 2002:a05:600c:630c:b0:48e:6275:27e1 with SMTP id 5b1f17b1804b1-48e6275282fmr141690905e9.26.1778323449176;
        Sat, 09 May 2026 03:44:09 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8070:d188:380:b100:f430:86bd:b50])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e6d895781sm38837255e9.0.2026.05.09.03.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 03:44:08 -0700 (PDT)
From: Dawid Bijak <bijak.dawid@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	quentin.schulz@cherry.de,
	richard.purdie@linuxfoundation.org,
	Dawid Bijak <bijak.dawid@gmail.com>
Subject: [PATCH v3 3/3] doc: bitbake-user-manual-metadata: explain inherit_defer example
Date: Sat,  9 May 2026 12:43:07 +0200
Message-ID: <20260509104307.26698-4-bijak.dawid@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260509104307.26698-1-bijak.dawid@gmail.com>
References: <20260509104307.26698-1-bijak.dawid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 09 May 2026 10:44:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9425

Add a short paragraph describing how the inherit_defer makes use of override
syntax to achieve conditional inheritance, and rename VARNAME to
VARIABLE to assure consistent naming throughout the documentation.

Signed-off-by: Dawid Bijak <bijak.dawid@gmail.com>
---
 doc/bitbake-user-manual/bitbake-user-manual-metadata.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
index 52a9e7fa7..59216f69a 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
@@ -827,7 +827,7 @@ the variable after the line is parsed will take effect. With the :ref:`inherit
 
 Here is an example::
 
-   inherit_defer ${VARNAME}
+   inherit_defer ${VARIABLE}
 
 One way to achieve a conditional inherit in this case is to use
 overrides::
@@ -835,6 +835,11 @@ overrides::
    VARIABLE = ""
    VARIABLE:someoverride = "myclass"
 
+:ref:`inherit_defer <ref-bitbake-user-manual-metadata-inherit-defer>`
+defers the evaluation of ``${VARIABLE}`` until the end of
+parsing. Assuming ``someoverride`` is in :term:`OVERRIDES`, ``${VARIABLE}``
+expands to ``myclass``, which is then inherited.
+
 Alternatively, you could use an inline Python expression in the
 following form::
 
-- 
2.48.1


