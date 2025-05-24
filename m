Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23738C54ED0
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 01:49:21 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.10.1748051351492056987
 for <docs@lists.yoctoproject.org>;
 Fri, 23 May 2025 18:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K/S5Y05B;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so4651976d6.1
        for <docs@lists.yoctoproject.org>; Fri, 23 May 2025 18:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748051350; x=1748656150; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9GKjP0w3dbkU2x8iLenjxLjqQlh2+mRvauJqOfSahA=;
        b=K/S5Y05BWAAY7E4k7zEOhLUkqLk2wHCElQOCeN2XllLDvtJG2PsJTpyqPD856ZC6Zn
         FwAZZRYeQ9KZb71b0JA0JAFTupdWHXQ1Yxqw2bgWZvEhOYlzvTejy+aJorTBCqh6GrAe
         BeGyw01GluzHeTGAqE0mavCLvANKsNUv/zlfkJXL8WKqRanH84/P8FurXZRnRJV5x2+8
         10vwDaQ/mSGjOqHqV2t4JGnkPfkZdT6d2KQ+ju1NY0L+ORZ0/V1P2O9XLJoZHhx4dD7U
         ou2aNSKsVTuZNzbVDZkC9zl8ZQBERtYyf3PyuFAJaTa/0Bap7bntNczLw8e8+m04wksR
         vDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748051350; x=1748656150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9GKjP0w3dbkU2x8iLenjxLjqQlh2+mRvauJqOfSahA=;
        b=HUmg2qdu7JeDB2ubVR+yarESmWOWmeZlw2Mac4KT1moRecieJo/Cx+3Ghj1z7Eavuk
         V5bQSICg5QtZLhu2CksahXOk/dnqWUXZh2TQ310yirJ22I6H7/Xu2Em4j+kWvk5mimSA
         sto7vGqKqzsxDzhHCm9LZ5XnWqV1WU7qeWgxZriIbJTfye2fPhVZ+8BTACvGhGtxJMHX
         3HSSDsM4Na9dRma7W0SFgHfkpsTA4k1noy/8hEXGGGl1LpD1y73M7KMZg9sP88QZuMlt
         /FNIqy1J/Sz/cq4xbGbN4u6sgHBsROt9DJrakNk+btLRn+DKCLKtiGxzQsKnXvgYUCsV
         0h1w==
X-Gm-Message-State: AOJu0Yyox83Uq+JWm61biUWzq9aXlMCU6kCsi7snPZPFhCZrvxtvcMWI
	zmnJ9mhssX1lpKhWmmd36mY6OadzdPx/RHjJEtVyxjRQ3siEFcYtIQr53mhPAw==
X-Gm-Gg: ASbGncuAv2uxTuqzY6TVu1dOSTsHnzfcWffqsqJ+5iP8FxqZzCUBhpqQ5F+8dVyCdgZ
	w4C9oLExuIZ46M9J3TuPcyBEp9ayH0sH1FsN8/jDgN0vnDHnbeDULL0eI/ltNme+DxM94Bb+JPB
	BX8WmmNBqKj+lPzjX7qjkljiczFqlQfH4bid8gE4FLZJb0mVItsRTbUce1y2fFqb/8spweFOWM+
	148PP0s7yOho+qmZI7Ig0b1UYrJMTunCUzlx2BDqqchTL7IyTNpul6YCMq5pUweMlXll73vAi+d
	A4sksG8Jg/sk7lqpndbRmDvQ2G2ssRfqYNbsoc5GYuKSbG5KTle0z09HthIi5fGCCHaWo5fbBKy
	wIHDXGq6AigO5z3ijTz8=
X-Google-Smtp-Source: AGHT+IH749z8qEeiUvGE4F3zFih3/STS2ISI4bYGoz4VyptpWMa0Tl7luebtERmgAHwMuIk2BLs9PA==
X-Received: by 2002:a05:6214:124b:b0:6f5:3f0a:7d22 with SMTP id 6a1803df08f44-6fa9d2c2b33mr28289436d6.37.1748051349828;
        Fri, 23 May 2025 18:49:09 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b0899016sm122736276d6.30.2025.05.23.18.49.08
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 18:49:09 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/2] sphinx-lint: superfluous backtick in front of role
Date: Fri, 23 May 2025 21:49:01 -0400
Message-ID: <20250524014902.35467-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 24 May 2025 01:49:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6896

Fix all instances of backtick-before-role as reported by 'make sphinx-lint'.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/dev-manual/sbom.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual/sbom.rst
index eba07b783272..e6806ce92997 100644
--- a/documentation/dev-manual/sbom.rst
+++ b/documentation/dev-manual/sbom.rst
@@ -25,14 +25,14 @@ users can read in standardized format.
 assessments, as all the components used in the Software Supply Chain are listed.
 
 The OpenEmbedded build system doesn't generate such information by default,
-though the `:term:`Poky` reference distribution has it enabled out of the box.
+though the :term:`Poky` reference distribution has it enabled out of the box.
 
 To enable it, inherit the :ref:`ref-classes-create-spdx` class from a
 configuration file::
 
    INHERIT += "create-spdx"
 
-In the `:term:`Poky` reference distribution, :term:`SPDX` generation does
+In the :term:`Poky` reference distribution, :term:`SPDX` generation does
 consume some build time resources and thus if needed it can be disabled from a
 :term:`configuration file`::
 
-- 
2.44.0.501.g19981daefd7c


