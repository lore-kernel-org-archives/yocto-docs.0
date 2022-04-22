Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E119C48BD2
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.7522.1650627967076473852
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 04:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EJN9rFaY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 l3-20020a05600c1d0300b0038ff89c938bso4977332wms.0
        for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 04:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/tzBVcba/gid/VENb4PSnVB8gyqBXtvps9zzH7ZlNCY=;
        b=EJN9rFaY33KwqGZgcKT5Ckbys5fCaMJcGjvq91vDgqjVz5ArEDphxwZzVy4O8Q7bfy
         77TTtO6rTcLca6eq2UwnumIi+SF167To8Q8oVCTdz4ed1OAnU2q8kd1lPYeJ3N+XEIgF
         WY+NkQAXCCv3i+ukDJPLYr/puknVoalHTSLT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/tzBVcba/gid/VENb4PSnVB8gyqBXtvps9zzH7ZlNCY=;
        b=Eh6I5bLyOSV/ta8mxazSsCjHdmTasw84ZGqLvarUonsKCS54K7OpZ5ziF2CtnK9OiE
         /64Q5jbYoneYZOYRgCv9gex3yncaZ2zKvMrta8PWvzEWMgnFIT0lwdDlhpxqFkCZjZQm
         Z7+qDOnUc9olJLzMwteFLQqo6dqDmU3GE77Oh/PwY7s+tWpWuKXXjZW6EciQSAx+sAcn
         NCywER2Ebn3N6VlcAydOlHlyKPJ0SfRVgmRiVXRH56MHESnW0VNW+S5ESfFz56DJ3t0e
         AfE/VFUGsJSHJAmoocURwcpe0XxUL0KVqLy1xp9N/JoL8SxRAFAQCUZ6icvEzUkQ+gXY
         Aokg==
X-Gm-Message-State: AOAM531I6j1Xzl5SSYE2JDQS33DpipM++4r2W8uaJQP4ceDEauGfSIfC
	yVQaC1+0nGesTwuyXG3KmtWsGhcdCZvh/w==
X-Google-Smtp-Source: 
 ABdhPJxqIp+39e4zAQ8Kxt6pnSPnxPxUscWZas/qzEx9eUBuZo/j7LGeE9eakiuBV7kfIuf3fE4C+A==
X-Received: by 2002:a05:600c:5c9:b0:38e:d44a:4cc1 with SMTP id
 p9-20020a05600c05c900b0038ed44a4cc1mr12778885wmd.124.1650627965111;
        Fri, 22 Apr 2022 04:46:05 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9788:6d00:bfe8:c84e])
        by smtp.gmail.com with ESMTPSA id
 p3-20020a5d59a3000000b0020a9132d1fbsm1805804wrr.37.2022.04.22.04.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 04:46:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Cc: Paul Eggleton <paul.eggleton@microsoft.com>
Subject: [PATCH 1/2] ref-manual: Add XZ_THREADS and XZ_MEMLIMIT
Date: Fri, 22 Apr 2022 12:46:01 +0100
Message-Id: <20220422114602.2648543-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2841

XZ_THREADS and XZ_MEMLIMIT were introduced in dunfell.

[RP improved an original patch from Paul]
Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/ref-manual/variables.rst | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 164c4900a..0a5f8c98a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8752,4 +8752,23 @@ system and gives an overview of their function and contents.
 
       The default value of :term:`XSERVER`, if not specified in the machine
       configuration, is "xserver-xorg xf86-video-fbdev xf86-input-evdev".
-   
+
+   :term:`XZ_THREADS`
+      Specifies the number of parallel threads that should be used when
+      using xz compression.
+
+      By default this scales with core count, but is never set less than 2
+      to ensure that multi-threaded mode is always used so that the output
+      file contents are deterministic. Builds will work with a value of 1
+      but the output will differ compared to the output from the compression
+      generated when more than one thread is used.
+
+      On systems where many tasks run in parallel, setting a limit to this
+      can be helpful in controlling system resource usage.
+
+    :term:`XZ_MEMLIMIT`
+      Specifies the maximum memory the xz compression should use as a percentage
+      of system memory. If unconstrained the xz compressor can use large amounts of
+      memory and become problematic with parallelism elsewhere in the build.
+      "50%" has been found to be a good value.
+
-- 
2.32.0


