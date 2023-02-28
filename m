Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E4CC64EC4
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 22:14:13 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.7088.1677622452319830701
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Feb 2023 14:14:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=kx/ETzZN;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id e37so8850416wri.10
        for <docs@lists.yoctoproject.org>; Tue, 28 Feb 2023 14:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1677622449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9cGBZs0nsdtmiujNCxMGRP0FTMxhX7N8Rr9NuPwmKso=;
        b=kx/ETzZNx3SKCuXcFvKIwo/n9w3+nVR/bsr/metKOAlhjNI4koONXpquOxAo9RDEjk
         9GTYEwsEqDhEOAae8Ii3MdJAqdmLbJDzfed+9N7Wmk8oI1rXUd6HwSuEVf2kB536TCfE
         oWBXjHPAKOibMnMw3914lWQDBepyoZHeumUNFNSnBLq6GLJ7POEjG+OTw/ACjGcxXHg9
         105it2YaUVXn8zfTfqoqtjcGnSsz1k/LRH/OJcAi1vGNeRkEkfzEZu8ZZm0cl7K9X1hb
         GaYUxRmgm0yA4Ufa+AFvdAzr6tqavYEUcj61EF9zntOJMmnX9PTDClXcou3aSp73Rkmi
         lTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677622449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9cGBZs0nsdtmiujNCxMGRP0FTMxhX7N8Rr9NuPwmKso=;
        b=o2mPYGqpsKsDmDWQih7me7ChGHt5BYPBab9B4i+LEmOmhoFfLpl1q9hq89fb++CR0v
         2Th/WHkpM1wUm0a5c/bvZj4wzb3XUkWi0iX7GBqdPNa4bOxlVhHUqsnFBHXg3spNV5Jc
         OMGKntXViXJMHXYKrndAfRgkU1rFYmIC0a5o0aQkc+SDerABdBiYOZHRR0wLeHzEF+Su
         +/pGCm3r06ua6rfpb8L7Z/BrHu41ipUD0J2haVwLoxS7zey3i5T2QRvMhciuDiUWFGiN
         KOHho0mJVUn14270u4eu6hb8WzX2SjlvV8kFz2kUYSP/GzjQVuZY2vMG6lD+TmoVACfZ
         uC4Q==
X-Gm-Message-State: AO0yUKWfGF4g1HBrXMWOI2c5zqN34lfn+sLlPjWyu/gdY6QTzb+9Ppjz
	FophIx2/UhsNRAnLF0cJfCp05Oz/rZ0WUbhd
X-Google-Smtp-Source: AK7set/TM7QhPZuHN5SWt9sPc5x/S7pQ/a64k4QClX0W8Y1vvVpsOKMK7IpqVG4Cfd92wIEzeVVrVQ==
X-Received: by 2002:a5d:6111:0:b0:2c5:5fe2:bcee with SMTP id v17-20020a5d6111000000b002c55fe2bceemr2974859wrt.8.1677622449406;
        Tue, 28 Feb 2023 14:14:09 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.mpl.intranet (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id v16-20020a5d4a50000000b002c5526234d2sm10990366wrs.8.2023.02.28.14.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 14:14:09 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 0/1] ref-manual: Add info on "mixin" layers
Date: Tue, 28 Feb 2023 23:13:08 +0100
Message-Id: <20230228221309.82156-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Feb 2023 22:14:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3760

Hi List, hi Michael,

During today's "Yocto Project Technical Team Meeting / Engineering
Sync", we spoke about "mixin" layers. Those are not documented. This
patch is my attempt at adding the missing doc...

Regards,

Yoann Congal (1):
  ref-manual: Add info on "mixin" layers

 documentation/ref-manual/release-process.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

-- 
2.30.2


