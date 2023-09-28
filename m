Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12644CE7B06
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 18:26:25 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.321.1695925584030527052
 for <docs@lists.yoctoproject.org>;
 Thu, 28 Sep 2023 11:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HSbWUc+w;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3af65455e7fso619315b6e.3
        for <docs@lists.yoctoproject.org>; Thu, 28 Sep 2023 11:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695925582; x=1696530382; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TS/nKfY2/K05wI7NcU2C2QT5fGt/bk2wfkUA9L212kI=;
        b=HSbWUc+wwDD39dRXR6pVEYcItSNM109zypok1TPT4vzJzq0XvGpYYNSmpH47jVIev3
         TSPUKDLIzElMXMUxSgP+lAJoRrYz/0jqnjXL58s0YiWPPg4iDlwcw7e9GTI5txOFxUeQ
         x6ZxcuhbMk7vfjgFln0e+0CNI3EXLqYnTK/6u5RYmKdm17aRBZ1eCKWvNl8wkwgNlk4t
         mHVXVEj4ZL2yp4RtLlQJLKqEO0IQCj6kX8+7du6CxsuCo+/TmvfU+SNXm09/RfQujBey
         5tcNlZk6TLkVPJCYpeMApL9lGihv/lo/enkDkSfiOzMuxEY2UirNcuhhQkciE5MpcvW6
         cVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695925582; x=1696530382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TS/nKfY2/K05wI7NcU2C2QT5fGt/bk2wfkUA9L212kI=;
        b=pQODcJ+AI2kVg5OTyKpTbvELjNhkbCSvfhz3nG5VPdzDG/6t+OmR4Wc4ZNY1c0hcqQ
         Xh6AX2V0MluRpfUEiBMtVc9NKGEaCKVIfx4Xk4BbaKjXxiJ2JaB2kEd+mW79LEqsokM8
         a/H0LK6v0onkzXB6RUSv7h6YJg2FSOoTFE/AlZ1i4M6GejeSbnuPvXNlq6t7l5zl+pGM
         NOc+/QSQ19OAzYgtwnDb0HOGfxr34W9u750nQBFb0dl4Rt9uF6g1Ho50+e//SxMY3r70
         NmPVAtTsmnHUqmDWH3dRGoEURqccK/9A+A7SJzt5Z6gBMQgX4S8o05NsOs6XZOXM+nGL
         crJA==
X-Gm-Message-State: AOJu0Yzo7ryvCN5Ubs7hh4KQf8cWuIi5f0RJJmralz2ky+hFYilgRit5
	kN/TSkI8dCYv2QDXuJcisszThY5RrkE=
X-Google-Smtp-Source: AGHT+IFfwTsOZOzetOfhpU5ZkDagQ1/NYFlBea1qKg+T+1V1ChdQySi88o3etNqPldn3qf0dvRzbdw==
X-Received: by 2002:a05:6808:1c7:b0:3ad:9540:dc0 with SMTP id x7-20020a05680801c700b003ad95400dc0mr1980411oic.4.1695925582641;
        Thu, 28 Sep 2023 11:26:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::f27c])
        by smtp.gmail.com with ESMTPSA id u13-20020a056830118d00b006b9734b9fafsm2737595otq.13.2023.09.28.11.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 11:26:21 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [docs][PATCH v2] overview: Add note about non-reproducibility side effects
Date: Thu, 28 Sep 2023 12:26:16 -0600
Message-Id: <20230928182616.17453-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926160049.1537656-1-JPEWhacker@gmail.com>
References: <20230926160049.1537656-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 28 Sep 2023 18:26:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4302

Adds an additional note about some of the side effects that can occur if
recipes are not reproducible and hash equivalence is enabled.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 documentation/overview-manual/concepts.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index af825a98c..4e3f6425a 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1963,6 +1963,15 @@ task output from the Shared State cache.
    the stability of the task's output hash. Therefore, the effectiveness
    of Hash Equivalence strongly depends on it.
 
+   Recipes that are not reproducible may have undesired behavior if hash
+   equivalence is enabled, since the non-reproducible diverging output maybe be
+   remapped to an older sstate object in the cache by the server. If a recipe
+   is non-reproducible in trivial ways, such as different timestamps, this is
+   likely not a problem. However recipes that have more dramatic changes (such
+   as completely different file names) will likely outright fail since the
+   downstream sstate objects are not actually equivalent to what was just
+   built.
+
 This applies to multiple scenarios:
 
 -  A "trivial" change to a recipe that doesn't impact its generated output,
-- 
2.34.1


