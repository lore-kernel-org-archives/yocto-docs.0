Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA1CC6379F
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 14:20:57 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.9932.1677075654577869659
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 06:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Z6Pi+EMt;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id y2so4802710pjg.3
        for <docs@lists.yoctoproject.org>; Wed, 22 Feb 2023 06:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gacUpUJ8NM79WKRdKaNiz3UWUXcxzV+GMxltn8y503o=;
        b=Z6Pi+EMtoZfsChBzpisbnQgIHdnSYcOlE3aKmF/TMuEUTYK0uqeDbw0pJQZB3dts7e
         B6lQ2Avh3Q5rNu+1GT1L2n62SqpdNE9qEQxkdlKFLwhQ5fL3CHiAt/JJ3iw57jf3YUIy
         5nf7lijq3LHATez8E6Gdi+eX9obGYRJHNWbTagCzxhwrFczcqnzCmXMDJ8J3cXbXnZsz
         O/V/+64/hMjAP6WKf79vtwKNUHF82TY5tP8MY8IddSDRAK1cHS4L+hrfJiilGQdB3/ZY
         nVv0e6NKkBE7tVCDxM+5ekpqepwJmm/MjHE1ozgiOxOMyB5D76tpIwskuz1zYqurefap
         7JAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gacUpUJ8NM79WKRdKaNiz3UWUXcxzV+GMxltn8y503o=;
        b=DietSq8rpax6N7gVzy4ebkiqS+zGiSaqSXbGhwrOu/w5ACuBFGRMI1pofyopjoS0z6
         ahfS0u/4qSZC62/hhbuv6QOnyEic74bmz09JZwF34AeB7ZHuAIVfYLZEBIjNf4fdWeJr
         XvK88dDqVZrXLa7+YSwLQeHisBUB5xZlg4JHo23xARxL4bwOXGuHUE5wPBMX60j/btaT
         o5bS7WomI6Mr2quOrXWLmTi4hVSqmBm74sLilrYEBvTfwo7hEi92nf7Ko94Pbv68Jrgz
         RN//NXwkNVQ0Ecf+CsbELdnJx3qKJaLsozzbbCyGxiP6YnUSA2T9N4tzRpfKbhFdl2lj
         JUBg==
X-Gm-Message-State: AO0yUKW0+2aJhzmjMPXOkhIq9IaktjMpwrtAiRgoWR4cccc068rF4mHG
	u2Rm+IMe13ZyU/mSjYQvAwUI8QlMeudpga2N3m8=
X-Google-Smtp-Source: AK7set/cYRR8ZoYpwxTO1v5ettpvQWSLIL1Z2OfpVfXPz2qSEJy+harqYTcu8hxjRwRIn68KgD4OqQ==
X-Received: by 2002:a17:90b:1e02:b0:233:af77:c075 with SMTP id pg2-20020a17090b1e0200b00233af77c075mr8705275pjb.36.1677075653366;
        Wed, 22 Feb 2023 06:20:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id cx24-20020a17090afd9800b00233acae2ce6sm3609083pjb.23.2023.02.22.06.20.52
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 06:20:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 1/2] ref-system-requirements.rst: add Fedora 35, Fedora 36, and Ubuntu 22.04 to list of supported distros
Date: Wed, 22 Feb 2023 04:20:45 -1000
Message-Id: <561e6e58f45a0c479672ac7e7b4649d01ed0c823.1677075570.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677075570.git.steve@sakoman.com>
References: <cover.1677075570.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Feb 2023 14:20:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3713

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/ref-manual/ref-system-requirements.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
index 109aa60d0..dda6c3084 100644
--- a/documentation/ref-manual/ref-system-requirements.rst
+++ b/documentation/ref-manual/ref-system-requirements.rst
@@ -45,6 +45,8 @@ distributions:
 
 -  Ubuntu 20.04
 
+-  Ubuntu 22.04
+
 -  Fedora 28
 
 -  Fedora 29
@@ -61,6 +63,8 @@ distributions:
 
 -  Fedora 35
 
+-  Fedora 36
+
 -  CentOS 7.x
 
 -  Debian GNU/Linux 8.x (Jessie)
-- 
2.34.1


