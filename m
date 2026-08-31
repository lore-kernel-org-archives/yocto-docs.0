Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E442C61DE4
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 02:12:39 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21078.1788142355184545547
 for <docs@lists.yoctoproject.org>;
 Sun, 30 Aug 2026 19:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mhywMeFc;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90ccbed6edcso37284086d6.0
        for <docs@lists.yoctoproject.org>; Sun, 30 Aug 2026 19:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788142354; x=1788747154; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EvkX6pAN78HXVqLNw5QsVVCER8Wim0MykhfoUK/Xgaw=;
        b=mhywMeFcd8mzk18KDoKB0q0/0aa3wNhYxNtuBa75WR8SCZ2GBBh6FORfgBhFIMwvzV
         tZ2paU+hapNkNbdk87nsrB4mvqiIAm0FdEIS3OoN6eY610wiqdkD49XUxBcBTCB+UyRl
         c5RTt5IjplZq+eUcRBGx58ky1RC+NxsUjwMhFD3mVvjP0RhPUkKMppWuqrgpAgjlDl7B
         R6+66nhhqYGFiIwMRZ46bCG+8uc8GsDMClEPcJH7/jnCwP/h48V5qnwbq2Q+MJtnwoCT
         IyEghgmaVUrLwjn9SpVG50UoW9YkbZZ2wYAA0J2YSSdnGu34XvUjjr1dpEDNeDy5DMqJ
         1Vrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788142354; x=1788747154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EvkX6pAN78HXVqLNw5QsVVCER8Wim0MykhfoUK/Xgaw=;
        b=jVw1YNza1grFcvxLrMubYcqL6QlX/grzLObYjBuDkx9dmae6A9smzHN9E6q+slUamz
         j6Q+QxrTQ09M8Q+H4+D5kqW3Tfmb4jJyviozh/A3c6RpgbXPuReRsLn4JjBz/v0TTD3q
         tAD8j6NPp8p5MAy4RA/aiTMsBX7A5I/IzZVL1CEL6Nrj6RUcUgWnm0YhIbep83aonoLp
         dil2pvqPiuIP0CHCbUzzXIMsY4gz6kd6qhkFRzMS6f5UKAWJh+leRKlJM528kEbCf5Rw
         U/Qx7rpZqbM6nVAw5zXfHDp0TFvOk2GitNB3L35RZZ9ZfFRUfY09XMzsUzTjl9GHYW4I
         F8eQ==
X-Gm-Message-State: AFuF++lu4pmvpVWpiprD4KLyiKEDVrRUbpFqITqbQL/MI94TclhxzOdq
	sbkILkDSfDVMb8WvBP6HCmae1rUKDeP4cUEEpGearYA76anGCrzInLUo9bhZdDO4
X-Gm-Gg: AYBFou2Tixo8eyDx2tqcVJ6oRI0OctVUMTOVhp2puIbU9j3YjOuKii5/a/cgoo/awhW
	SZYt6/aF/KeUmnCaZHOFxpQ/yIkY1M6Zizn+t9h1uZwGAxGENWcZuIhlqRmxaVKYbUZU4Q9DrWx
	zhFcBFYlCaU5FN6QLA93IkUZf1t60a6sSceOSAlHnLDCJv4wK1o3XXOqqsDdCvSbtX4yBiQLPgt
	UziHz4TXuNc5kBqnmiAIDq7+pWbb+E1K4rjppCdJHxcTZGFAPe2RPhs4cp3hmQNNFRT+yqMObZJ
	j5Z0mpuidxe4MmGifPFUAk7aQXiypLNufFJejK1xJZhQPNeqmA2CAMwbl5oqG5z6EBCAptYH+VA
	8LJjR32iUyZJN7cZFGRgFs+zkxpKHjhvJu3cEL5opJvD22YEA+Fp1rFKsqXbUM5qSPyj70YI+/W
	mCVEBmxvYkt57tyiIFRdWn0Xd/lHlbGrRU1qkyoEtv6KBbLD6j1ZkzzSzrNiP/mbq+uhXnPa6zw
	ywC2J729GjgqwSQMgwR8/kS9zz7mA==
X-Received: by 2002:a05:6214:588b:b0:90e:7e02:cc42 with SMTP id 6a1803df08f44-90e7e02cef4mr157530996d6.23.1788142353919;
        Sun, 30 Aug 2026 19:12:33 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce444db01sm73848066d6.7.2026.08.30.19.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:12:33 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Cc: bitbake-devel@lists.openembedded.org
Subject: [PATCH] doc: quote the value in the named-checksum example
Date: Sun, 30 Aug 2026 22:12:29 -0400
Message-ID: <20260831021229.4063996-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 02:12:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10406

BitBake requires a quoted value.

AI-Generated: codex/claude opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 doc/bitbake-user-manual/bitbake-user-manual-fetching.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-fetching.rst b/doc/bitbake-user-manual/bitbake-user-manual-fetching.rst
index b96018a4edcf..476672bbb95b 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-fetching.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-fetching.rst
@@ -123,7 +123,7 @@ in the previous example, or you can name the URLs. The following syntax
 shows how you name the URIs::
 
    SRC_URI = "http://example.com/foobar.tar.bz2;name=foo"
-   SRC_URI[foo.md5sum] = 4a8e0f237e961fd7785d19d07fdb994d
+   SRC_URI[foo.md5sum] = "4a8e0f237e961fd7785d19d07fdb994d"
 
 After a file has been downloaded and
 has had its checksum checked, a ".done" stamp is placed in :term:`DL_DIR`.
-- 
2.50.0.173.g8b6f19ccfc3a


