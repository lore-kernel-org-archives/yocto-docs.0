Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4139AE7E64A
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 16:01:05 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.23190.1695744058694932563
 for <docs@lists.yoctoproject.org>;
 Tue, 26 Sep 2023 09:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K9RoXqaT;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1dcfb2a3282so3039340fac.2
        for <docs@lists.yoctoproject.org>; Tue, 26 Sep 2023 09:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695744057; x=1696348857; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Le0vGFU27KZ561la/WL43oxFQxXJxFgq4Rp6R3Y9p6I=;
        b=K9RoXqaTJ8O0qcoAGJ8FjpTXbvSUDcy0mgnhHBWl4AdRoph6JZclcyFfqGP07FNqnX
         Jt88nYlz5W2xW0Y7tx/4lZjeMqmIOHO45LnO1FMET4oT0nfn4P1y5M2QKarGl7WZlsYQ
         yudQZFuEjD6KqbntkuhzkeOItqRBo9pgIfFQS+4dbj/S/jgE0COE4SEJcZugZEQ69RUr
         d+DKv5UH39/oWpZkRpD3xc23gKOsIfDJAwAUtAW5AntxViVkGwKvOrobkQJDoCQdpbJQ
         fWUyW3AG6CJMSB/G3h2LThM2lTsFwtdxUBh4sLWqM+3iNcdvtdyRQUYqP1FucQeajyVe
         6+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695744057; x=1696348857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Le0vGFU27KZ561la/WL43oxFQxXJxFgq4Rp6R3Y9p6I=;
        b=KHFDPsT2qLJxfYFVbqufHNTeHCdDR9I+dZZKtX2Yxhpe9X60wzTRWpNjVfZp9pj560
         KMmr/f6N+klZVlfWWpQo+v3gpqtC9fPsr0dM3gIYbF58HU4UIEVnOvC0EgOtQ6XE/gfO
         IONTWtfVltzJPK/gqW4OBUQMuCACTKh+MfOlLtGB7oOM1YFlw1aOP40lxrrss788MdJH
         ufit1UM8WGeo6KfAL8sZ2giIXpwzFoVMCj5fubA922ypSmeoVXFvoGveOHpCRFZYy6a6
         MsQA+Zp30AhhKBcS/IXjbw44dnu6FCPd0jkO7/AOWP3MldMEhP0lfkeVhSa7s7r5TjRw
         8G8w==
X-Gm-Message-State: AOJu0Yz0LfMXbRM2sjFWlksiE/Qu7ksVkEx//WO1wmUJRLkh4Jjm6ZDl
	1Qh5YCBvLeWq7RLolQjVYNqwWMkyKK4=
X-Google-Smtp-Source: AGHT+IGRF8v26s68Q4sYS4lW1/52+9G7qhqzmcu617ejTu8mWrYCcYrfjHF1ZSFVqTbZY/NsHP+86A==
X-Received: by 2002:a05:6870:a981:b0:1b7:4655:2ac9 with SMTP id ep1-20020a056870a98100b001b746552ac9mr13028549oab.6.1695744057211;
        Tue, 26 Sep 2023 09:00:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::fc13])
        by smtp.gmail.com with ESMTPSA id zb7-20020a05687126c700b001c50fb56845sm2747657oab.16.2023.09.26.09.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 09:00:56 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: docs@lists.yoctoproject.org
Cc: richard.purdie@linuxfoundation.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [docs][RFC] overview: Add note about non-reproducibility side effects
Date: Tue, 26 Sep 2023 10:00:49 -0600
Message-Id: <20230926160049.1537656-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 Sep 2023 16:01:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4299

Adds an additional note about some of the side effects that can occur if
recipes are not reproducible and hash equivalence is enabled.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 documentation/overview-manual/concepts.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index af825a98c..0c2f148c8 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1963,6 +1963,14 @@ task output from the Shared State cache.
    the stability of the task's output hash. Therefore, the effectiveness
    of Hash Equivalence strongly depends on it.
 
+   Recipes that are not reproducible may have undesired behavior if hash
+   equivalence is enabled, since the non-reproducible diverging output maybe be
+   remapped to an older sstate object in the cache by the server. If a recipe
+   is non-reprodible in trivial ways, such as different timestamps this is
+   likely not a problem. However recipes that have more dramatic changes (such
+   as completely different file names) will likely outright fail since the
+   downstream sstate objects not actually equivalent to what was just built.
+
 This applies to multiple scenarios:
 
 -  A "trivial" change to a recipe that doesn't impact its generated output,
-- 
2.34.1


