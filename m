Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77031C5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 16:17:09 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.76316.1673281020786057111
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Jan 2023 08:17:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=EPkkz9yS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d15so10029973pls.6
        for <docs@lists.yoctoproject.org>; Mon, 09 Jan 2023 08:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcH3SsdTdfcwyb/3N9RzV/1ZuRY5iz6N0SJmM++5gkI=;
        b=EPkkz9ySaKkFDQMrgYoHzefZbcHQUMU8BwHo4SfQ+5Eu0KbF5pfSn0g+e6FR920LzF
         up8Hn0ZojwIfpxCRRdO7McCJ+EhCVxtcWkCJ8zbv0XtxYtSbuJUWil6ya4KS6PgKpVTi
         pHgb5sBKC5+yTBSw1A5k+NJeM/x7UQWdPAcod3U/GACXkm0rvyOENRl4CBorAK4WlYmc
         3h+xSgEg7vJzDNwQBXxeJIW0EztkIg3vmigK1rBwaI8LGsROvNfDsjROKH+m4HhYIqyh
         c6UUa4Tagdz+nnfdYCHCvzFlbx51cE4vadF2hCs2TgsAB3QN+tyPl1OUMR9Zrjwx4bdP
         PnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcH3SsdTdfcwyb/3N9RzV/1ZuRY5iz6N0SJmM++5gkI=;
        b=i+rXrXRM8joRCYd1vtNNYhYYH2Pi7sT2EY6G8XdWvzBu3uWO2Rcd0JqO9FT52gGwoX
         UwemuN94ub/ah78ER9Y2UdiV/cKB5MSXskquc7rngfhrjyckBln/yr1C4pkJjYUzDUz7
         D7DZzNxg18bwOpKfjL3xLDqceUf8w6DihCcAas2hvt6hOa7vABqWDUTUC6/I6KN4uao5
         CJMkGoflTjSBch8x9/UAYwyOZ4YXVdonOY6D41NLn4iBn7Q793BgJvjcoPahUaFCXMuu
         udjNxYWW/QKfcaYE9Utd9Yd4Jn1AWGzVxaJjjM7nNzJvP6raAFyKI/9v7CoSc/he8dF/
         lLSg==
X-Gm-Message-State: AFqh2krxDy2RWB4gciKAg3Kgs9lRcyC9Clv/MflnPM2/VQPDVNT/s95M
	sh/w59KSqP/Vf/82djZwUqJQSLr44fIdgCc6IF0=
X-Google-Smtp-Source: AMrXdXuR6O2lqHVROiW5gt8jjZLr1NCw1lySLNBbfNpMvhvrXb+cvgDIGeZOTfE3KYMaSijlO1tiPQ==
X-Received: by 2002:a05:6a20:3c8f:b0:ac:5bc1:cca6 with SMTP id b15-20020a056a203c8f00b000ac5bc1cca6mr101763365pzj.8.1673281019805;
        Mon, 09 Jan 2023 08:16:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id ij30-20020a170902ab5e00b00193198ffeddsm5190982plb.30.2023.01.09.08.16.58
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 08:16:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell] documentation: update for 3.1.22
Date: Mon,  9 Jan 2023 06:16:53 -1000
Message-Id: <9ab652500f969639f0153ba5f325c2f269804d22.1673280960.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673280960.git.steve@sakoman.com>
References: <cover.1673280960.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Jan 2023 16:17:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3600

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/poky.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 2cadb6989..2fb917cae 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -1,13 +1,13 @@
-DISTRO : "3.1.21"
+DISTRO : "3.1.22"
 DISTRO_NAME_NO_CAP : "dunfell"
 DISTRO_NAME : "Dunfell"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
-YOCTO_DOC_VERSION : "3.1.21"
+YOCTO_DOC_VERSION : "3.1.22"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
-DISTRO_REL_TAG : "yocto-3.1.21"
-DOCCONF_VERSION : "3.1.21"
+DISTRO_REL_TAG : "yocto-3.1.22"
+DOCCONF_VERSION : "3.1.22"
 BITBAKE_SERIES : "1.46"
-POKYVERSION : "23.0.21"
+POKYVERSION : "23.0.22"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
-- 
2.25.1


