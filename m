Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3905CD44D6F
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 13:54:57 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.45992.1730901289374496062
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 05:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=AAKJxs43;
 spf=pass (domain: baylibre.com, ip: 209.85.221.49, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d4821e6b4so4138192f8f.3
        for <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 05:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730901287; x=1731506087; darn=lists.yoctoproject.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjc+cCaSrTj6YRBRbSTWLWixNioSKrrMjhlnx2xBkBo=;
        b=AAKJxs43m2AmdttlJAg5cnS50rb6C8Ld3k+27EtTSVNID4zbfnYGYM8DmmWqFR4MX+
         LNY8EnHyIPaQqx6ORNudkOiUj5saFPqCGDfAHA96ThULmtmNCf2O2aOwcemfKOpLmlP1
         BVjaJOLfLdceIOaPigMTpQCtL4C1MVcIUun44g2zSKdivBHCSXs+il70LSNfS7sQKqnA
         jwQPZXArNycbOdGwYXJJXyHZhgh2MBNMr9PemjUfGa9Xh/62pdb3ApKm5VpunH0iXK/d
         +6kk0aCV2nYWSLO5F4TSvIfCFHXF9RjiscUct6roIbbcp0f5PXrOD5QlXJ3jWEL2h0+y
         FWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730901287; x=1731506087;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjc+cCaSrTj6YRBRbSTWLWixNioSKrrMjhlnx2xBkBo=;
        b=cgPGq1OY2JOu7mePYd04OxnVRhc+a7ywbd6RAGfXtoEgNuy+iqj3dGluTJsdv8DYk/
         OKjOPWcqthIVlawU4Topnj8lU0bU5A4iKl82cbCn3MJY+BtOQQ6Q0ea15FNX16J8GddU
         0+THuPRmnibjVAXkI0z2P99T27I4ffDV/3xuYm/i0aZXZWUjBPzmmfeY44kNnSfcDfRx
         eBd0e7yv3K/xOAdHKQdhBw/wNiBxEXaUaaZ2TafrQ0PXhN4KWiilLFeCjsMrjh+NlU99
         d1VQjtxlaKwPW/LFGkGrus+P9EH3MOcpgCPkfpttUA4NZzEWKTS7ufxP3sfzwA6AkBmW
         wmrg==
X-Gm-Message-State: AOJu0YwTK+wafUns22ns5E4ZfhoZsb7blWhjchMTnEkR9u/LI4kaYG99
	fFsnXi7qtFTKD2o7Zt87i6exMUSeIYEBCwkb4VhIA7az+DRHCiTbIun+oOkGrwb17rxvzAE1bjQ
	uqL8=
X-Google-Smtp-Source: AGHT+IEQmLbUoSbbr+hurEzIyVhRxCUsdFtXt7mS/hcLY8xzo0OArjtl9Oi/Or0hW8iVbZFmGUe66Q==
X-Received: by 2002:adf:a414:0:b0:37d:54a0:d0a1 with SMTP id ffacd0b85a97d-38061206ed1mr25095602f8f.56.1730901287479;
        Wed, 06 Nov 2024 05:54:47 -0800 (PST)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113dd7fsm19402750f8f.70.2024.11.06.05.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:54:47 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 06 Nov 2024 14:54:45 +0100
Subject: [PATCH v5 1/3] styles: vocabularies: Yocto: add sstate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-add-bblock-documentation-v5-1-625806c6a3ce@baylibre.com>
References: <20241106-add-bblock-documentation-v5-0-625806c6a3ce@baylibre.com>
In-Reply-To: <20241106-add-bblock-documentation-v5-0-625806c6a3ce@baylibre.com>
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 13:54:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5699

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


