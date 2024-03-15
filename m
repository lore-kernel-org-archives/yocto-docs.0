Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE009C54E69
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 09:48:29 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.17756.1710496102487228091
 for <docs@lists.yoctoproject.org>;
 Fri, 15 Mar 2024 02:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LvN/9exO;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-568b4b9aeeaso321572a12.3
        for <docs@lists.yoctoproject.org>; Fri, 15 Mar 2024 02:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710496100; x=1711100900; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ryJcAiK2QSPnwTvrjl2TLL5SQWp5gkL7LReMvBvYNBM=;
        b=LvN/9exOwHz1T9nYxmF6n4NA3NbmCFn1WA3Hnwm8lZ6A+rI3/2q/Z4Nbh5YwCw7ZYt
         4xf+trjYa+HsF921WN1foW0EmbhuDvkYrtgCY2vOYO8QsYT6eeeAIzOTuk7QZEmLOszr
         6il6BIc5lpmO0WwxlavfoZStSjr9VHs8sXxyCTz9a0FqCxe7HLYNkWHgwSc+TnwiYhPH
         tfoMxEtgCnFxSGtPyawp1XXh1URwEOwUnEYHXZCGmlJxVMTf1ztW40KzOwK01X8k1Gkx
         dCFXu17sK6kwdAIonEZFP1uZowxKRHl230Ma/mYAzTfPvWkYR/cVwO66pK4QvlQtkVao
         cuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710496100; x=1711100900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ryJcAiK2QSPnwTvrjl2TLL5SQWp5gkL7LReMvBvYNBM=;
        b=en6YIsxad0U3j4O/8hpLj6kCUIv26n2yLJndZ7/pFHb0RDWlNiMv7xyBI0xBbZF2LB
         i0GWq49iTSWlTs63d6Ku+N82nwvM2RekL3CH//CVnhfqzDgDoO0D/d2f9SuI6Y3lda2K
         m//M93qA62JnLYkMzf7xJAVFNm4fOOfZH0OkeqE5Ck9YZio+xgXQPlWhvMh7DAirHLQm
         KPi3uPGzxCTge2ZAGEjNUjJCwT39P4DFwXkQxk0kb+xvmfd9YqPyKtQjO9M9kn9LBnIK
         2DTwQ9HaS2yDfEYIMJduE7eQstwucTAAz3jRkbniSn76UdhXCOzsIxxKZ50aXf/jNzG+
         ZCCg==
X-Gm-Message-State: AOJu0Yz7H+QfKljv6Lbxc6s0mQpN/sdbLD+kdMtQJhtd0g8i5dsQ3+BS
	Av056fAld+677Q38bQd7fAqhQESHYy/qe55p37s00MYL0CkT1KhJVGmk0GMd
X-Google-Smtp-Source: AGHT+IEepKeU4V2mYg55kE7vBzasZQ+8OmLO39hDYOThjxjdT4DyqJ1YNwmW8SgGp5mtqjwTIW+alQ==
X-Received: by 2002:a17:906:b2d8:b0:a46:2cac:377c with SMTP id cf24-20020a170906b2d800b00a462cac377cmr3158750ejb.48.1710496100211;
        Fri, 15 Mar 2024 02:48:20 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id go34-20020a1709070da200b00a46025483c7sm1528205ejc.72.2024.03.15.02.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 02:48:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] contributor-guide: be more specific about meta-* trees
Date: Fri, 15 Mar 2024 10:48:05 +0100
Message-ID: <20240315094805.2990394-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 15 Mar 2024 09:48:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4978

* this is often confused to apply for e.g. meta-oe as well
  where it doesn't apply as meta-oe has own ML mentioned
  in README.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 documentation/contributor-guide/submit-changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 59f3c1e40..f961c8e16 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -432,7 +432,7 @@ varies by component:
    :oe_lists:`bitbake-devel </g/bitbake-devel>`
    mailing list.
 
--  *"meta-\*" trees:* These trees contain Metadata. Use the
+-  *``meta-poky`` and ``meta-yocto-bsp`` trees:* These trees contain Metadata. Use the
    :yocto_lists:`poky </g/poky>` mailing list.
 
 -  *Documentation*: For changes to the Yocto Project documentation, use the
-- 
2.44.0


