Return-Path: <zach@mandolincreek.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7ED5C433F5
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 15:12:33 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.21003.1653577951642240794
 for <docs@lists.yoctoproject.org>;
 Thu, 26 May 2022 08:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aquabyte-ai.20210112.gappssmtp.com header.s=20210112
 header.b=GnAbi7D+;
 spf=none, err=SPF record not found (domain: aquabyte.ai, ip: 209.85.214.170,
 mailfrom: zach@aquabyte.ai)
Received: by mail-pl1-f170.google.com with SMTP id n18so1682703plg.5
        for <docs@lists.yoctoproject.org>;
 Thu, 26 May 2022 08:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aquabyte-ai.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kgfGjnhvZur676d5pa7fdceXMmMbI5rpp0v5U2EgP6E=;
        b=GnAbi7D+3Y34LvV+o8jPRPHTJBAJdoBv00seLMdvtluSElfow7B201zd4gsLUmAvF/
         vROLJdrbdn46tVnoQdwPH449bNH/LJEc3QTUrJ/i21RtyIg543dNn3LO+ucv8ZUJoGRQ
         LTiUd9wr2lrPErMQbuudRf20N70nJ6zNBagai8VSF+eIWKTvd1GIgCFbhDAvP/mc8akN
         xN7WzqPn83mCH1xWae1m3WFOlViqhGDI0f6sXfmRaaAp0NGJ6oN6DsWslpkf2F4AnHvJ
         WwxZ5QQNJdm7QAGL7XnKS8LM1qyAR94WhDJ9l4Be4jkcHjTt8RYgpE0OwCEBlYil23un
         jY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kgfGjnhvZur676d5pa7fdceXMmMbI5rpp0v5U2EgP6E=;
        b=if+GEDVXVJLoSydkFV5uWG6oN0bd0uM7ll9Jo8gbve4VfN6jHYhy8H2DdHL1xAYAxd
         PgI062ObX8isg+jtDU1HlA7S8brE1aa2qcVBuFraCyJsmN5jnquO4tt4mha4zGl4tMTr
         svZxnXEnKVoavbA6KcO0vfWWmQ4HP9dcysna8rhoSDrU2pyLQI51qKSjFJMyeCMfaZJv
         yBX3IOserWpyqsGqkBGMyNSaDng0EKytf4Q+13KTe6mtocn+DNdSk5Ejf43waEvfzWx8
         RXiKFiE5i2FL3KCmZXSYuSb7fBrmqzsn+OmgkzOD89f3kUbqBnIMwgTjpCdABTtFrJJ2
         G+Mg==
X-Gm-Message-State: AOAM531LnyOALacXjf2y2nMKkF2psTUV5wHy2rJO22XKQkDC114ODaIn
	DhyQESDFNYpMbSBufsaHX4kFQA==
X-Google-Smtp-Source: 
 ABdhPJzTo0WtoddJRZHRdUT3qskBJW40z6/+zKC/AUGIkiSfgjFG1Myjdb0ZnaA/jY6QUeyu3ibi2w==
X-Received: by 2002:a17:902:d584:b0:163:7d7e:d596 with SMTP id
 k4-20020a170902d58400b001637d7ed596mr2749991plh.38.1653577951119;
        Thu, 26 May 2022 08:12:31 -0700 (PDT)
Received: from aquabyte.at.mandolincreekfarm.com
 (fluffy.mandolincreekfarm.com. [192.173.156.26])
        by smtp.gmail.com with ESMTPSA id
 f7-20020a170902ab8700b0015e8d4eb272sm1657303plr.188.2022.05.26.08.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 08:12:30 -0700 (PDT)
Received: by aquabyte.at.mandolincreekfarm.com (Postfix, from userid 1000)
	id BEA0D2521099; Thu, 26 May 2022 08:12:29 -0700 (PDT)
From: Zachary T Welch <zach@aquabyte.ai>
To: docs@lists.yoctoproject.org
Cc: Zachary T Welch <zach@aquabyte.ai>
Subject: [PATCH 2/2] test-manual/intro: bitbake-selftest needs bitbake
Date: Thu, 26 May 2022 08:12:28 -0700
Message-Id: <20220526151228.562281-2-zach@aquabyte.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526151228.562281-1-zach@aquabyte.ai>
References: <20220526151228.562281-1-zach@aquabyte.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 May 2022 15:12:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2948

Without adding bitbake/bin to the PATH, some tests will fail when
they cannot find the main bitbake script.

Signed-off-by: Zachary T Welch <zach@aquabyte.ai>
---
 documentation/test-manual/intro.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index c445e28a7..12324e592 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -175,8 +175,14 @@ Tests map into the codebase as follows:
    which include the fetchers. The tests are located in
    ``bitbake/lib/*/tests``.
 
+   Some of these tests run the ``bitbake`` command, so ``bitbake/bin``
+   must be added to the ``PATH`` before running ``bitbake-selftest``.
    From within the BitBake repository, run the following::
 
+      $ export PATH=$PWD/bin:$PATH
+
+   After that, you can run the selftest script::
+
       $ bitbake-selftest
 
    The default output is quiet and just prints a summary of what was
-- 
2.25.1


