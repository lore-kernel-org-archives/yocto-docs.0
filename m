Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56A9C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:33:41 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.8738.1646750020944769302
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 06:33:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=X2Ed21b1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id t19so13666400plr.5
        for <docs@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 06:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qCpS/6xlbRtghqQ0fYZwoDaz9916fujr8TVcB3hMWwQ=;
        b=X2Ed21b1NfXWXN4BAXu5OJJvE2R3t5bBbx1vTRXEDeitSp2qbpg+p71u4nLZ92ybVU
         LQ7HWr9dyP3PFz8Sy0VB92z+yHiZZqA8r0i4XGeMawaQ5toDug7BnnxNHq9pJHjNGmIF
         9LgInklnfm39oo5hr5vGlyzXSDnL//32rlpZlGTka6a02YZjRb0+JREoff1tJedu8rp/
         JfvivXKPBKJuUEiiCB/YPx6T3tpGcBqLMKaUxREc3yV84OF382EGZz9fiwopqU5as9WN
         QCugYOwr3akMAZoQp/25uaGe8yk42NiCAML2W7Vazcnzv7SLPbpR1LeOjRZ+eI0O7vIQ
         LxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qCpS/6xlbRtghqQ0fYZwoDaz9916fujr8TVcB3hMWwQ=;
        b=Yt2eBpXoLVAkcUy+gCnHCoimvqDzZpLKtakhqDi7IKFenac5nN/xfmLdQU0ftu5aLX
         02qJRUpWSpj3WAKUehDnrozfORzj7SseQRl3YlxMAesUk6TZOhDg9leYadaBUtM1vY/V
         vBGIqSUFKP6JUKpscRGeKwn8wsUlFpuJ6FWQcqyZcRjSzS8C7l92JKzfOp3576xKSE42
         hPYnbuJ3KvyIZk6y+YZpiYNio/fTsvJ4hBhGCcYemWby56KlgISdWU1snGLAThUQy65X
         af3fLb6a2o6uHQssC+KA2wYWxvb+yFRIPqqD5yxfAsTewzdoT2bz/IrLa5yMDTrhnhPv
         R5WQ==
X-Gm-Message-State: AOAM5313HYNocEXGQsqFn6YCVRnnNFoDgH1/JEbUBDG1DiEMV14H41Rl
	LLn8J2qth89M9RXEtXG+rZzDdJKiy3dC5mbuPVs=
X-Google-Smtp-Source: 
 ABdhPJzrqpwj0hff/LAeZnx4RbnVt931/se+pN89pQQlxBqplUOu7hwh1NzM4ddvCoJ0INXUknzG6A==
X-Received: by 2002:a17:90a:cca:b0:1bd:729:5091 with SMTP id
 10-20020a17090a0cca00b001bd07295091mr4990852pjt.105.1646750020037;
        Tue, 08 Mar 2022 06:33:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q14-20020a056a00150e00b004f741b5c071sm687361pfu.86.2022.03.08.06.33.38
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 06:33:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 1/2] ref-system-requirements.rst: update list of
 supported distros
Date: Tue,  8 Mar 2022 04:33:27 -1000
Message-Id: 
 <673d87cd2b481444331726b74daeca83557cf4d4.1646749913.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646749913.git.steve@sakoman.com>
References: <cover.1646749913.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Mar 2022 14:33:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2545

Add AlmaLinux 8.5, Fedora 35, and OpenSUSE Leap 15.3

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/ref-manual/ref-system-requirements.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index 041f64c59..2acf11cdb 100644
--- a/documentation/ref-manual/ref-system-requirements.rst
+++ b/documentation/ref-manual/ref-system-requirements.rst
@@ -59,6 +59,8 @@ distributions:
 
 -  Fedora 34
 
+-  Fedora 35
+
 -  CentOS 7.x
 
 -  Debian GNU/Linux 8.x (Jessie)
@@ -73,6 +75,9 @@ distributions:
 
 -  OpenSUSE Leap 15.2
 
+-  OpenSUSE Leap 15.3
+
+-  AlmaLinux 8.5
 
 .. note::
 
-- 
2.25.1


