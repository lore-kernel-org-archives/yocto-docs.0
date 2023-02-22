Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC57C61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 14:32:17 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.10211.1677076330470311444
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 06:32:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=aP8eEYDQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id h17-20020a17090aea9100b0023739b10792so3325090pjz.1
        for <docs@lists.yoctoproject.org>; Wed, 22 Feb 2023 06:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUTCrGNFsJ/3l93uKcObRckdYs+7SxAATOYMBlBnKeQ=;
        b=aP8eEYDQODORLVvAT67ctDA5ZM4gTtj9+OEbgp/Is/w4Igr7KnRWesw2M1s0ERgS5g
         jiZWaYyKabLoJYVQ9DoWeMbKLsqKagZVAwHmpjEDXAXt+c2j4wCPINzD/t9QvFJw0j0x
         U2mGUXc9XVTvgiW8RR3pGjkbASvEsy0Xo2eyiLPQjHBSC+5lOY1XGaIS5NGbNDQqRZvF
         tC/r1w7wegCZOZclRO1XJfvtAEnNRKzKhVrZ9UbJ0NSnCbTBM7h1cnBUMJC/TuB0y9ko
         XIYrUvbH+/uJYU1UQJhPalys+2sFmZlVQAvrKXKxtAA9DpglfhzNlmjOdj7ZSdFDL6Oj
         d6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUTCrGNFsJ/3l93uKcObRckdYs+7SxAATOYMBlBnKeQ=;
        b=FYnuK0TAE3lg0ebxfTUEmK+NN0wJYytbvMtShI+Xa8YMifeWdBs2seZoCKkQPyU5zo
         crXiEw6BM+nfG2wCwlo3s2HUZ6CZOrCktbHWXCZv15IoUTZqDGvCpSkd14r53QuryWmi
         d3A+aEJ4R/UA1tc24V5uS3CLGX+ntantL43w8wlZgfwr1X+xkmhfldu2xisQ/oCO0Hxc
         1tol3JXAyTuCazBjqlp7xgBjPjOwOY+aplU909VbpUSmqfZKDsqY1rb+Ff0rOGgwhs/q
         d1ryeMYZ9u3p950eTbqbv3659GuOGBdQ9oFv31fmIsc5sZ2xjs/H94AJf8ttgNlDaQOc
         9xKw==
X-Gm-Message-State: AO0yUKU93LpG147kQNHsNIPeERv8pVIqqezv0AWfNHPZixIb3ZVx9p80
	ED61fc5dAErb41Vw18/y/KopAnbuhd+/NLP4vME=
X-Google-Smtp-Source: AK7set+pLQiSEMFG1scYDIDNu2Tw8zbvh6n77ptQn8NMYu9NHHkzwSD0UsVvssor2ZHMPfiX+pXQXw==
X-Received: by 2002:a05:6a20:728a:b0:be:b137:9d1c with SMTP id o10-20020a056a20728a00b000beb1379d1cmr8073277pzk.37.1677076329434;
        Wed, 22 Feb 2023 06:32:09 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id x4-20020aa79184000000b005938f5b7231sm5020946pfa.201.2023.02.22.06.32.08
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 06:32:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][kirkstone] system-requirements.rst: add Fedora 36 and AlmaLinux 8.7 to list of supported distros
Date: Wed, 22 Feb 2023 04:32:02 -1000
Message-Id: <69400eb337346877fa8643c54a64af82ab0939a3.1677076251.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677076251.git.steve@sakoman.com>
References: <cover.1677076251.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Feb 2023 14:32:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3715

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/ref-manual/system-requirements.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index caafccb63..060a5dde0 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -47,12 +47,16 @@ distributions:
 
 -  Fedora 35
 
+-  Fedora 36
+
 -  CentOS 7.x
 
 -  CentOS 8.x
 
 -  AlmaLinux 8.5
 
+-  AlmaLinux 8.7
+
 -  Debian GNU/Linux 9.x (Stretch)
 
 -  Debian GNU/Linux 10.x (Buster)
-- 
2.34.1


