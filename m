Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA91E7719A
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 22:20:35 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.5638.1736461232889168380
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Jan 2025 14:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PVCkwPGd;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436345cc17bso11518105e9.0
        for <docs@lists.yoctoproject.org>; Thu, 09 Jan 2025 14:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736461231; x=1737066031; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PId356bY6gFFUNmSD8n8li+HAjEo2d73HBvadglZNI=;
        b=PVCkwPGdwgxRQUFttI0RTace66ZvPBu2wLe2DnWT/OAggCtGebaWzXr1EDoDFb5PtG
         1oJIM3p5fLAyRwKcShm5ki/1r6bmEJbEL5+zQogtx9XCT1ePKUES7M6bzW9mgsoYvE9a
         blBVKbDfk7u3tu5KozkdpPqh9TP5OttZKyymQvcMrvHpFlv0VBigbaYMu4+dNs1guplV
         JS0akuXXkBxjPJWzRWvVl7wd1mbBegGgdjWolGFQ0wV9uAhJWnAtS8Dh/6ztM7XOnr23
         bRmnATS6sRV3QUEu//lk1xgcRe9DxNE072JRwV95uv3BNtl/QCVCOiJT9Mg9NjCj3oOY
         BNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736461231; x=1737066031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PId356bY6gFFUNmSD8n8li+HAjEo2d73HBvadglZNI=;
        b=cHSzcTgLaY9REk1ShnTSNJcLl9vTJQa0j2OL+voBtNR47yL4BRUDImkdeBUvo5DylL
         VpvFd3TwRLfk/BmvGq9iVN52AvmoX2jzO7H0RBokOnCD9kGY//MK3nfa6WVm1USc3omy
         134TVrXtWUsP9YQfiH3wO90YMj9brRrRIWP7mGSRbbX0IqppnABPVuxdcml5f6Xo0uDA
         iNSf1iViefAM+1MXKlDIAAw6IVTBRgr0YES+KfcFRAKdsyUD3EMav8m6+ix3+YXUbiky
         YSaJJ4qLR/olPRYH5uXTLVwdIru3XL42v8JOJl94eFzrBLabQxgCowEts+eZfYQfi4Sg
         LtSw==
X-Gm-Message-State: AOJu0Yw0rs++0XRYyf8hM60nyeGitOGUZgAoZ22cSICtxMMCF+75vzbD
	SK94RKfr18E5k/i5eth57FpYTDOFPMnMZBS64J5gZLyn/zItIp94GLiMWA==
X-Gm-Gg: ASbGncswGw1sproztL3pSd8Se2+OVPul5wMAKONWW2GSu70jX7CKcsEuc36s9AG2HIL
	L44+yzVZPmfsH1sVThk+YWOebxc1q/X3cvQZ2qCrIYLAHb1hu6awaHxZk/FQaQ81eg40r3hf6uI
	/fdp+hP3NDuakX1iEWynMODll/0hXXrgRIUrsFUXMUrN5j/ACoUovOa/nbksN7sRgBhzDlVq2Op
	5T2AMDDPFNu+x2287W3PJQvBP6YwTKmPEDN/WVVIt/4MABd0iSE8/upOKUdDAfALI/lZxDRNmBQ
	qS1L
X-Google-Smtp-Source: AGHT+IGUCPtGqmXY751/cgGYYa5PUudbgW4qi1WnF2slyJVuwa+DNv2K3DNy4z7Km+9C9mwHFeCi5A==
X-Received: by 2002:a05:600c:3588:b0:434:fdbc:5cf7 with SMTP id 5b1f17b1804b1-436e26f4aecmr69080685e9.27.1736461230819;
        Thu, 09 Jan 2025 14:20:30 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1dc6sm2853265f8f.96.2025.01.09.14.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 14:20:30 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 3/3] sdk-manual: extensible.rst: remove confusing post-install-logging
Date: Thu,  9 Jan 2025 23:17:21 +0100
Message-ID: <20250109222015.12658-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109222015.12658-1-adrian.freihofer@siemens.com>
References: <20250109222015.12658-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Jan 2025 22:20:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6078

This is a fix for 22dc5b3be3b1fbdb9447999b71f79db055271826, which has
completely replaced debug-tweaks. But in the context of devtool ide-sdk
and the comment in the example, the post-install-logging-image feature
doesn't really make much sense. Therefore, remove it.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/sdk-manual/extensible.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 3733997fa..1cb1bb47c 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -658,7 +658,6 @@ The extensible SDK supports two different development modes.
          allow-empty-password \
          allow-root-login \
          empty-root-password \
-         post-install-logging \
       "
 
       # Remote debugging needs gdbserver on the target device
-- 
2.47.1


