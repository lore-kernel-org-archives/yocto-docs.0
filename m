Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A969CC78835
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 12:40:39 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.17242.1726836032444185909
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Sep 2024 05:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xx+ggnOC;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: simon.eu@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c42e7adbe0so2160817a12.2
        for <docs@lists.yoctoproject.org>; Fri, 20 Sep 2024 05:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726836031; x=1727440831; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4qzw2hbuTGeOj7nSGn/XFEg5FMN7Dxv3FCmUYti29Bs=;
        b=Xx+ggnOCpus2tMJ/oTi/NKv+2nNSwHh5Zm+7fUlPNRxo8jfcc+6yaAyT7cSaw+pxCQ
         Wik47OnmDQW1emCI93MiR1Bpf52xakDDB9yHUrg4kDa62DixZdOPrFLaffkx6WaOzSJG
         dQ/xn2wfbEgvTL4QI5QWESe3md57xIjijuQLt3lzy60o8N56e1quhdpZkf3SrC4HT1Lh
         7hCl0H9Vtrhf9U1vVHhb8ynXY1lBei/MFwzIegORIApz3nOMnUUhSLwqPJUYkFGSNMUH
         Qgoz3echXuVONuvPHGlLp+N12aSms2TWU2IZxnFhTpdxMPXGDrFg/3AamInabn9p6rr0
         untw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726836031; x=1727440831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qzw2hbuTGeOj7nSGn/XFEg5FMN7Dxv3FCmUYti29Bs=;
        b=I+Y6XYSQc1rLti5sVnvROwGQvjbBv9OeUsGtITvnfFTtm0sCVS25pHRcLfMg1rPb6V
         L81LLjKXrmxHgC486m9AGEfhwuW/Oyesh6FnuZHRvQF+hh18MOFpMy3xJnIU+gl0EfCg
         Cf7XXd1iVdQtaGzkM893Tp9fsM2fOtDVXVS84hyWRi1ulhjlNH1vBvLREq+hkSZ8Hi8j
         EXRnd1PseGfu84nKvsbKBfCcQvKgu9U364ZUFM2stHUUQ082LBiuyFaqyXgQjKfRtf9Z
         MeF/Z/A5fyxCICAlaOaXzHS3WVM/X9j8A0sETZRf4ElzVrURTwgV3WDeH2cLHUruA5iW
         ZsIg==
X-Gm-Message-State: AOJu0YzeggMz8R/qZg+onTT2z+CE6BKLrG7XbELFOxioyQO9V/VwGwhL
	JfPREBmBgXLfOM56tYOG11ceCKS6haOz3MEjWMhAadKNsdOCSADm
X-Google-Smtp-Source: AGHT+IEtNy1GqA3PM/N1DQdrUHyTgo9DZZCd8HEj+3+CwGs04KcaRQyZCmOnAgcf6lBvsT/2EZmKQQ==
X-Received: by 2002:a17:907:96a7:b0:a77:cbe5:413f with SMTP id a640c23a62f3a-a90d56726bamr227953566b.4.1726836030517;
        Fri, 20 Sep 2024 05:40:30 -0700 (PDT)
Received: from simon-T14-4TB.. ([46.140.188.244])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a90613303b4sm839002566b.213.2024.09.20.05.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 05:40:29 -0700 (PDT)
From: "Simon A. Eugster" <simon.eu@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	"Simon A. Eugster" <simon.eu@gmail.com>
Subject: [PATCH 0/1] Clarify that _ and not : is used for suffixing the variable name.
Date: Fri, 20 Sep 2024 14:40:19 +0200
Message-ID: <20240920124020.2894006-1-simon.eu@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Sep 2024 12:40:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5361


Simon A. Eugster (1):
  bitbake: doc: suffix for BBFILE_PRIORITY

 .../bitbake-user-manual-ref-variables.rst                   | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.43.0


