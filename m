Return-Path: <bijak.dawid@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC695CD3424
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 09:14:50 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10686.1777626882289041584
 for <docs@lists.yoctoproject.org>;
 Fri, 01 May 2026 02:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PUcWEXkt;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: bijak.dawid@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso22306985e9.1
        for <docs@lists.yoctoproject.org>; Fri, 01 May 2026 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777626881; x=1778231681; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yWOulaSOL62l7Wg08B9kXAJdma9fT8Nk2Tg1J8MlHA=;
        b=PUcWEXktdonOvdXe+qy7drYJMod72YU5N2D1mR7OUWMWrFK16C7kLKgTZpTzmohdND
         zAtf/lg+RcscV5fDbReT05AfgzzTSDtAjY6HBd6QijT5F1RBJTjEBQGKAAK7B1GC1VFf
         1aeHsNtZniFqKsfuRXe1Qvverulraz/G0UihRWdBHwLpgOkb90PghUK4hGPEj7IxXzVr
         aJGTdmTPiGQ8lixJ678KNvWCWgRP7t97a1qRay7rq0wdbShzjkmkbkgKMr6YtKWDyBiH
         H+cw4nk/8PvI/z2jfMo+OLJL90Y2NtEYtfHqTvNs2DSr0/5iAjpnyOJ7KQfGZvD3jqvc
         8Xzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777626881; x=1778231681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8yWOulaSOL62l7Wg08B9kXAJdma9fT8Nk2Tg1J8MlHA=;
        b=qDIw5HCxdBiu9oJisBIsb9dSwJe1hTZd0XXomPhrJpfrCM0UUkAQh18tlv0cQQUWx5
         Ue+B3HctNrxps+/X1Y6zuGbs93FCKOEBnxOkR/VAbi5KgqzQizSIS89LCRR0VXvGjkCb
         pTsACZSIym2mn9+/qjIxr6MZdZ9IXOWsVoSYBEPMP9KQXt8eTL8jb/6iaYu2uhVcxO39
         5QRX7eSMxSGe0CmQX+53zLiJ57aqp1IuRYuxha8mKnGAMKWQeZup0JN3resDjc4T5VIk
         xATUiY68FGsNScwmmEEx7Ku0QBR3va7+5qHWG427zGFi0UEZqTpnvCfzFBr9LduU/yDO
         8Vuw==
X-Gm-Message-State: AOJu0Ywkz2pvkCHRZg4iz+uCngavmz/lV6xoiV4lwYj0+eOIR7XE1jXb
	x6DQkF3IKV7xKtSHcUzlJhqcSVo9JCgRn99wf3UCMZyYLIr17jSu+RmT
X-Gm-Gg: AeBDiesK8VcNHofiJjRbUiT/OVBLd6JkwGsS0IadQV8FwfEuTZoEAc3mD+5qmL+mbYW
	sevtWr5XEC38lR43rsAaIlAGbWe6pOUrJfRNXUlFDEukNPAIlGS67jx2+VOYqmpMZxko9eGeLNJ
	fRa72FZBMt3Yrnb6wmXauK1XTZqXCArnjdwqYDJtG6NGY3FSJIEO6Ov0oONxcugG/eE/KqNe7Xd
	Nx4vVBU/ZBO8MOxn5JSIS0ZxKLS6U/IUKMKZOz7Ydo12wFkw7QOfQq2+TEhtCkhp2Njl9wQ8fgF
	gsEeOXWGyDNX+pvUwwls+ZeUESexOS9K9F2LiowoQIxns9lJmmU3gU4362PifEEc7W1hemWAjry
	8bq5NuxE1qOfDz8nUBXdeu2RNEFYoxKwBdKJDRf/wOf+dilPZEFt8I7yreaglk8RBq/EYMMZq/L
	fal/vfrqw44WCnryuqLsHz1GrDuwBOlt8eMQdonqVz0+QIRWN71uRh24nBRaseyo1rc6rTPQnm9
	iUCzjmCYNiTvaIflsB66bZBaA+W4i7nPMGj6ZvR854ZXqfLGjMCxCTv4FRdL5Q6VlcWs/JDrg==
X-Received: by 2002:a05:600c:4e02:b0:488:a639:b772 with SMTP id 5b1f17b1804b1-48a83d6ec66mr107583445e9.7.1777626880650;
        Fri, 01 May 2026 02:14:40 -0700 (PDT)
Received: from thinkpad.fritz.box ([2a02:8070:d188:380:6a5d:7450:e8b3:758])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a8fe953besm12097955e9.2.2026.05.01.02.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:14:40 -0700 (PDT)
From: Dawid Bijak <bijak.dawid@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	quentin.schulz@cherry.de,
	richard.purdie@linuxfoundation.org,
	Dawid Bijak <bijak.dawid@gmail.com>
Subject: [PATCH v2 2/4] doc: bitbake-user-manual-metadata: remove invalid anonymous Python example
Date: Fri,  1 May 2026 11:14:16 +0200
Message-ID: <20260501091418.76994-3-bijak.dawid@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260501091418.76994-1-bijak.dawid@gmail.com>
References: <20260501091418.76994-1-bijak.dawid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 May 2026 09:14:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9390

The documentation for inherit_defer suggested that conditional inheritance
can be achieved by setting a variable inside an anonymous python function
and then referencing it from inherit_defer.
This does not work: inherit_defer is resolved before the anonymous Python
functions run.

Remove the incorrect example.

Signed-off-by: Dawid Bijak <bijak.dawid@gmail.com>
---
 .../bitbake-user-manual-metadata.rst                  | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
index ee6919dc4..b886e0578 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
@@ -835,17 +835,6 @@ overrides::
    VARIABLE = ""
    VARIABLE:someoverride = "myclass"
 
-Another method is by using :ref:`anonymous Python
-<bitbake-user-manual/bitbake-user-manual-metadata:Anonymous Python Functions>`.
-Here is an example::
-
-   python () {
-       if condition == value:
-           d.setVar('VARIABLE', 'myclass')
-       else:
-           d.setVar('VARIABLE', '')
-   }
-
 Alternatively, you could use an inline Python expression in the
 following form::
 
-- 
2.48.1


