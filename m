Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13881C624A4
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 03:33:40 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22123.1788147213439163406
 for <docs@lists.yoctoproject.org>;
 Sun, 30 Aug 2026 20:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BaSZM5Gn;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-90cc39e06bdso25188156d6.0
        for <docs@lists.yoctoproject.org>; Sun, 30 Aug 2026 20:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788147212; x=1788752012; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cz5x6GE63uEiWTJ3RX7RHhy2+jY0Xfec3Q7oV2x+f10=;
        b=BaSZM5GnT0emAZGZ7IRXTJs/Hlfn5bvHJhHlA2RvPPr7+mNZJ+vW38szDyCItQc4k8
         P+4Gmi6D4O5dCVPGwtGv02Epj2dKPlHlGMKBc+U5bXmtPsYrLWK3jyFHq5Br2gMgHAYV
         9dXRwSbZe03ov1JLfOFCQOBpw+GQIbmFO1zAY0pP5z7uJtjhMkI/YlAYCSJnolbtfGPH
         7E/dvo++/sTmBUwbLfRTR2akpmLWXxXNUIn27KMHZvEY/yvjuvBTdVOmhWG6dPOhcQy4
         Vd14WvZHsHs8qGy6suXjn+fDPEr5AR7xRhVU5e+YH5k2vwivCpS9jFWJ/ybkd8euq5O5
         kVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788147212; x=1788752012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cz5x6GE63uEiWTJ3RX7RHhy2+jY0Xfec3Q7oV2x+f10=;
        b=IDuAU2+2MpG3aeDZXr4bpi7eDYKc0A5sOIRl3QcYGNvQ7QDuP6HQB4P9nyL+gtDQYD
         mdr42ZKLx+3KHv1YnZ3C8KeMNYdMf08vqNGO1VUcJJGDXQdHY96BYf4wlXuRFuZWBXEN
         UKPV7UPSSwi7tuESOR2eGFdrHik7BChI0A50dZMy9NDoVKykm+bFytfTvOubpg3junPz
         Q2cFD0kVF9CqR1nY+ud/QTYnQrBW/6aiXr6Dtjw5pqMZDxC5LWhjGhr3CvtsfsFNS9Az
         wNc67r5ZC8IMR9dRBX/qQ7eEo+7tqWf9VeweDCDrpojjZZiMIofLfrcQPtB/ZJXgQOom
         fqXA==
X-Gm-Message-State: AFuF++lRWOMwxsW/5/RS4kFUVLiL2zo+1bPaRofyvnTVQJvSF1QRjQKq
	98m8pufya5FyqTtYDWVEXBWnw0ySu5CNcoeq4QMd61gasXzrzwkjxzMmpQwyN/mH
X-Gm-Gg: AYBFou1D705jG47+ENmG2FJ1Vn7hhOQ4ooLUrDVDUqTBhmsZpl0ydvKEBpB/QaZKGkr
	phG2IPKG/9eEomDWz5+3W0dSzWBQdF2X1tQPZQKQAnbaQHfIItU8cxccAVpUS0bMFJVTzzeqj5z
	ABuo6o1fVOYLfm5lM7dUiI+lohJkpLr81xuJ9jF28GEWAdOaTrywRKAN8t51mWRaQFalKREiovp
	skKH2581LVZRQFK0+0XPI0obaERsnRBoEoPXVn9y4MKzS9Nz/i/HJ6BlVCBA+66uRZBY54Op16c
	20Nz6hlvp2SsylZ+01zQb6xWm6ooXTR1Od0TG8nMrAJqZWIrZX8qKMn56uQQmFp7P6h6rqE8A1/
	OKSAuAa6z1wMst6dWx88cvJjfKqn1eOvsOb+eHM5lEHM3PiOBb9AXg4a4m60re6/ypt/ukoCIbY
	jLe72UuskVkwks/qwjQbqRm2FtOG036iurBFEhDie3q4tQ3eGc+JOtzOlKiBB/Dt3+4z9YlYIbf
	06nF1xd9AAmMvJ1cQqq9mxJ21cjZw==
X-Received: by 2002:a05:6214:529d:b0:90c:e89f:14b7 with SMTP id 6a1803df08f44-90ce89f187cmr223786916d6.20.1788147212296;
        Sun, 30 Aug 2026 20:33:32 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce444db01sm75128216d6.7.2026.08.30.20.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:33:31 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Cc: bitbake-devel@lists.openembedded.org
Subject: [PATCH] doc: continue the eventmask example onto its second line
Date: Sun, 30 Aug 2026 23:33:29 -0400
Message-ID: <20260831033329.4072643-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Aug 2026 03:33:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10413

A value ends at the closing quote on the same logical line, so the example
does not parse as printed.

AI-Generated: codex/claude opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 doc/bitbake-user-manual/bitbake-user-manual-metadata.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
index b0535b5dd459..111e8fe58b4f 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
@@ -1902,8 +1902,9 @@ and the content of the :term:`FILE` variable::
        print("The name of the Event is %s" % getName(e))
        print("The file we run for is %s" % d.getVar('FILE'))
    }
-   myclass_eventhandler[eventmask] = "bb.event.BuildStarted
-   bb.event.BuildCompleted"
+   myclass_eventhandler[eventmask] = "bb.event.BuildStarted \
+                                      bb.event.BuildCompleted \
+                                      "
 
 In the previous example, an eventmask has been
 set so that the handler only sees the "BuildStarted" and
-- 
2.50.0.173.g8b6f19ccfc3a


