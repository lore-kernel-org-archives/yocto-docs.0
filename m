Return-Path: <johan.korsnes@remarkable.no>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7D3C433F5
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 11:53:45 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web08.9521.1664452415256567382
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 04:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@remarkable.no header.s=google header.b=Mbco4HEN;
 spf=pass (domain: remarkable.no, ip: 209.85.208.181,
 mailfrom: johan.korsnes@remarkable.no)
Received: by mail-lj1-f181.google.com with SMTP id h3so1267003lja.1
        for <docs@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=NnA9w4AVk/0v3r/u68iR86cku1VKp8u6BeXXmqV9xK4=;
        b=Mbco4HENsDT9fNW3oEtCSKczu1VjVButAVBPbqrIplL5oxs8lIkIrPbnjNTIhk6cnS
         JFX9C4lQnyRvciTP9hEqSLDN9+mD858n0B0n2aWCD8jBLp7586lhMRtngq+06YdZQENc
         4mG6GUysKQys3IPPdSIAXuO5PZKLOspdLk12ZAfcLKjhDCCNLhIA7fbVgjTpNtQZYbUv
         neDmyHCw36rLc4wx6SWDJejLolqRh+B8B6CkAhsnGmsa+E5np8wfk9Pzwf9/vfJ9LeYL
         u7+DtGpP7YijsFvHeAMteWRSnXqn9XDJ3CpDlTKhycY9BSgpZCJ8Fgk4eFeUI9agmbzJ
         NnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=NnA9w4AVk/0v3r/u68iR86cku1VKp8u6BeXXmqV9xK4=;
        b=vax5rQe2hoq0NrPo6advJd/t1m1OI66xO57o2ZdEJy2EicCHOK8IL2pWQMPiatFB35
         O9rC8N0GpK0rjaC8cYskhYzfU43aU6ec/cJrpg0FUiJqtb90JZaT0pV+G6OcfgmnFU5A
         73i/AWmndDbHLa5+FCCTax73Ydauh3py76uS/iuq2wcbw2n8jfd6hLZu6EikT5llRi6r
         SCZDtDp3LI622vFowNmKynvc0aKwvSfCvJG5UnzA07YQbINJEHJ2aB4rNooEGMaGo3Qx
         0vQzeM8KiWzBrKGweGfY7oSpSb6IqVHdih5mRtPkNsoVbvNfQNbUD1Qb1YmCZOlRSrPx
         Lg1Q==
X-Gm-Message-State: ACrzQf0gdsOXfBKHMLMXlDTPYGi3+tx+P0f6HLHAv3a7CC7N2V7afE2Z
	j00iZvI1GmR3oDsT4kxJswt1aRkdcJV0FLI=
X-Google-Smtp-Source: 
 AMsMyM4v1BywoezyOCwbnvJki3QJKNK/iLigl462wVEchlVdEH/PypjbI1ARk+ccCqPcyPqA/tBnwQ==
X-Received: by 2002:a2e:8e8d:0:b0:26c:5d95:b31b with SMTP id
 z13-20020a2e8e8d000000b0026c5d95b31bmr1001365ljk.465.1664452412988;
        Thu, 29 Sep 2022 04:53:32 -0700 (PDT)
Received: from localhost.localdomain (217-13-24-82.dd.nextgentel.com.
 [217.13.24.82])
        by smtp.gmail.com with ESMTPSA id
 e2-20020ac25462000000b0049fe6f36880sm767282lfn.51.2022.09.29.04.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 04:53:32 -0700 (PDT)
From: Johan Korsnes <johan.korsnes@remarkable.no>
To: docs@lists.yoctoproject.org
Cc: Johan Korsnes <johan.korsnes@remarkable.no>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] migration guides: 3.4: remove spurious space in example
Date: Thu, 29 Sep 2022 13:53:05 +0200
Message-Id: <20220929115305.254957-1-johan.korsnes@remarkable.no>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Sep 2022 11:53:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3253

Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: Ross Burton <ross.burton@arm.com>
Signed-off-by: Johan Korsnes <johan.korsnes@remarkable.no>
---
 documentation/migration-guides/migration-3.4.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index bc2c75d42..8e0eb3b63 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -22,7 +22,7 @@ syntax, so the following::
 
    SRC_URI_append = " file://somefile"
    SRC_URI_append_qemux86 = " file://somefile2"
-   SRC_URI_remove_qemux86-64 = " file://somefile3"
+   SRC_URI_remove_qemux86-64 = "file://somefile3"
    SRC_URI_prepend_qemuarm = "file://somefile4 "
    FILES_${PN}-ptest = "${bindir}/xyz"
    IMAGE_CMD_tar = "tar"
@@ -34,7 +34,7 @@ would now become::
 
    SRC_URI:append = " file://somefile"
    SRC_URI:append:qemux86 = " file://somefile2"
-   SRC_URI:remove:qemux86-64 = " file://somefile3"
+   SRC_URI:remove:qemux86-64 = "file://somefile3"
    SRC_URI:prepend:qemuarm = "file://somefile4 "
    FILES:${PN}-ptest = "${bindir}/xyz"
    IMAGE_CMD:tar = "tar"
-- 
2.37.3


