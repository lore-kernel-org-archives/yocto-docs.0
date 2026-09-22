Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9755AC982FD
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 02:04:14 +0000 (UTC)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1340.1790042645570970320
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Sep 2026 19:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PyHmxjbq;
 spf=pass (domain: gmail.com, ip: 74.125.230.204, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910c9fe21so142316785a.0
        for <docs@lists.yoctoproject.org>; Mon, 21 Sep 2026 19:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042644; x=1790647444; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=58gicR6s71405GDiQZW1StxmgxvuzDS5ioW+yaA2d1U=;
        b=PyHmxjbqyFCDkp9SjX0Coit0M2HvjBnj8g0XYfVB401b+QY2lsnI2H70QfTxEjo7Dr
         si0VuFoMaTVZUVIti4aw/6AaGXRb1W0jM/zB0C3VhaXx47YSWgs9eDwb5EsKx8VgCKIh
         8dHopdl9OiGyCBUKriDqrtacPUJtQ/W0jcZn9JJhpl0T8hLtvDNxrW6P/AdYwKPKWthr
         BJUt/tF3bZHbSNFEwjLh0m0i7YewOBqgnOQjhbtzS+iZ8mSq70Bzvf3nWX69Xcn2yhtG
         o7+WkQyvRmysETPiwMrJP9PW7chuU4mZmzGeVQL4gIdGM3YQZe1BU+9jmFfS8LbAWcII
         AGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042644; x=1790647444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=58gicR6s71405GDiQZW1StxmgxvuzDS5ioW+yaA2d1U=;
        b=Sf1o9Gk5sMSmQRaNWpQY0hpj8xE11f+/EZ0xdkL94eWzrnLPjPGGH42yfTsZkkvn9H
         h1FLkp4sGMp+mBy2JB3dhpJUMFE924XZFL6oSTSYpVZmCtF/yaUYJNKk5w2HNfZmdptx
         onZjenXhwLpOREFdUtHcaBdOavCYnQ75yZqL+rsKufoomdtzA9OsHNdv+e+Efa821bDT
         I5YqECDxo0GhjJqwiNHXOdoEqrAXGHzh2z+z+ExU8wlepb/h5KedegJ9wVNYL7a5yIhK
         JyLF+kt9cdSbBeO4qxRH0lFee6mVeP7RkcPydveHI4i7rqBN/aAthKlDlPNeMM3a7wCP
         PuCg==
X-Gm-Message-State: AFuF++mTX2xaQj9yTdilaar88aexMMbaLTb+s41xMSFnjjyK9bNU84H8
	7u2OJsjUWpyhmYvHxHHXBO+k5ayDlGmCgppejT3THAA80mpSTaUIHWfp87tLiQ==
X-Gm-Gg: AYBFou2D7S0IuSJUHU99P239ERpnpSJHCrpIOvK48wC5a7LmqUk997Q3ufSnIMr9Ruy
	Es+UY++KBuYcUaxfK3dpBDgit8wWLOFjp5Zi8/iohtts6FbbI7pnOh9dxUF233vzjevqnVCtyel
	wshuL8nXgS30NFzNKp+gmG8JEavG6PN4xmFdIG8wV4SaoLtyg/b8E2k8FMS9wU9oMJllq02M/Gz
	0e0IQLOWhHtj+OmFv/z5oOHkWHFFCh+aQGUyHLAK4qxkbz0Zikm0090G7YzqvK4mE/eS4otD4co
	8kUta2NnGqmc7Mh1Lmr661y5HBgNAW6/LCaCMuYqvuRA/+WUU1cNW1H4/xox//o8egGjj1lFO6r
	7IvmreK+T4K9nQqd+UosAL7MwMXJ5JXYuzpuI5HqFCgpYTpR+UhGoLvrJP/0UurXKykiVMSSL2d
	so2rNoAGYamcZ3guWCBzKg97INUoVvSrW2DxxsISKOwej+f+38edLNdD5Ugy1U51J5LFAYpiSXM
	mDudKMAbt23/MPbIXJN79FvTg7WXbLE+NglCqJA
X-Received: by 2002:a05:620a:404e:b0:939:6e1c:8946 with SMTP id af79cd13be357-93c17ebb6d2mr259072285a.26.1790042644503;
        Mon, 21 Sep 2026 19:04:04 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d253165sm16817185a.46.2026.09.21.19.04.03
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:04:03 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 10/10] dev-manual: indent a list continuation so the code block ends
Date: Mon, 21 Sep 2026 22:03:39 -0400
Message-ID: <20260922020339.481929-11-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260922020339.481929-1-twoerner@gmail.com>
References: <20260922020339.481929-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 02:04:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10569

The second line of the enumerated item is not indented, so the item ends
after its first line and the "::" opens a literal block at the top level.
Everything more indented then belongs to it: the assignment, the paragraph
explaining what packageformat may be, and the note beneath them. They
render as preformatted text inside the code box, and the note loses its
admonition styling.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/dev-manual/packages.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 8cd90b9f25b1..380d806be041 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -561,7 +561,7 @@ to use. In your configuration, you use the
 variable to specify the format:
 
 #. Select the desired package format as follows from your
-:ref:`structure-build-conf-local.conf` or distro :term:`configuration file`::
+   :ref:`structure-build-conf-local.conf` or distro :term:`configuration file`::
 
       PACKAGE_CLASSES ?= "package_packageformat"
 
-- 
2.50.0.173.g8b6f19ccfc3a


