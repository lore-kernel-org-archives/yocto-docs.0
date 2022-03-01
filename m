Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6588C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 16:36:26 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.10439.1646152585809126525
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 08:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hPajw99m;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id s1so13867063plg.12
        for <docs@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 08:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7VAbX3KZRlBKPlkCqojgJp3G+z04ctrI7N9unmPM+E4=;
        b=hPajw99mcBke7xCq5MQr5FnaOWevd3JjKVk7E5/dXE8opoFqpRCjjoEJzrUuHcWKBY
         uIMZdqhDDtStTBN5ZolQqh/ibl/2SuGOzhMf5L75PvbgKW3jVith+rgWIwoNqf7SEPDj
         KYSTvirE9Jk3+YKownHpZ1MrmLRDKLfiW1AdgcbUNYfGS4Dx/uXT5BMU2AiHkFP19b6+
         6HKQFRdJzgKVKdMikuW7JbT/ZGQV913B3GteyIpMaJQNUbUForfy4wzCQvyBdzIqnpJ1
         sqQi0JTCpfxguBX+29tGe28FcXO9lSNKeFcsdYad3cihXnZHWWzIBCvrWBmiRcYZMD7P
         sihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7VAbX3KZRlBKPlkCqojgJp3G+z04ctrI7N9unmPM+E4=;
        b=yociTNTQbYIeLuj3hTHSFrYvUlwls1QEAYSXl3ngUd4/BxEKMgsnJzEZG9bCAma2ff
         yuZbRmv57aaaGlF00bOx5lggGvkCv4z+LCLtPeUK+CXjXHW3rrbQMNBDAfrCDiNQQqxE
         bvuPfNJKsp72wETtMvglBDPMH+ISdU7UDe9FgWHKJPgZAnWDEWMDJZcbbrHS8pqQS2vz
         tiFmt64I97hJkUC9L8Wp9sRz9CrE8VIBfbD9GlMiZBJnQq50WsBDSPc9S3RYJydc1fu1
         9Fgny/beIiIw6PGKYI9rNGkvIqwIt4pL6dxZXmZheZgB4uSrWjKUAQ485WvMnXyhaLsj
         yH6w==
X-Gm-Message-State: AOAM530eIEGu0AhFfg3MU+j0EJffWrJXHW2SEPLSs+RScOvSYFfLGuQK
	RMx2ckSZ1ydfVdpClPiKL32bDtVWiJI=
X-Google-Smtp-Source: 
 ABdhPJxL8TcpcmB1zqqH4Gdj3kZYH9uJXypXQbjHr8LvJk4YUYXvE9XUQxoN66G+RQ12GBlsbPyhUA==
X-Received: by 2002:a17:903:240a:b0:14e:dad4:5ce4 with SMTP id
 e10-20020a170903240a00b0014edad45ce4mr26243964plo.125.1646152584872;
        Tue, 01 Mar 2022 08:36:24 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:b4e2:b3d2:f012:52ea])
        by smtp.gmail.com with ESMTPSA id
 j11-20020a63230b000000b00372a08b584asm13450461pgj.47.2022.03.01.08.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 08:36:24 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 2/5] docs: ref-manual: remove distutils* from classes
Date: Tue,  1 Mar 2022 08:36:14 -0800
Message-Id: <20220301163617.1543257-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301163617.1543257-1-tim.orling@konsulko.com>
References: <20220301163617.1543257-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Mar 2022 16:36:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2518

The distutils*.bbclasses have been removed from oe-core and moved to
meta-python, so remove them from ref-manual/classes.rst.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 documentation/ref-manual/classes.rst | 29 ----------------------------
 1 file changed, 29 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 949217bf4..0ad437d90 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -503,35 +503,6 @@ Support for other version control systems such as Subversion is limited
 due to BitBake's automatic fetch dependencies (e.g.
 ``subversion-native``).
 
-.. _ref-classes-distutils3:
-
-``distutils3*.bbclass``
-=======================
-
-The ``distutils3*`` classes support recipes for Python version 3.x
-extensions, which are simple. These recipes usually only need to point
-to the source's archive and then inherit the proper class. Building is
-split into three methods depending on which method the module authors
-used.
-
--  Extensions that use an Autotools-based build system require Autotools
-   and ``distutils``-based classes in their recipes.
-
--  Extensions that use ``distutils``-based build systems require the
-   ``distutils`` class in their recipes.
-
-   .. note::
-
-      ``distutils`` has been deprecated in Python 3.10 and will be removed
-      in Python 3.12. For this reason the ``distutils3*`` classes are now
-      deprecated and will be removed from core in the near future. Instead,
-      use the ``setuptools3*`` classes.
-
-
--  Extensions that use build systems based on ``setuptools3`` require
-   the :ref:`setuptools3 <ref-classes-setuptools3>` class in their
-   recipes.
-
 .. _ref-classes-externalsrc:
 
 ``externalsrc.bbclass``
-- 
2.30.2


