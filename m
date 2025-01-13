Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50B3C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 23:37:59 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.32931.1736811470006494245
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 15:37:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gjvloNNy;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385e3621518so2489481f8f.1
        for <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 15:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736811468; x=1737416268; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I9LKaUmLbCroxEvhB/UAsxxX9fUgVwaCMfdUdJPvA4Y=;
        b=gjvloNNyQTj5fGZI/B+Yu+AT0wmetPKVWzoFPiWFoVhLV9OSi7bwCNjvSre1EkxXBe
         O7zjpncbO6xNkyjHxU9vkTaf9HJBVFYcxXiuIs9cWUDz0PQg09nHjYOZweUJ5Uk9Z+6s
         nPw70mkirn6g8aiXqSbs5jj6jrG1C5TFoG4LgYr/NXJgEqMzUqkpQrzJpS7iOl5AmuTB
         Qz0tV1gEiC3E6YM6vIijAi6MM2oFAhCAHlCubS2EuSb2lqNux9wlLvNq3zoN6osEgxMp
         sEUp9sPqOjoHv7KHQqB99m6N5ONUfJoLkwiu5GWjm4gh1ULdhIF/YB+i3lzmP2nK0AOl
         bxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736811468; x=1737416268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I9LKaUmLbCroxEvhB/UAsxxX9fUgVwaCMfdUdJPvA4Y=;
        b=JVAn8rR5NWKJWaoSsPaWYlRQ6rLyucSJ8c5evm3sicc1X+m8Nwykr+rEXYlspTX0QZ
         VUpCVB7d8yaWpKHJTQ92+IadfANO/00KA2cOH3XQymGOTYAvuz3P4v0w/cj/LAoNTdz9
         AcxHQCr9rkAC2OpoGMJigzYD/qbjoJqpnkJBS+pfuAE6MwCPKML9fOLLlc1YUm0wE4r4
         Ob88Eo2dMI4MgpTY2FTDMxCKKZXOJJpZZbgjQGFjxlh21j187FhbTsuvT9/BPrxmzQbV
         4mIPLMiUbrP+78ypPWY4WpbDBjjLVt7xKOtk0bNpT6YmVJ7nliy7wTg5ex5U4+xsYGa7
         ijKw==
X-Gm-Message-State: AOJu0YyKWVJzSEXSyXQac2cGDPJepqsF2572WZ6c13ZgG6QByaNI3F/p
	QVIQ7iRZNYiFNue1YVI5obj94ceFDJgomNWKK82+BsEDgXPNnPytQUY8Z2TZ
X-Gm-Gg: ASbGncvIlUsE3ka+6VuqT00j+42uOzUw/REcBdEB1RctKI+1jLLYrQBtJlgSQPXUTZk
	Xslt/n1ze9ws9syJ3tH8o7HAWCypfBLnNQc39nrpu8mj3jO9wve5W2SVmUKLfRauWjjASJ0soFP
	nSpWet8olX2ggoEcV7YM8XrEv4jDnQOxOf9fpMztnvVzSonQvPjAl9h1kJI8K5oaGsAqB+hKbAy
	Pr5TtAFNAs5cN3Y9JXl2aCu1yplc/hjp0hM3Zin1HXUZ8Ame5r9iL8Lhlfe2oxKJ07ViySkNE/b
	3kM=
X-Google-Smtp-Source: AGHT+IEAdDxQhsu+BtQx2ZzYmQms557BsJ2Yup3aArv3czhZkPP/Crb1Ymo9qPr3p0rsNYiqdCrj+w==
X-Received: by 2002:a05:6000:1445:b0:38a:86fe:52b5 with SMTP id ffacd0b85a97d-38a873038c5mr20759701f8f.14.1736811468123;
        Mon, 13 Jan 2025 15:37:48 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bddbf50a2sm2898727f8f.43.2025.01.13.15.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 15:37:47 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 0/3] Cover systemd.bbclass and devtool ide-sdk changes
Date: Tue, 14 Jan 2025 00:31:15 +0100
Message-ID: <20250113233736.4181201-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 23:37:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6094

Changes in comparison to v2:
Suggestions from https://lists.yoctoproject.org/g/docs/message/6091

These 3 patches are based on today's master-next branch. Feel free to
squash "sdk-manual: extensible.rst: remove confusing
post-install-logging" into "Remove debug-tweaks references" if it is
still on master-next or keep it as a separate commit.

Adrian Freihofer (3):
  migration-guides: systemd.bbclass do not add Also services for 5.2
  sdk-manual: extensible.rst: update devtool ide-sdk
  sdk-manual: extensible.rst: remove confusing post-install-logging

 .../migration-guides/migration-5.2.rst        | 20 +++++++++++++++++++
 documentation/sdk-manual/extensible.rst       |  8 ++++----
 2 files changed, 24 insertions(+), 4 deletions(-)

-- 
2.47.1


