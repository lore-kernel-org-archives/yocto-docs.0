Return-Path: <bijak.dawid@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4703DCD3428
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 09:14:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10753.1777626883087895100
 for <docs@lists.yoctoproject.org>;
 Fri, 01 May 2026 02:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kwRrU5v9;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: bijak.dawid@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso15517725e9.2
        for <docs@lists.yoctoproject.org>; Fri, 01 May 2026 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777626881; x=1778231681; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tnd5tMe0mzHOFOqdiub+GjHo4JwZADonyrUyx8I5sHk=;
        b=kwRrU5v9w9wNN8AuSt1TU5pnVdYyxMdsuDETc23I+gZEfWuUXj4Qw3SsbusQ+BxVSy
         TwdorCwdrSwYOm1kwCkKClLWTMjxzraQ10MWiODw/HKodyXjdpqdRta7Yz5iG5lcPfS8
         xdI5MeR//hxlncmSwgzchAkOakkpe1XhunSg9MLk5Z2y4Y7YDrUgYLbIUcPVshV5igsx
         i0i79WPBPVKtfrfwFnkDahIMau9sMeG1WqBnUbRacfvRuniqiWnayE/yfQ1GNpyTHcZ8
         YKzJSJGQ5Ib5kBaK94rJTayirRkQLFoYD0DExuoEgzHc8jmhSFqXX3Ezw9wkp/83yt9u
         bCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777626881; x=1778231681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tnd5tMe0mzHOFOqdiub+GjHo4JwZADonyrUyx8I5sHk=;
        b=lCv51BMy+ZpkxEFcWfw8eOBCFF1ojocEcM1XxUpTIddUHVmdDgGmyXSrArdC0ZUrq+
         3PGnniteFxb8mdiX3kO0eoRTKgjgrNbR2vbNsVHfHDoZ1xG8RU8KsUtmwm9jc84oM0DB
         tzOfy1UAb1HDC8sdpBEyxfSQG4OGG2nT1ilPoZP3ss0YWrmZBbm7ca/iIERWDAfxIGUm
         OBBdm36dDIJ2TbXp4tsK+ID84OF3w4tOTnPDf7w1PPRPaU9iBFvP1r/tdgsI9VEnRdgt
         Uitq801DzzjNw5hGGF9b+O8dGgaS2+DhFhzBsj7tAezGi/iulXbiYOR+K+AlvZOKEWLd
         7v4Q==
X-Gm-Message-State: AOJu0Yy+yKegpx4HjHHgn3WKUZ7TM3ZCYRnHJot4ej8Uw0HioUT4yxCm
	FLnFsAknwSGdfy0L5ITR0d/EdHLjmbTNTiKC9tTeSTA7FcJERAf411Fp
X-Gm-Gg: AeBDies5H9ia2Cu0aqz3GoEpw8gJWbZHH02QNs8rR/76hgROiAX5IYXeLhbWtgdfn4C
	Z4Cp9xbSxC8ocoRYUf0UXdCyuq7rtI0YcsVkmbmtauP/mLNVQDs72B5i86709XmDbGgvnhZ8TQV
	mjeCdoDX2C9hbIuiOCXmw9T9D020pRGSB1NfuzCDoCwhr6sS0R5x4c5iLcdycn3+biZ0OfkCNq3
	WqdsDuE1uFeKfjIe20Eqqu2reTnZQNcG9NcQhxcH2cXH0WG6PyH6MoAOI32OX9sc9c+zYPLuC1w
	BlqAwV/TnOZ1RihZLGGdCMUsJ7j4D706qrCZ9f0XGQVEAH0e0/8rNDkiXx1oPt0Vy1+hAj/DItG
	QJx5hPOyZ74mPkn5lLzWQnZoeJbbPO+1+fX3xTsXiG3D9LlYVopQg2kK6TYzpkUsk0PuMsfD3Q1
	VBkMDRHvTnMMH1q8pEs0ZrnTrYkK6s5IHE2N/kZRzrgxculp8t02aeY8o15N1rEpWFV/qKf6kDj
	GsSN2phpPQbwuQgYQe0CxFTkK07ApDUNzjhUVo2zLAmNDWmd3+sto1maKGFWSM=
X-Received: by 2002:a05:600c:c174:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-48a84468397mr100076575e9.17.1777626881503;
        Fri, 01 May 2026 02:14:41 -0700 (PDT)
Received: from thinkpad.fritz.box ([2a02:8070:d188:380:6a5d:7450:e8b3:758])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a8fe953besm12097955e9.2.2026.05.01.02.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:14:41 -0700 (PDT)
From: Dawid Bijak <bijak.dawid@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	quentin.schulz@cherry.de,
	richard.purdie@linuxfoundation.org,
	Dawid Bijak <bijak.dawid@gmail.com>
Subject: [PATCH v2 3/4] doc: bitbake-user-manual-metadata: explain inherit_defer example
Date: Fri,  1 May 2026 11:14:17 +0200
Message-ID: <20260501091418.76994-4-bijak.dawid@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260501091418.76994-1-bijak.dawid@gmail.com>
References: <20260501091418.76994-1-bijak.dawid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 May 2026 09:14:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9391

Add a short paragraph describing how the inherit_defer makes use of override
syntax to achieve conditional inheritance, and rename VARIABLE to
VARNAME so the example uses the same identifier as the preceding
code block.

Signed-off-by: Dawid Bijak <bijak.dawid@gmail.com>
---
 doc/bitbake-user-manual/bitbake-user-manual-metadata.rst | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
index b886e0578..0c7c3ff99 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
@@ -832,8 +832,13 @@ Here is an example::
 One way to achieve a conditional inherit in this case is to use
 overrides::
 
-   VARIABLE = ""
-   VARIABLE:someoverride = "myclass"
+   VARNAME = ""
+   VARNAME:someoverride = "myclass"
+
+:ref:`inherit_defer <ref-bitbake-user-manual-metadata-inherit-defer>`
+defers the evaluation of ``${VARNAME}`` until the end of
+parsing. Assuming ``someoverride`` is in :term:`OVERRIDES`, ``${VARNAME}``
+expands to ``myclass``, which is then inherited.
 
 Alternatively, you could use an inline Python expression in the
 following form::
-- 
2.48.1


