Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD25C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 19:33:56 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.13650.1641497635721088436
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Jan 2022 11:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Kwk7/Sn3;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id i6so3224889pla.0
        for <docs@lists.yoctoproject.org>;
 Thu, 06 Jan 2022 11:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3kwXRguDaMCefOi8dNnEmZzqBReljj4EkYQNKMiBabE=;
        b=Kwk7/Sn3dt8cl5vEp3Q3e525Jh5+E+fPasU8n2r9DPDDDX8Ss6DE2K/w+OKGzVAoZb
         v4nH9wnVZ3296ntlZfa6QN66VRfwX8gM4wMC3BXme9wy/bJgTxxvLPIpPpy/axWoXrEj
         I/ilWYRDidCxorTegLWH+ZwtT5iqNvZiKojC7epWRVmq6WXqJr5RuyjSAq5kY1D6fgH7
         L5aOp8NY8tlt2WsBmQ73zKCy3+x2A9O4CzihYVnRD4oFajabAUn2n8zDADr79N8SQbOP
         3t5Gdn9O9SVvBB5vcZx2PaUR1fIqzNbwVGm0jrxsOwcswweHwH0Rxhuu1Zx5Xa+ZIlCs
         /OwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3kwXRguDaMCefOi8dNnEmZzqBReljj4EkYQNKMiBabE=;
        b=Xbyu4LBrJJTm08WeyjUYZGLBpo3h3Xj0woWEraRh07s8mJYweiOGxbH0RxtrHIiMtE
         r6+LvSCsSzkHGOWUdDgcTe6IN31IiWbNV1ZRWpwZXd8GpgP061fMIOn9Kx7FUvRWcZGA
         beZVj30/eVCVrYhkHsTxuSL1VvZahsG9CJSG+tZafvqy5VqfvfHK1Wd1mvwLvnleV/rS
         /hJXyozglrr4Pj0QETbUXrzJqLB86xyA7S9EP8VijvoYoflk1tFfs1w/6Q1/6qYpp04B
         uvknRFurqxM20iVraArCHD6oa4Oo9T9rlsdAdB0HKt9udYbqWNpkcLAlq5cvXbqVHigA
         ZCaw==
X-Gm-Message-State: AOAM533U4OQCjSj6A9vZbsQj9OH/0JFKlcz6VW0VQCKU/MrZOxr3C/BD
	G8uW0jhYCYXu4UODgvxkNI4p2oUAyDM=
X-Google-Smtp-Source: 
 ABdhPJwErC1tyslav56/l1tokxlgeccox3+bd0N77/EH1aq7Ic0N27e+gqKLUFyOYiE59h72JvmB9Q==
X-Received: by 2002:a17:90b:4c11:: with SMTP id
 na17mr12081996pjb.84.1641497634812;
        Thu, 06 Jan 2022 11:33:54 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:72b6:581e:8792:7fa6])
        by smtp.gmail.com with ESMTPSA id
 ng7sm3483567pjb.41.2022.01.06.11.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 11:33:54 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] poky.yaml: centos-7 python36-pip -> python3-pip
Date: Thu,  6 Jan 2022 11:33:41 -0800
Message-Id: <20220106193341.2610619-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Jan 2022 19:33:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2352

In CENTOS7_HOST_PACKAGES_ESSENTIAL, change python36-pip to python3-pip.

The python36-pip package was obsoleted by python3-pip in RHEL 7.7+

https://src.fedoraproject.org/rpms/python-pip/c/6771a1c54f5c7ac333c7af644c055da670027f6c?branch=epel7

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 documentation/poky.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 11e209e3075..62589acd9f0 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -30,7 +30,7 @@ CENTOS7_HOST_PACKAGES_ESSENTIAL : "-y epel-release
      \n\      $ sudo yum makecache
      \n\      $ sudo yum install gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath socat \
-     perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python36-pip xz \
+     perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip xz \
      which SDL-devel xterm mesa-libGL-devel zstd lz4
      \n\      $ sudo pip3 install GitPython jinja2"
 CENTOS8_HOST_PACKAGES_ESSENTIAL : "-y epel-release
-- 
2.30.2


