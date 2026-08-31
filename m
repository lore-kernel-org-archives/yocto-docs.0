Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7A7C61DFD
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 02:13:09 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21086.1788142382481999196
 for <docs@lists.yoctoproject.org>;
 Sun, 30 Aug 2026 19:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UHIuq9IZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9390a2c8909so199048085a.0
        for <docs@lists.yoctoproject.org>; Sun, 30 Aug 2026 19:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788142381; x=1788747181; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eLVJHumWniOhh58hQ6f/iMeSwnJjLGue9Ze9GLA2LJU=;
        b=UHIuq9IZP7omANyES3EQcSvJWeQi4KyWHpGHtKCk/0ZbgqCyRQ1/Vl6aJPrz9LVKgX
         JXhs58gX3KjJabLFh/U5+kCmHfXzok3cZNWhELtig3Op84feDX3ZUZxWLwLg/tM691z2
         vdxoJ+CMEsqYdl1T3Iu0vfNXDy0W44Wvtv/ZBgHz43cMls5NdGh4oFFDSuzUPutY0LGh
         ZTn8FNXkGc5hvF51P7kT6Fii3dvMMMHyRlBFebZtkGNaUSgAC5fGB6C8ly6bKZPqniMr
         lj0GZZEBvJtfRjtRdR7gCtYqZouS4/s3mCQ/uQQ06fY5uUvhywvzGn7S9V2xtyz2DvaR
         9uCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788142381; x=1788747181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eLVJHumWniOhh58hQ6f/iMeSwnJjLGue9Ze9GLA2LJU=;
        b=GdVnYQeXALyanoMFZUHYYqgsdud/hleB+1hR+6ZhLwlqd2FViXgIZZojosk80CDONC
         kByn55AQFvVy3ivfJxlxcnNEKvzBE/F/xWN2pC4lI3kB1uZVaKd+tD2qnyfs8I12tZzU
         bCibPVuiuU5v2l+SUWMLo+5IfdFp6NC+EY4ZaDd3yXOMBVkpZ6Ctg/XjrBc+VPlP7Y/s
         8UO9+ig2TGqw/7O/RTSsGuiziy0gw+TxYWrjGamIqahZUq8+YTK+O1SU/FCEpHgce/Tz
         tMrE9KdpvvY0qTefuU0g1Ynqrs3sH2CV17wzP7fKsdsgFxHzeiBvaYTmbV5mMbaL+p6H
         0vEw==
X-Gm-Message-State: AFuF++m1TE7XJbVpBeM23VYSxXfQVrvr9LUcWXIoJJpSaSz4hJ0FCOcn
	CDN0HKPcaQ6337Soohd1c+9Y6HSUXEaG/lA7vhkcPReDaj4NcsMH+8B8aCCKdKdA
X-Gm-Gg: AR+sD130+kV8Wv1Bhp3witcZIm9b1IFVQo/rDLU6hBq6cc0DIOYA+Mvb5bHCg3xXGnQ
	jYxS1gV9UOyOVG3x6ceLTgob0yhpFCSe9FkGpcQ+iJzj1nc+JUbA+/vO64nqKj65Z3mBP7wMDTl
	ZWhy/O/bVMujtJ5ZhNoKl5yZ1vaj7cyBqJS8bP86hWQZuCIHs8kkSzORoNwUi8wZVwSZz+lC4bn
	/Fjo1N22q7cJjCiJcDfoJxJjzqEf6iAJfaHUCyJDX/WFpAw7NHwrL67IDB+VLnxnQvQZ+2yH8KK
	sgRinSXqTsuju5a1WI63Ahtu/2I1nIFb9EjYDAM+ezMM6b5np4Mh67pFowgwlReA+/LcjoLDAvH
	/swVGBUfLnZ+gFUzSN7Wb8WuPV77ZOvPZbDW7i1d/HqwFHLNXGx/gEZZyrvjqr81gLeFtF53x82
	1poGS7vwfsjQYINDCPkhiID+gVwtk07udexVZXebuf8CRXGtS/mta74P2hDoe/u02/YrT8BJ/0+
	Hci/7M9u6R8AryffSXA5eBLUoywcA==
X-Received: by 2002:a05:620a:6cc8:b0:937:372a:b97 with SMTP id af79cd13be357-939428460efmr11621485a.17.1788142381459;
        Sun, 30 Aug 2026 19:13:01 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93918b0f825sm660825185a.40.2026.08.30.19.12.59
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:13:00 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/4] ref-manual: fix a typo in the QB_SMP description
Date: Sun, 30 Aug 2026 22:12:53 -0400
Message-ID: <20260831021255.4064163-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260831021255.4064163-1-twoerner@gmail.com>
References: <20260831021255.4064163-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 02:13:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10408

AI-Generated: codex/claude opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 95454698f969..fd95a9ad4796 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8261,7 +8261,7 @@ system and gives an overview of their function and contents.
    :term:`QB_SMP`
 
       When using ``runqemu``, the :term:`QB_SMP` variable controls
-      amount of CPU cores made availalble inside the QEMU guest, each mapped to
+      amount of CPU cores made available inside the QEMU guest, each mapped to
       a thread on the host.
 
       For example::
-- 
2.50.0.173.g8b6f19ccfc3a


