Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11D5D12660
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 08:17:57 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.13195.1730794667041813625
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 00:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=bVNwJp+9;
 spf=pass (domain: baylibre.com, ip: 209.85.167.44, mailfrom: jstephan@baylibre.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53a0c160b94so5689763e87.2
        for <docs@lists.yoctoproject.org>; Tue, 05 Nov 2024 00:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730794665; x=1731399465; darn=lists.yoctoproject.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjc+cCaSrTj6YRBRbSTWLWixNioSKrrMjhlnx2xBkBo=;
        b=bVNwJp+9VZVu0Z8dvGytukZqsJ+4sF1CCxZhoFZRnpZ3uxX2EN0mN7LEbi87YqHigr
         VJSrg6hDAUmOGALq2RE29FlzGtBrOsk2fXsse4JjIyjNOSt0yO4oRC8nl2BK0sh6t5sw
         z8TYDf1O3DP1pp0ugPr1U0TaTGjLlkdBtNkbcb4IXax/p03ftepxEu5ear2yv9XOOsig
         6Eyp6dDfOOdeN95Pcu0YXgDZzKOfVThn5z42zrouunXleztKXyfUHMaEWIrhCeSap0OF
         gWHMv8KKBJJUun2SVtblb/MLt9mf2yManqnkJrcto9kEBA18D7xdsLDiw11gM342Z18o
         ZoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730794665; x=1731399465;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjc+cCaSrTj6YRBRbSTWLWixNioSKrrMjhlnx2xBkBo=;
        b=UxfW5Y4WzBN3A/fExxep9qp5zayaEVmTknrtoEgvtpfAnFuE3GVIbamJ/zKb9S9PKr
         LHL4kRUiLvoGBwbwezUBDrckZlrP04OW9XfV4ZoWwr//pgQiqngosuqYs/WkSRVp48+6
         R9+0/diIkFvRbXdHnit8DDntRtzyG04fd36wknWnt3wtVS7QRdqdFMB5Q4SETOJFtrrO
         V3HrTevVD1b+q1MhiRFNaanrp2Chfo1udWgtioiDBj8pfCz35rfOb9jekpUz3bbZwRHi
         vYzszB8lCGF3WsHgHlfh0vCTwlk3UhIixiF0HLQYO1YIrhmvCZTFTPzjmNBP/eDvPrae
         wFKw==
X-Gm-Message-State: AOJu0YyS65VL59WzseIuqOA04IuLtPU27v6qmPd32qNjNfPQ5MGNX1Dn
	f+KrdxnLbSK3qbGE0+CPMwOXCtd322MUVTl+/XyxxZN+e19YEFS5YziRLRhA7vE=
X-Google-Smtp-Source: AGHT+IH3oA5XZ5orylj7RAyjbJWUzvO9N1XuLTeLoEJV69tvHnMK9IV5iftBVI4ERYz9bcl9nWJPBA==
X-Received: by 2002:a05:6512:2244:b0:535:6942:29ea with SMTP id 2adb3069b0e04-53d65de556dmr6059788e87.11.1730794664990;
        Tue, 05 Nov 2024 00:17:44 -0800 (PST)
Received: from jstephan-bl.local (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7c38sm15318341f8f.24.2024.11.05.00.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 00:17:44 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Tue, 05 Nov 2024 09:17:35 +0100
Subject: [PATCH v3 1/3] styles: vocabularies: Yocto: add sstate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-add-bblock-documentation-v3-1-b870ded39a2d@baylibre.com>
References: <20241105-add-bblock-documentation-v3-0-b870ded39a2d@baylibre.com>
In-Reply-To: <20241105-add-bblock-documentation-v3-0-b870ded39a2d@baylibre.com>
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Nov 2024 08:17:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5673

Add sstate as an accepted word to avoid errors when runnign make
stylecheck.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 documentation/styles/config/vocabularies/Yocto/accept.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/styles/config/vocabularies/Yocto/accept.txt b/documentation/styles/config/vocabularies/Yocto/accept.txt
index ca622ba41274c892f1fc1e16d8332a02f07a3531..7fedda8ae23c22f3660292faa0a1c3df23da353e 100644
--- a/documentation/styles/config/vocabularies/Yocto/accept.txt
+++ b/documentation/styles/config/vocabularies/Yocto/accept.txt
@@ -2,4 +2,5 @@ BitBake
 BSP
 crosstap
 OpenEmbedded
+sstate
 Yocto

-- 
2.47.0


