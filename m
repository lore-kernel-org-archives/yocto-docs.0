Return-Path: <elmehdi.younes@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D77AF8A151
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 09:25:22 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9672.1776331518527787888
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 02:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VWpyOCx3;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: elmehdi.younes@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso72862685e9.3
        for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 02:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776331517; x=1776936317; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nvl2Df0x9MdzEv2qIEAXaySedLa7ukV4W6rIfQm/wvY=;
        b=VWpyOCx3AJhSySwXQ7Og7HDS0n/22s56kGOD5G5gNMIIckx7PYI6jefEsj3fiHi7cS
         5FS7nnzNxTvQELQgVDFpl0keUFE0qD1LTtXl+maAVPx0lIBDFomh8qDLbXcBPdLMZD8P
         MQeCRCk/HnDQfF9BlfG7r5AIxyggR9UoqgBQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331517; x=1776936317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvl2Df0x9MdzEv2qIEAXaySedLa7ukV4W6rIfQm/wvY=;
        b=JzXzN/L0jY07FhkmEGbm8yIuITiHVZvzaMmxlKUe6R0DQ5x+OAG+gHSGLBtguIu7Sk
         KjIOJipeOeqZc7HG4sNF1ch5qZgssg/IaFe0ShznP1MO/XZ+PGOZBaKlDd6j541yH1gH
         +FkqJcnOgBGG+NTripHGx34DgvWgFVfIHAHCVYYwG1zjt11wMQTSDJMR5dGJP0mHh5un
         4qHfLDZSHqyCsSDD6Ih7Y0kLPHU84e0q4IhR95Rt4O1eEBszFm84l3oEfcD1O7XbM3QV
         a2N/PRTDZ1mLF0+RwZAVIeWAy/7v+RI41gZqhEGVfIQrzGJICPK6jXmn2t+VmzOhYOCW
         twgQ==
X-Gm-Message-State: AOJu0YyMO5xX3o9H7H4vHBSMugihKt/awYl9hociujNtivywvMc3lzXo
	hzDwOBRgWLlqMO/Lgix13Hwspi2mw+o4lXtUflPFNCxcPhJbx6ePjd3oHBYAi9XteGYyf6pgbWf
	jmsiaxIo=
X-Gm-Gg: AeBDiesy2ZMkV9Z7GelXhZvjCaAlH9UE8CY0wpcVk3HpeIrgcmTveWGpEw3OKf2LETr
	wGE/arqlu+C7zvaWXvqv8jBl4m9DTDSbDjsJG96BrFIyFh9EZZwRgwGiIMUoIDbisuEvxwr6vzx
	jBuW2fpZnsDRHkptgBQTEVWC76e6tt6gD9rBRTLsZ9bCUX2Q5k8IhjIt5YsqxV2C0NKDjID9qU5
	rcrs/gbLBj193F2rqJ0wklMhd4BU+mItiLdyrqQmUmVCpouBxxPH1Fz0mRW935++VNOE8WO+sxp
	dUf4q2+exbrcA7+oUr48Ygx3TyCdkyUPdSB2Wx493gXmJ8ycJFAre2zyip8idw+jVrcGVtZOHDH
	IxxBR3szwM1a5gyiRxuU4G6iq4fGoHcLZlIeao3KZz9EVDF2mpEe11Zc4ved+hmM/doUXKUsFiL
	6AbM1sbFsIQpIDsU7Fm8ECKx13lSN7JrSpqlrtHqCxjFIP/Ml5+2PSWJrRnj4+djhDu4UnhyNQS
	3Rc4df+4JNeibyN+Knfy/rQ4MrvuRe0
X-Received: by 2002:a05:600c:19cd:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-488d67e3671mr345093735e9.10.1776331516634;
        Thu, 16 Apr 2026 02:25:16 -0700 (PDT)
Received: from FRSMI25-BOLET.. (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f0a62cbesm43631165e9.12.2026.04.16.02.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:25:16 -0700 (PDT)
From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
To: docs@lists.yoctoproject.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Subject: [PATCH 1/2] brief-yoctoprojectqs: fix the allow root login command
Date: Thu, 16 Apr 2026 11:25:11 +0200
Message-ID: <20260416092512.99054-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 09:25:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9255

The 'bitbake-config-build enable-fragment' command requires the full
namespace ('core/yocto/root-login-with-empty-password'). Passing only
'root-login-with-empty-password' fails.

ERROR: Fragment root-login-with-empty-password does not exist; use 'list-fragments' to see the full list.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 documentation/brief-yoctoprojectqs/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index e1fd9543f..63ed583dc 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -289,7 +289,7 @@ an entire Linux distribution, including the toolchain, from source.
 
     .. code-block:: console
 
-       $ bitbake-config-build enable-fragment root-login-with-empty-password
+       $ bitbake-config-build enable-fragment core/yocto/root-login-with-empty-password
 
     .. note::
 

