Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B37EB64D8
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 13:58:26 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.11082.1687269504748325113
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 06:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=UkkV4yzA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f9b1a117caso19401535e9.0
        for <docs@lists.yoctoproject.org>; Tue, 20 Jun 2023 06:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687269503; x=1689861503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b25+YXQ2d4FjkNUp7tPXeaBpr5VP7hAzTgas+8asrlI=;
        b=UkkV4yzAwTNzSbEYq72faeWcRFeNHpG054alCSfE36ncJlmvVihMO7xdezdnblsEQt
         ufJNxbM7jNyxJNIHAwx28Kt/IpAlmaBsTvIU7EubGM66mTDrw6xWVYWfSUQkUHA/9Rlr
         OG7wN+6MnMm22h58gQGpYzIFMJBgujv5gqL/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687269503; x=1689861503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b25+YXQ2d4FjkNUp7tPXeaBpr5VP7hAzTgas+8asrlI=;
        b=V1aA5dAM1r4tyTXDF1P8TuHBdSC3NJuzF6UrH6643BCWTTa0brX2kj9/rU38w4UK9A
         kuZEiZuKRFfx+jz0l+vn18LeLg7KlNDS9K1or6SCOOv16fd6Z5j9b/Ein7PJAVPIxE6C
         Mke9strP/P/9Wm5VzQpD5QNmMETmGLHYsP1wt0vQvfykJPt9Pw3sUMxcXX+3VgG5ViOs
         gJMoO4bD8Hgsp6ypV31zAymtAEme9tJgU5z7Aa27JoMPsl7X6WQYT2UgyBTx/vTRt9HM
         Rlayz16CZ2UNC0RHuxKGWB4iwJ+jJoOsLqLJzJ8qT84OKXtSWCifczgJfOq9jsGhwktE
         Az2g==
X-Gm-Message-State: AC+VfDykr9Gaxf8nQe9vVkKyiTDjz2fSLChKrLpg6EMAPSBkzDY+UdBd
	tlvowT5X1QGli87yObduz42c0QvHbvolt5O/LIQ=
X-Google-Smtp-Source: ACHHUZ53hG0fY2MiBsEbjkScgpT1pebv718JRnclCw7aHwfq3vvGYD3O+24FfBtThFFc1AHS0+vWpA==
X-Received: by 2002:a1c:ed0b:0:b0:3f5:39:240c with SMTP id l11-20020a1ced0b000000b003f50039240cmr9293261wmh.27.1687269503145;
        Tue, 20 Jun 2023 06:58:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:dcd0:3b81:1cae:b795])
        by smtp.gmail.com with ESMTPSA id x23-20020a1c7c17000000b003f72468833esm2402169wmc.26.2023.06.20.06.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 06:58:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org
Subject: [PATCH] doc: Document FILE_LAYERNAME
Date: Tue, 20 Jun 2023 14:58:22 +0100
Message-Id: <20230620135822.2802308-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jun 2023 13:58:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4010

Document the new variable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../bitbake-user-manual-ref-variables.rst                    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
index ee5d7ba8d4..337cfa3ed5 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
@@ -1072,6 +1072,11 @@ overview of their function and contents.
       environment variable. The value is a colon-separated list of
       directories that are searched left-to-right in order.
 
+   :term:`FILE_LAYERNAME`
+      During parsing and task execution, this is set to the name of the
+      layer containing the recipe file. Code can use this to identify which
+      layer a recipe is from.
+
    :term:`GITDIR`
       The directory in which a local copy of a Git repository is stored
       when it is cloned.
-- 
2.39.2


