Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD65C02181
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 12:53:33 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.29458.1737896004708036973
 for <docs@lists.yoctoproject.org>;
 Sun, 26 Jan 2025 04:53:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b6YtC1/u;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43618283dedso37413835e9.3
        for <docs@lists.yoctoproject.org>; Sun, 26 Jan 2025 04:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737896003; x=1738500803; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gxnE+T1AM/ZbC8YitEn0XbwBj7VGSybl2qNOAUTAJgY=;
        b=b6YtC1/uWKaHWEg2O+1w0Fvr3ZWv5d4oJko+X0i/dcaDXVdmF1LNDVsN6A+sa43NTC
         VF/TPwKaoynyFrlbNcrPVZ58+7ijHFm38y5HF1F336K+0NmKjBskDxevdkrFFs/zVNy5
         cd+/jTfHI3faBWiQ/duleTLVfklMFrGUx4fJWn1EcLhpcSg665DWoCEnr6zNNKZxTODg
         /s7Hv6vF6E4jNJr/hJ74dwCXxyV5aYBvrN/0X2bzf1PgLSXCHxTlLcfGo6Y9bcSo9Ka3
         aEO7VTAthfJS5I7dEzPSsR+a3AEFyjz1QEmpXPxUZ9G7YhHl8Rj7Lh5oeUmoDQPY7OAq
         Xgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737896003; x=1738500803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxnE+T1AM/ZbC8YitEn0XbwBj7VGSybl2qNOAUTAJgY=;
        b=w/N10dlFFyQ4ECPTAbk+b6RwWnRuIld1i4Z9edtM1upzOQbFzrCQyrLlHyR+3HyQZG
         M2jewvMrk2m+0JnLR8b7uy/IAYWHkw0p1zuTH+lkqKuH4V5tOhK9bKp3LdFJyuwIS0pQ
         sWUo+UqW+8lQlwZcaq3AlDtu4liA12h2xs1G3Wq0GsWEPNFIj/yr5FR5LqMagRw0JiTB
         Bgr+GMj212kF9vuBXXYITWQNVMMCFjjxx6AP56hdHTTCL89LWEt9ximJQN75Fa94HDr2
         mFTRDpy9k5suPzk7Lm8IdJECmOO9fRymcgh76AxLEsEeY4PQ9XPUWjASvZfMkowmBejP
         V+uw==
X-Gm-Message-State: AOJu0Yy8tLIE2FKlEYQCh/AD3PJd4oc4sswCVMTHSVfIemG0nVrkteus
	SDdrLJvXiHbLSm2gfDVyu4ZzbV9o0IYU/q4wBhe1LbikoBMGPgMXxOK/mQ==
X-Gm-Gg: ASbGncusgYZB2OzJsbFBo6Wg2EiTVArfyGdnuYgGuIChYUSuRpep6HTsdSnnxyMpX9u
	mmnPUO5GqufKhqfjhVHOSIBGMDUSHxVaLCzan2UOePF99b/jPu3o8Sle0q8T4kUQuJ38wY7ZleQ
	Pix7cwH2OsQlvjmy8lWpMXusOkA46Z1PmZTQywNlO/m5zlGZyhPTnZc7d0je3TXDfrcUqY0f4IA
	XfH5IUngCvup7rGlCqVWRATcU6u3KWXDuMtxvK1tdL8YlDXWrw52ALKbmenv5/18UN66hW6bFor
	DnYRN78zp4gOIRiioybzGC1RhFk=
X-Google-Smtp-Source: AGHT+IFcUu9xaXyr5kje0PAvb43wQZtiTbguipBmHcKdGDRFsZKf0VTCdtwnszVXkxEYXcXR3BWqaA==
X-Received: by 2002:a05:600c:1c0f:b0:431:44f6:566f with SMTP id 5b1f17b1804b1-438913deb12mr319718705e9.13.1737896002621;
        Sun, 26 Jan 2025 04:53:22 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4d33f8sm91791075e9.38.2025.01.26.04.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 04:53:21 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [scarthgap,styhead][PATCH 0/1] docs covering pick devtool ide-sdk fixes
Date: Sun, 26 Jan 2025 13:53:12 +0100
Message-ID: <20250126125313.1454763-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 26 Jan 2025 12:53:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6180

Related patch series is here:
https://lists.openembedded.org/g/openembedded-core/message/210279

Adrian Freihofer (1):
  sdk-manual: extensible.rst: update devtool ide-sdk

 documentation/sdk-manual/extensible.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.47.1


