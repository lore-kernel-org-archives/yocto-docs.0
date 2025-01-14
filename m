Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE110E77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 20:08:42 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.4045.1736885314253731522
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 12:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rl/1+p5s;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385dece873cso2946532f8f.0
        for <docs@lists.yoctoproject.org>; Tue, 14 Jan 2025 12:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736885312; x=1737490112; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xdZoOa/N6Zjf0sPMaFLnEi/pGojc3NK6dAj10Qou6D4=;
        b=Rl/1+p5sTJSho4Jt662dZ7B6TZhSoqQ20uzv2evZ6I/0CogdE1Ft3MvbKQV0uuMNY4
         tLdGOlzpIs2r2EsY69/M1SofJ7HGuSpFIwz9d5E7mSwuypT5f96KdDfuZ8+Os9dEK4UF
         dIGuQK/Tt6XAZYAgssN2sVAoA665cm2t2KjP6X89zIuy8JX6RaHP2YvwV6dDkcjBVp21
         o8nc+0Y1bsuWlgT3vIdR8Xv2jU7hYXHnB3lwALTpyrhv9HT8936dklV7PyF0dB1UmObN
         8QLGevphN3e+oNFzigo4jTwkNSPO4J1dy2W6KRBbTEFS2kEkwUknzvj/N7kOSrWSfV/R
         pbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736885312; x=1737490112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xdZoOa/N6Zjf0sPMaFLnEi/pGojc3NK6dAj10Qou6D4=;
        b=AvKIVZgAHbAiCyM5kF5msf8lf20RagzXXtibsveaGeFLRpU5cH/5Viz+VWrnFzzfK8
         tT0jYEDRJvh+fyQetGBPutosw2VU9dilEEVAktTLrH7fZWFiCF/QePjXEJ7Yj75zd1Qa
         AMp8d3G6NCNlEidVwdqbWRoGtRYPaXccbWWJaEUOLNZ1yyw8S8HQ8mVtROVAo18biPGB
         OmYm5tz9lZhhxgeQSr8h690wuuPPMeUDWkWaeG1f7CfSRRJDMroaR4mgHD5gXZtguvAR
         16Y9oLYRGAlULA/yvdcHnYfPWsqRPglut/cDRYo+bddzdkyqPTAi0RsW4UPsed1UY9jM
         RRgg==
X-Gm-Message-State: AOJu0YwJCPiQ5uufoli3Zx/DIZ71P9TP0okovIUDSvHgDW2tdbgBJDma
	MAIIRPLwSSwz5tJolJIqjCsMvz7BSBg4R2tW71e2U6krRW8Q1/mzU3SgIg==
X-Gm-Gg: ASbGncu/mooOKzqzY/i8Ia37Zds1kXQLV3nlLIBkvIM4coR7/JMUaCj50WIcT99Fiuc
	3Nz3RTKRe5Y0yUtsxlki+xY2j1xeCYQQecxZmgljlX0B/fWIUc6GClxm/NxUXs5H0v4VSURSJuX
	OtzFRRL2QbOjKMU1jWbkPI0QoYxZx22R6P+P/fKc4Y0u7lA2UWQRI4VMiNQxafaw5Avey5KtIYi
	WqRxutGflUzH5Y6OwtofIYmPi2r1pbfI24CGPRLBFEUALHsolnd65iO3kRkesPPyIgaeCnDs2cZ
	GIc=
X-Google-Smtp-Source: AGHT+IFWoXUBxkeuHbyOwpK/LIV6EA+EVdhsj9HGyvRnfmfRES+gZv9whHRW8zsgqmjXn9O/0/RlwQ==
X-Received: by 2002:a05:6000:1f88:b0:38a:615c:8223 with SMTP id ffacd0b85a97d-38a872f69c7mr22865692f8f.10.1736885312137;
        Tue, 14 Jan 2025 12:08:32 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c76esm15463787f8f.47.2025.01.14.12.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:08:31 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 0/4] Cover systemd.bbclass and devtool ide-sdk changes
Date: Tue, 14 Jan 2025 21:07:10 +0100
Message-ID: <20250114200734.4191354-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Jan 2025 20:08:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6106

Changes of v4 in comparison to v3:
- Suggestions from https://lists.yoctoproject.org/g/docs/message/6091
- Release notes: cover devtool modify --debug-build

Adrian Freihofer (4):
  migration-guides: systemd.bbclass do not add Also services for 5.2
  sdk-manual: extensible.rst: update devtool ide-sdk
  sdk-manual: extensible.rst: remove confusing post-install-logging
  release-notes-5.2: cover devtool modify --debug-build

 .../migration-guides/migration-5.2.rst        | 20 +++++++++++++++++++
 .../migration-guides/release-notes-5.2.rst    |  6 ++++++
 documentation/sdk-manual/extensible.rst       |  8 ++++----
 3 files changed, 30 insertions(+), 4 deletions(-)

-- 
2.47.1


