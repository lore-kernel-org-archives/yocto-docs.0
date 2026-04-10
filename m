Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD76F4484C
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 12:18:02 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.155082.1775823478267248023
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 05:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nQW+x3eK;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b9358dd7f79so345113366b.1
        for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 05:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775823476; x=1776428276; darn=lists.yoctoproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxWECf3yhcG+iLjquZWmsfX51m/NgtyObCXSyqv8fTc=;
        b=nQW+x3eK/pd2iYdGlhr/S/iP3V/k9+OkvI5sUqNg0zA9yBLIptIxPQAuSImZKP96BG
         23cv9XYMncSMtTTcdeSkBDMqzo55HomOE8uygE7CZvKuPouvtO+oX+1WPD20rha/sJOz
         VmYV9Oy3tahtYcWmqCD8QLd1VHZPMpdavkPjYxZpv/RayZ4+U/3FkP5sPxckhD076Tb4
         6TEhjn5TMOd94Lp5nE05CLuls14b0DMii75284Ilw+WcaPqozFWwMU5HpkS+fNNfM0t5
         oTxdALGMsMTbrz7qVE3zmPcEbGcmngzqHLPZnLxkMvVGD2RGtAxg0tbt8JDOsyYbowGj
         jBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775823476; x=1776428276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lxWECf3yhcG+iLjquZWmsfX51m/NgtyObCXSyqv8fTc=;
        b=IRna1x3wSDbhYvUmDd/5dCXlGrxdsUfoIBzBT//ARTGYGDA96T0kIh+3jv+dkXujue
         WsrwhNt2xLdA4fIzZTFMk2we3WrXTrltQXmhOM7inrGFOd0WeBPAHHYDU/HsOSZx29NM
         ydBa4M01p6CUcPwngcdafoirPKeqNzgaCvfYdzvA6AI/d4tVkQJTFZAaz8IL7CROcj6p
         I3U/Q5TXwf9a0xAtqP3MAE5LBr5n+TnO2EU/UQfJx10Xjez4pWgVo5PbwUeXPiitQ2dP
         P16yNmWAq9iN2uZYihXbgtc7CY7lJZ2w/paHOAoPIhkchZUWwO7xH9MJVEvcoWnFsmTM
         AuLw==
X-Gm-Message-State: AOJu0YzX/q8cw+JVclM6Gwp8+r/L8176QyvQCx9Yr28of7f6pxFoGEVE
	UORUU9JJJSxFeEquHPsZAEIjFOYUKGejDnb85LqZGYFXKNGofdCP5Iip
X-Gm-Gg: AeBDieso8QNPf/2egmtBpuCHYT5x/mc9bbeUc4w5291i9GVJAX31KjERmQUiUjRLkWF
	MrOzmGMdboIwkmwerk1QLMw1c8GooeDP7vhiSoRc9opVEaq4pVhkVR4fZT86N9+rLaYHinbr1P9
	G78cQIhDQEnTuV4qRDv3d7bxhoUqARMYkB7vAfaEtub5YfB3WV6eoRFFDeqjVS6kGxzrzQC2KOe
	NsW1Nm9c/RQabRb1zLaNz4L22iJco8I4GSKal07Dv7OCuJporxCOm2fTor4sqPnMPpGcym8pjq9
	ZKpSH4KMyf9YBklnZk6c3g791TzTEZsSZ16576qcBwmuVD0lh1x/nlAxk2wxLH8t+UUaRpNNtvj
	DeGpW6dnc491QWoKttDLcplv3DsAV/922Imy9EUyVbVPLdN1bWkmknG+IlxgzIa1uX/7colfnUN
	Yjup0MPq6FKA1SDEZBEhIcr0rEGRWWzsAWsrMwCjbN
X-Received: by 2002:a17:907:894f:b0:b9b:e687:7ca7 with SMTP id a640c23a62f3a-b9d7279aa56mr171138666b.50.1775823476192;
        Fri, 10 Apr 2026 05:17:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:5694:dea1:688f:6eee])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de8d69fsm74881666b.4.2026.04.10.05.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 05:17:55 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Fri, 10 Apr 2026 14:17:45 +0200
Subject: [PATCH v2 2/6] ref-manual/variables.rst: update COMPONENTS_DIR's
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-staging_and_packaging_vars-v2-2-211bce1349b1@gmail.com>
References: <20260410-staging_and_packaging_vars-v2-0-211bce1349b1@gmail.com>
In-Reply-To: <20260410-staging_and_packaging_vars-v2-0-211bce1349b1@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775823472; l=1005;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=otr4bLGR0fykE/z/uDupEVzgjTet0FChoU1tTgk5lNY=;
 b=vjtYx81wdfdrD4srxmLdlQqY/LvRmMlAxRKWI6UTdSOxfc3xWMcypMpgUlUB0h62UFN3PQABi
 UzodKmpoAeqD30aPue5ffXNlg+mL47njnBDwHhVGqgxDPI1IbeKFh5l
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 12:18:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9225

Make it more evident, that it is first populated by files from
some recipes, and later used as source of those files for the
others (staging and sharing files).

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 7f19723ed..e11294c6b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1712,7 +1712,7 @@ system and gives an overview of their function and contents.
          (set via :term:`RRECOMMENDS`) are always ignored.
 
    :term:`COMPONENTS_DIR`
-      Stores sysroot components for each recipe. The OpenEmbedded build
+      Stores sysroot components provided by each recipe. The OpenEmbedded build
       system uses :term:`COMPONENTS_DIR` when constructing recipe-specific
       sysroots for other recipes.
 

-- 
2.43.0


