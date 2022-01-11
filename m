Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F196EC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:57:50 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.13013.1641931070184172483
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 11:57:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qSGqwNo4;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id i6so530389pla.0
        for <docs@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 11:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WmNVs+CTqqvoZS6NuBgp75LkKdmIK8tntfETwCzseSs=;
        b=qSGqwNo4fThs2XTZlqZNSujATZoRLz+KsXmvZbzeanmFM8ewmCPCe6j5ScFIP6XQC+
         mJ7oMpXifYUdE32+MftipopO+TVWdSqj6yt+BBS4iEWtBCnB+iRq9qlMHhfkprZRr4GH
         +w45IdZv12u6X6x+5ZMd9nKMy4zJAKeRCqol+ELuy70ed0m+RwLugFbmWyElOjveb/P7
         1QJ0VNZqeoCk0biWIoxovPuhg5mQIAKMEMJ9Xj/tBUs8vHizk0FD5+dRG01UvugE1MUm
         7chFnuctwcgAZtfSDtsev6Wp3XswQZmyEULzlJT5UkyCJVtFJZF5dpWfFLwm08D1Z363
         9x5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WmNVs+CTqqvoZS6NuBgp75LkKdmIK8tntfETwCzseSs=;
        b=HyRfG3A/A4Fzd5S80HlloPX6KwkCZpktELJIwjKfJoRUgBa7T7+PdNd1EQtN1rlOW8
         b1sDLoIb5DnkBKPUFrJT5ZkI6sx8jHHOf4/HXQqU5yFAtnzXVxy1j5grzYT3oNdGyTnx
         R6IBlXV3wrDaCLtXF1mCzfixrHUBiLgd/LD7kxbXa5A9tRqzPLn74yuBp5ZtSOq82xzj
         e3E4Fyg6cYWWecPafHz1HgfhMtc3/dI78Z0fEmCiYXHJYcNLITymMFUr0jAYErtGYG7r
         oNSqdkpISuyCX3oRU3LFeW2SwXntwfu938NEznRCRG9bAML/9+48OeXptavZJqjQKrGd
         o94A==
X-Gm-Message-State: AOAM532CDq0Ay14mroXn/S+wYDDLwLx206dVQiCGU01/oQ2xO2x36LIB
	Ijq9HWhk78PEuBc0fUlfBVRPQpU9RlU=
X-Google-Smtp-Source: 
 ABdhPJxiblPxU3OG1lnGShGzwl+kh7qq0ZIzMzXTkCb+Ea11ino+/UwSvupqi+1wvz1pHIWrC9Hhfg==
X-Received: by 2002:a17:902:f548:b0:14a:1716:15d9 with SMTP id
 h8-20020a170902f54800b0014a171615d9mr6057744plf.126.1641931069103;
        Tue, 11 Jan 2022 11:57:49 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 b4sm12029319pfl.101.2022.01.11.11.57.48
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:57:48 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: docs@lists.yoctoproject.org
Subject: Add setuptools*.bbclass changes and distutils deprecation 
Date: Tue, 11 Jan 2022 11:57:39 -0800
Message-Id: <20220111195742.1921572-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Jan 2022 19:57:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2382

This series deprecates the 'distutils' bbclasses and variables and
documents the replacements based on 'setuptools'.

We intend to move the 'distutils' bbclasses to meta-python, probably
during 3.5-M3. An updated series for the docs will be sent at that
time.

This series depends on the 'deprecation of distutils' patches for
oe-core [1]


[1] https://lore.kernel.org/openembedded-core/cover.1641920605.git.tim.orling@konsulko.com/T/#m8d122be68f9b03d35a1187dd462e71de2542837c



