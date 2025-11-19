Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F12DCF34A5
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 12:47:17 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6051.1763556436221562101
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 04:47:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KhnY2Ilq;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779a637712so29620855e9.1
        for <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 04:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763556434; x=1764161234; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DnjSO/ivvFhKrN+pgKACLjjRZfzy1wwcwgW+mBQsJmc=;
        b=KhnY2IlqMGrHGUfEe4oiux39w5OWXO5sdQkn/ewGVKjSFFyZs+V/FPhsPsqR94Ax5J
         qlDj0LVi1BzSLygyJC4kO2DT1xeaZT6tGjWLlgLm2O7X8cUX6p5u5azVFr5bR0utkWeJ
         vJv8ateBRvvTvtSqJCrGr5mDcHrBTgXJRIKW6115N3dUsSipFWydKqvV3I7lV7fHMOiJ
         9iuUteW3uH6hKlZfXBcVbgZy6bdEblQ8TyDQcQbRjYyPbCjomjkdIblBQHV6CyLYM5Us
         DQ/sbupiogx41lc3bCYU1r7DCnvr9rbU5z95AUFqsReTSq4ux23vWlMPa68krcviANN7
         jkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763556434; x=1764161234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnjSO/ivvFhKrN+pgKACLjjRZfzy1wwcwgW+mBQsJmc=;
        b=OHT4aHN6oy5qRamdmVbtwjCiIfVHiv3re6D6MaDSiP/Yt10BYYtFxjWxnyveOsGpaO
         zH8Jc9CNsz4ei8QSFNfb8LKqrXQrxfhydIAkeUimf7nfpl6tzNAUlfusBAKtj0nMlxFM
         a8CuMtNuWMtFbMnIt/GWsHITTyyBFjxzlorUDCsj/kemEbipTRyKwOOa/8g0aEcOBWiV
         XG5/uh8WYJKdt7tIFWVa2EMGiHmvNOG5tYGE+mVdURO277N0SycXF/0xmDPNhbabJv2Y
         yI14rB1FR23DH43giBP23AEYT4CaWwR70l0tGs2+WIRrKhIVoNpsVmT7UjnloDVARZpv
         TMog==
X-Gm-Message-State: AOJu0YzjrIsJSXfqMvM0A1tPhMkb+OuBiPxrFdHCUWyqXxzMJ7XEhUZw
	uk/95v5Ey47lHj/KSIB7m82FCJFiRmTW6jSzmWtqSsiY8+gUoSfBFBvlzpZNmw==
X-Gm-Gg: ASbGncv8GDMWCT67Ykt7k0K0a5Xx2ml3JttxGcqBsELJPO7mnWv/yTI7J+w/qWpCriE
	mM0Xg6Jx3ltcsrcelGRHhid/ZNJJtR43pAGnzFQFBBjkrtpHvd7pNbA84Tbans6RPAdRd3/tCTw
	FzURpI6YGzd759GlTH1vI6RgRe2l7WyoY8CbAjM2U97NJ/LfUpN1TPzHZhW+c8Nyqcuuh8auSj9
	SULA3QJVziAco6AvUxONz1JXMRbF6Ns8pGvVaHZpMv1/ZIlLjsb/CPL+OYxnPu6DGy1VNaagNtY
	ZeVPHuI79EBZEhI/wwWSftrN6XhCJ8Bl9x4Eiid7b3Z8180JyovGbo05rhqVcw8I8d1t13vcOxq
	rK6G454fMXp8PwUJDQjSVbkK40BpgzNPtwy5M5+v8ybIgHtnTo9lZv+DrZILh+i7ssz0ePyajby
	Quoypd4f31imp2Zzbi1Tz0ZN7vW1YiIJPd3PAebq6/Ix6X2idr6/P6Uq+XwA==
X-Google-Smtp-Source: AGHT+IHFDFLGkP/3UguQSo9WuJqFsefcI/zzSxvO+Suvkh+IFce19BYUB835ch/uUFe8IJz1Wsq11Q==
X-Received: by 2002:a05:600c:4753:b0:477:333a:f71f with SMTP id 5b1f17b1804b1-4778fe60658mr200527495e9.17.1763556434195;
        Wed, 19 Nov 2025 04:47:14 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b102a3a1sm45374755e9.9.2025.11.19.04.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 04:47:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] brief-yoctoprojectqs: adjust bitbake-setup top dir default
Date: Wed, 19 Nov 2025 13:47:10 +0100
Message-Id: <20251119124710.3905807-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 12:47:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8083

It has changed to be the current directory, so just swap
CWD and HOME in examples.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/brief-yoctoprojectqs/index.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 211b6d70f..c55279dd1 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -105,14 +105,14 @@ Setup a build environment with the following command:
 
    $ ./bitbake/bin/bitbake-setup init
 
-By default, this will setup a top directory in ``$HOME/bitbake-builds``.
+By default, this will setup a top directory in the current directory.
 
-If you prefer to setup your builds in a different top directory, for example the
-current directory, you can set it with the :ref:`bitbake:ref-bbsetup-command-settings` command:
+If you prefer to setup your builds in a different top directory, for example
+``$HOME/bitbake-builds``, you can set it with the :ref:`bitbake:ref-bbsetup-command-settings` command:
 
 .. code-block:: shell
 
-   $ ./bitbake/bin/bitbake-setup settings set --global default top-dir-prefix $PWD
+   $ ./bitbake/bin/bitbake-setup settings set --global default top-dir-prefix $HOME
 
 .. note::
 
-- 
2.39.5


