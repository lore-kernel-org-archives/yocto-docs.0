Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB478D111BF
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 15:55:13 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.60975.1730735704281571620
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 07:55:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=K4CtybOz;
 spf=pass (domain: baylibre.com, ip: 209.85.128.41, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so37689155e9.0
        for <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 07:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730735703; x=1731340503; darn=lists.yoctoproject.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjc+cCaSrTj6YRBRbSTWLWixNioSKrrMjhlnx2xBkBo=;
        b=K4CtybOzMRCJUTLqeslLyYpsDWOmQ9F5Uyt7sioq45S1ixloQEw9XrwXQzLAymb6cC
         sZ4CUNA0PC3SzkGasmZ3zs/xncmUekIXMRoCS9HFx3FXK5JCKVFq5gp63Zs2Vce+j+pJ
         KYNRnLN31xziNE9Vr5o8tOBVZn+ZEECeN6DM4TK53DaBx6jXusJsRnoT9G9jeTwfL7qX
         W3DHI3D4HgQLHJFf0Y8fQhZVlNwnirOlLdaSNAVROI3uz2sCakyxc99S6pc1ZcavF052
         ca0QvDYUobiUo8EFR96c26lAPxgQD6gkNXELljlp++nKQq41Du/4YO/SuXH56Dq/BEIf
         u9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730735703; x=1731340503;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjc+cCaSrTj6YRBRbSTWLWixNioSKrrMjhlnx2xBkBo=;
        b=to95Qayn7ihU8+BIGhG3G/HWuMSRHnUuGV/JwtUCvEnOYSk/HPIv6Z2Bh8WETTfEIO
         UGRWexb9nAs2sGBMZ83QSsvU0ilyVttUYT1lJMtCs7YhnxmxWYq/f94k9gnTHNVIpNHV
         YnJM11JvLKDaiYoOdsMyar7I4MWDa7Ba7e9i8SuM6n910iKhqz7UJF7JMnb8C5ITXfvj
         jhWgftAsjeKXRxbEu7d0lkUHPSPdKK2vgUdEdGeahVlWjXkfd4I4L5aPpufx+FJHnMHW
         ORhUkeYviNTXfjNSWc6CmmbJ/3KvFSBysxMDTbVdBv/UQK5kMvFbeY1UcxgF3g7m+zit
         HKdQ==
X-Gm-Message-State: AOJu0YxnOQs4/j4JOJDUeTKZ6DGmIgm4L5BasOK0Vu/BnVjussLoMktE
	Y6UDTQ8hNHv/qaAW2n+hOiiVL1CRHOl6YMOZCenm5Llt2iLulnprBe6gFJBI0Xk=
X-Google-Smtp-Source: AGHT+IG8kai7OmslVfvmDI8gddSpOh4/DkoJFaoH2wiupbJ9aI08Pd0SmCC0EOysL0OFF5Mx2K/aCA==
X-Received: by 2002:a05:600c:511f:b0:42c:b037:5f9d with SMTP id 5b1f17b1804b1-4327b6f466amr149059495e9.3.1730735702758;
        Mon, 04 Nov 2024 07:55:02 -0800 (PST)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116abb5sm13472315f8f.100.2024.11.04.07.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:55:02 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 04 Nov 2024 16:54:59 +0100
Subject: [PATCH v2 1/3] styles: vocabularies: Yocto: add sstate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241104-add-bblock-documentation-v2-1-0704e4d59929@baylibre.com>
References: <20241104-add-bblock-documentation-v2-0-0704e4d59929@baylibre.com>
In-Reply-To: <20241104-add-bblock-documentation-v2-0-0704e4d59929@baylibre.com>
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 15:55:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5664

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


