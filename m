Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DC9ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 16:51:10 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.8579.1663347062917999948
 for <docs@lists.yoctoproject.org>;
 Fri, 16 Sep 2022 09:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=LwKN8fY8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id b21so21976129plz.7
        for <docs@lists.yoctoproject.org>;
 Fri, 16 Sep 2022 09:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=os5QlP6eJtkR9K5atlhT08ZgqTmt6kLPPgMysS9YvYo=;
        b=LwKN8fY80/itBoVoZvHkq9hnLbNxyzSmi2iS2P9bXO2ECDWztaMZ+kQ80sYSfCZD9F
         sYcFlsLvQGPj31jdCT5koMYTEojNExnIo385AGVX+PtcmNNIw54YJ2dh1XnEctxBOgF/
         JkbmamBirG+91fRZY/W33jj9gm4G7TAGSiI2tqPCLLGdO//sDVbWFkesgZiSZl7IgYRt
         0K+3LInNGBqsRKC6HhMLs7MIqQAebcs0D1PyhwDb+rWSWv7zCv6G7ZIOdkmRbib4zXIe
         oRfuk4/tb2iSd0dH+GE3mmni2DHADp6fEII5C8rqnMcL7l+lKuf/sZTts5xhg/zFB5Bf
         bRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=os5QlP6eJtkR9K5atlhT08ZgqTmt6kLPPgMysS9YvYo=;
        b=EXeWiSgDlZrZNIrNXQnF9HMeoobuo9YlyVKaD5y7HStWJtvg+CAVY1PHtZjuzKCkr+
         tXE9pWmrTvtO0YVttEQI6x8etT5l4O3shmLuY3fB5TN+8tR0kSJc8ptbRWeGCNEkSZCP
         72T+yF192LmD1DaIUJawGLMw7uqfYai2O+ocjdM1CSAB+pOE4rNxDGS9gXDfvdw3UgI4
         /hGuaGcHTHlSbBhdBBbtsrvJfVufgiOFVTBIM0BooKaBWyVWl5kzjaBc8WMyHiPxtVEn
         +UUQwQorBab6xQOUgE2VWUmF5r55UxU3e39PBLmcirx7SRtpkxvy7Eyr2DkJ4GGJ542+
         e0jQ==
X-Gm-Message-State: ACrzQf02KeWvZwCr93L3TPWLjpVQLqUI8HVu6y82zZIqh/KH9WTqfzVg
	TyEq5k2rytkSXc31L6zKxdAk7xoXw+t0x3nH
X-Google-Smtp-Source: 
 AMsMyM6jPx4fcfkdZiqi1qYYwgm218XBvm/yoy0tw+zKq23oENJtCnwxRE0V5PVwQSyhVe8/Mtcy7g==
X-Received: by 2002:a17:902:6b8b:b0:178:7cf5:ad62 with SMTP id
 p11-20020a1709026b8b00b001787cf5ad62mr714375plk.13.1663347061842;
        Fri, 16 Sep 2022 09:51:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 y15-20020a17090264cf00b00176a47e5840sm15045035pli.298.2022.09.16.09.51.00
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 09:51:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][kirkstone 0/1] Pull request (cover letter only)
Date: Fri, 16 Sep 2022 06:50:53 -1000
Message-Id: <cover.1663346903.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 16 Sep 2022 16:51:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3168

The following changes since commit 23d3687c4cf71e878619a7bd7b95a9df944ca76c:

  [kirkstone]: migration guides: add missing release notes (2022-08-30 18:23:36 +0200)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/kirkstone-next
  http://git.yoctoproject.org/cgit.cgi/yocto-docs/log/?h=contrib/kirkstone-next

Steve Sakoman (1):
  system-requirements.rst: Add Ubuntu 22.04 to list of supported distros

 documentation/ref-manual/system-requirements.rst | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.25.1


