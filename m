Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB32C78829
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 11:38:29 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.16177.1726832304651471510
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Sep 2024 04:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J1AohNmD;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: simon.eu@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c255e3c327so1968887a12.1
        for <docs@lists.yoctoproject.org>; Fri, 20 Sep 2024 04:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726832302; x=1727437102; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4qzw2hbuTGeOj7nSGn/XFEg5FMN7Dxv3FCmUYti29Bs=;
        b=J1AohNmDUaHMycdo5N8hwQ72IrJiva+mHlBwTN4Z3uUV72BTq/7i8jpkp7W0joTG3t
         1Rbx597EDRXTBHxDY9TGLHzmruC9xaSe/n57G8HrN7Hv/56bgZM0c0X2lskwmYf7klXf
         202Mk1uWTmXq/ajbpkKrCR4L6HGC5V+kKyDFkNnsnJz4Gj0ykYMNRnAEzxCUhF8fAr5p
         5J4hSBRLqaPqSGk6pmjbH0+BPxkvQVd1ebLaO3bLZbb2+/OGfl6EUxACdP0kH8974kaE
         Y+CIgz2P7O5KQttpGAwIH/v0/b5WckA69PfW1khxj1NCcq/fAClZWOAauyY6Qz3G+sUD
         cspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726832302; x=1727437102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qzw2hbuTGeOj7nSGn/XFEg5FMN7Dxv3FCmUYti29Bs=;
        b=LRfSJ6l4tEgZaRaQXES1nJH03lRgGBircfv/KF24Tyllqjb1TCGWI4AbvDvP21u9tr
         y5ENCGKUmJZ13VtmV1aJTXkYMYZ6+JIJTuJ0iTvSDKTc4MpxWFiG0AJa2nBNOwyDHwvk
         l59CNt+igoq7F7ZQqJAyEqpoi/g2iPDoFbVzkQjaLKOOWTMgemmQtVeA73MNDGbZl4fv
         UkP5lVkPtquqQ58nUIjkDd37FrNZYNZ/xoqk/YWUn9oweOK3KyAZSpHQOoI8ebXxwZ02
         BsNiubQ9nskOQuQQWIO0dbm693awrsF6669ze+Oa8iakuCH6wr6K8MMborO2vGWNz3CF
         T0HA==
X-Gm-Message-State: AOJu0YwXu4bW0hScyReko4Dw84ybsaaKiRmztUiBcwbFgAHov4K+Bh7X
	pAjH7dZVYk2/KDr55mljBf55tBY84qOjRKShyenbiqooQfwoqUxLNQhTnw==
X-Google-Smtp-Source: AGHT+IFgmOLw2dsNk6hY4GWWYfrSXZGqw2ORTrr9LbCKl62d2vdeR8KADDI2auJsScXNuxMrHboaHA==
X-Received: by 2002:a17:907:e699:b0:a86:96d1:d1f with SMTP id a640c23a62f3a-a90d4ffedc3mr213542366b.26.1726832302318;
        Fri, 20 Sep 2024 04:38:22 -0700 (PDT)
Received: from simon-T14-4TB.. ([46.140.188.244])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a90613304dasm833813366b.197.2024.09.20.04.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 04:38:21 -0700 (PDT)
From: "Simon A. Eugster" <simon.eu@gmail.com>
To: docs@lists.yoctoproject.org
Cc: "Simon A. Eugster" <simon.eu@gmail.com>
Subject: [PATCH 0/1] Clarify that _ and not : is used for suffixing the variable name.
Date: Fri, 20 Sep 2024 13:38:17 +0200
Message-ID: <20240920113819.2845816-1-simon.eu@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Sep 2024 11:38:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5358


Simon A. Eugster (1):
  bitbake: doc: suffix for BBFILE_PRIORITY

 .../bitbake-user-manual-ref-variables.rst                   | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.43.0


