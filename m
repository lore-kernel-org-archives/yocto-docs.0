Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07519C433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 17:08:52 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.1102.1636564131247510137
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 09:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WVvI68Js;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id np3so2087523pjb.4
        for <docs@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 09:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uaEcFbBhn/T0sP7FD9tvwQK6h/xTQucu6L+7HbaRJs8=;
        b=WVvI68Jso/RO8NH6BUcRCOjlx1BmAUQjALfl/wxJzdRi70EqgKXMwz6ObKK7J9gGB2
         XkHuvPvSLrv7+DvUGKvZIbYRGsRkILlGWbQPC5SKsgdfvUA2fyUUjaVr2bX3j4YF9ADN
         cKB1qOorgjvdIY/oRon3MOXKv+8KreEQhn4qhGRWeJ/ZCs56k4iFIsKjdKhamupoGy1W
         j2dZ/7JZ1aRWMTELFxq2Fr2vjHbaSHTTHekkuNWKgkk23+zKAu6XL+1Z6ycp+TrFnIu1
         wz6TdF0pIDsv9VbLOg/pFAP0HkdOn4c9kZDTmuAtYYAqhq4DObfbf0l0visGS06djXZF
         W6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uaEcFbBhn/T0sP7FD9tvwQK6h/xTQucu6L+7HbaRJs8=;
        b=cH+I/Vk2X7Qb/fE9S9amW8dqLB1U6T4BecfpiH9uDzt5rI5S9P+laPGkHiOy+OmFWF
         Bj1GCsnzIb8n5f3WZcJsATKuoCvH3vZmUEKpVGZ4RDf0jFvBM8wayISA8/3Zgj775EVD
         wBaw7bSIlb5evBH9Pe0H3Aiolj7t+ZABIJN5vtf76ta5o0+ea1dlRcrlqrDAZDwM80Sl
         NVhfZAd5Fx31dxIruRtel/nKnbYuvdeC+V8+RtuAJhUi0/Ohqv6tFTI20uzcWw/5hnGf
         5C9IEF1y6TC/va7C+i53OJAOmg7IXCpy0yZ7yCQTGj7joxr5px+W5WAbPk7dmdsyLC+d
         3jxg==
X-Gm-Message-State: AOAM531TpK6RHSTeIiUb/1+sVuRqUldrCCytIsQi3rzxa2hp1/DHqBo4
	DwU6APqAEEC7dFQCs7Fj7MNoNi+tl1vUGPWe0NM=
X-Google-Smtp-Source: 
 ABdhPJwXGTZSLNGMTfrBzaNloviYJUp8WlXVj2wWfqsn6LiwRNK/HYljfaLBl2qvSUnM16bSSZ+7tg==
X-Received: by 2002:a17:903:2348:b0:141:d60b:ee90 with SMTP id
 c8-20020a170903234800b00141d60bee90mr233726plh.15.1636564129930;
        Wed, 10 Nov 2021 09:08:49 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id m6sm164595pgc.17.2021.11.10.09.08.48
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 09:08:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 0/3] Patch review
Date: Wed, 10 Nov 2021 07:08:36 -1000
Message-Id: <cover.1636564016.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Nov 2021 17:08:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2115

Please review this set of patches for dunfell and have comments back by end
of day Thursday.

The following changes since commit 6e287138eaf1e20ac09bdc31fc91b3fe0fabe3ff:

  poky.yaml: fedora33: add missing pkgs (2021-10-29 17:30:57 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/dunfell-next
  http://git.yoctoproject.org/cgit.cgi/yocto-docs/log/?h=contrib/dunfell-next

Steve Sakoman (3):
  ref-system-requirements.rst: Add Debian 11 to list of supported
    distros
  ref-system-requirements.rst: Add Fedora 34 to list of supported
    distros
  documentation: prepare for 3.1.12 release

 documentation/conf.py                                | 2 +-
 documentation/poky.yaml                              | 8 ++++----
 documentation/ref-manual/ref-system-requirements.rst | 4 ++++
 documentation/releases.rst                           | 1 +
 documentation/sphinx-static/switchers.js             | 2 +-
 5 files changed, 11 insertions(+), 6 deletions(-)

-- 
2.25.1


