Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DFCCAC588
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 14:01:04 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.14458.1757340054864738482
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Sep 2025 07:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=q9x6t9d/;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3db9641b725so4498122f8f.2
        for <docs@lists.yoctoproject.org>; Mon, 08 Sep 2025 07:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1757340053; x=1757944853; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CtQm2dhQQ2ndEzFUrXqIk5Bo4NVrxWkiipmRaxQwt2I=;
        b=q9x6t9d/IkwzmRGxCW0+64NRN202bw6w+/hvL/YIdO0BbCF8Wjkot7Obvi1BkQSkcN
         fb2mo2szq7BiBG7j306G63NN1QS09+oJVAVUNfmdPVpXVJz1xZtgg8r+xkVNwgg8oLgT
         MOFdga1h7nWM4oUaG0AH5qjKeLut+bvR9rqVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757340053; x=1757944853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CtQm2dhQQ2ndEzFUrXqIk5Bo4NVrxWkiipmRaxQwt2I=;
        b=U+jhMUY3wZXIGePCfbxikOLYCF5XhCxXOThwkKKiBWRhMDF/Qn1Y6F1I0CrL0F/Bhj
         skaaADl/8AQVLHXGPVGhaUudQZlEr5rtBDVJHEL4LGQPYQ46U1DHav42rLCT1/3BZP09
         EPgYYLOaF+bm3EzZctxnmo/weJogF3DY0bRBnPtqAtbKre1cZ9n5ZX1GN+847rzWuzn0
         2CtjaJBJ/hBTXLldxmEBLOOR5N0NJ1nzwO5Jr5iVJvo5/XmjJse1g0YWZLRpsp2PH9kD
         P18E5OY8fCDMGpPhpsUqayizsELmYLgIWekkEPZV6B1mIuv1jMUKAdU+JSpZRI8MD3kp
         kMUw==
X-Gm-Message-State: AOJu0YxqccepFAtTFi03K7qpBmQJXV+m6k/f9PMx+3KyJImvd8Sj++yn
	St0wZjIH8m4kqMSRem+/4KfUIY2HPP2wlgLXN7Yg8CWjTw2V7jjL+xZ5+rI4+sY2xmqntpIj6OO
	2Hhuq
X-Gm-Gg: ASbGncskWS1faxEbbZSE0WMFWxWljEMsxXlzlCP8J27btaZLHuMhMMKXql/zToUpF0B
	vz5AvNBllEFDlgWTUSRpulxbTcjcFaI1GmFpTyDYDXPZ3ELV2HMY/+hq4fNwkGJ6WX0qx8X4y5/
	gYZ1sS06MfEyOVATZa+wLJbKEqjRbHp4wJXi3olMztvvQKFleTbz20K6llONbKHLoDayHfCPRIc
	RHEsBnDLxT+yWNFXU+OJkTQJngHUyHhQQaJHPfFIqrm7QI0D9nR62iaAHYprzHRM+Ibou/Jr0VI
	flB4L2L22nKALdqiJQ6H4oc/0psIMEl262lPnQnbxef9aQ0JHRk27jNxaRTeDkWbJXtNfeh39C/
	TUEzvSe+F1ScTjEStkL6K1I3S+gl9aIQyOD6gWu95FZLrcBti60xZVXobSh2yM9ZRPhHk8crNKZ
	Ao3WZr1BpBdxL1OHjtYaLjevWbOmYXeg==
X-Google-Smtp-Source: AGHT+IF5j81CXF/SrmOFXQJZtx2zXbVm+Gdd4FnM11qckcdwXtB27ChtBD5qiY7B7qr5n1s9KyEkiw==
X-Received: by 2002:a05:6000:18a8:b0:3c6:97ae:a574 with SMTP id ffacd0b85a97d-3e641969ff0mr6684003f8f.24.1757340052694;
        Mon, 08 Sep 2025 07:00:52 -0700 (PDT)
Received: from localhost.localdomain (2a01cb000301bd0008156b32089b8a82.ipv6.abo.wanadoo.fr. [2a01:cb00:301:bd00:815:6b32:89b:8a82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3dc1cd4a7d2sm21938924f8f.33.2025.09.08.07.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 07:00:52 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: docs@lists.yoctoproject.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/3] ref-manual/kickstart.rst: add extra-partition-space
Date: Mon,  8 Sep 2025 16:00:46 +0200
Message-Id: <20250908140048.352088-1-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 08 Sep 2025 14:01:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7487

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

After commits 47533f20a7ec ("wic: rename wks flag --extra-space to
--extra-filesystem-space") and c7f51c23fd268 ("wic: add
--extra-partition-space option to set unused space") in openembedded-core,
document the new Wic-specific option extra-partition-space and rename
the extra-space option to extra-filesystem-space.

CC: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
---
 documentation/ref-manual/kickstart.rst | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index 297887805..80e2f9d84 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -158,7 +158,7 @@ the ``part`` and ``partition`` commands:
    excludes the given relative path from the resulting image. This
    option is only effective with the rootfs source plugin.
 
--  ``--extra-space``: This option is a Wic-specific option that adds
+-  ``--extra-filesystem-space``: This option is a Wic-specific option that adds
    extra space after the space filled by the content of the partition.
    The final size can exceed the size specified by the ``--size``
    option. The default value is 10M. Specify as an integer value
@@ -166,6 +166,16 @@ the ``part`` and ``partition`` commands:
    for mebibyte and "G" for gibibyte. The default unit if none is given
    is "M".
 
+-  ``--extra-partition-space``: This option is a Wic-specific option that adds
+   extra empty space after the space filled by the filesystem.
+   With ``--fixed-size`` option, the extra partition space is removed from the
+   filesystem size. Otherwise (with or without ``--size`` flag), the extra
+   partition space is added to the final partition size.
+   The default value is 0M. Specify as an integer value
+   optionally followed by one of the units "k" / "K" for kibibyte, "M"
+   for mebibyte and "G" for gibibyte. The default unit if none is given
+   is "M".
+
 -  ``--overhead-factor``: This option is a Wic-specific option that
    multiplies the size of the partition by the option's value. You must
    supply a value greater than or equal to "1". The default value is
-- 
2.34.1


