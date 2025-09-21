Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3C8CAC5A7
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 16:43:42 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.32692.1758473012844718354
 for <docs@lists.yoctoproject.org>;
 Sun, 21 Sep 2025 09:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G9JXiLXS;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: bhstalel@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-62f973b37c5so533817a12.2
        for <docs@lists.yoctoproject.org>; Sun, 21 Sep 2025 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758473011; x=1759077811; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLDFy4dDaKdw5V87WRAJ9Nuk9hT2u/PmaWpW+KhcitY=;
        b=G9JXiLXS/IyAnmkpcpb9eL0rHcDJiJCT0kVjF0vcyXg01XLdLUgfe8PVGxy1FPO3lT
         IRPLowHPxqPkFTppE7zl27QamPe7RtqPOKgCaeDJ62x1UbYd+Jf23oTRyzLu5UhMBWdt
         Oht4PD9BGzia1LORU9Y/iVocyoU1ZKMyIIW5kuUr7D66xEvae6SH6yhNL7MLXCPaYOV4
         63gHMNDD6FVe42uJwjWOofDpQoHWiiANTQqTIqAJs3KJNf1DvkV7RewXATv/0fGZZ0jR
         1Ngy9cPaI/0JGFlTU1x6kRwud6A2ZwMyMM+8l7pd2tZulk6k0DvF+YR26zag8pjDvFdp
         g/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758473011; x=1759077811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLDFy4dDaKdw5V87WRAJ9Nuk9hT2u/PmaWpW+KhcitY=;
        b=U+WF/5ADwk2gYQe6mtd1fJsNLG65V5qoZOsdJkMFbk0kKB6m6h2FfeyyqvedNpUfH6
         jbVHbVYCNW9YIyJKCKQ5fO0GkwVbLBuwJSQpkib2xaMcfn0IFFq9BlJSWEZDCuFYsDe6
         MZXAMt2za2ZWmwHkVRUMSwlO7t24M6brUmUSPGS+6JUkx1D48+a+hJ1x85UbcibA9H8h
         qWdq2tFUdjJRmGnI6Dlluo8qP0MhSYLYN419Fr3N+GLK8enmPJerlAC0eKhtAV+W69aQ
         drqlv9wg8NXvgTH9DeYC0Im1zxabUh0In46ejarfr9cZ77QwiYlt01IKnaRhivq9YSXd
         q/kw==
X-Gm-Message-State: AOJu0Ywx6t9XEQQA5M5dfUFck7dPLdhHdGsW3uOfWY1MlKQ2r7idIUa9
	COglSfpD00hvAjFGeqokOPxRNx3dfG2iXMXUKk/uiIu0Y6j2W2zth27K88bcZg==
X-Gm-Gg: ASbGnctnNA2lu6Ohzlgnvx7P1vW3gcPhg/BT10daSKVJ4e5Tkw6Xr+Cm7NJT0Zbrr47
	i4XAOYwMnzYuNSMCzp1J90I6VoiSiL24Peoi6sgLA55JxXvbWkf5t4ENhYwpcOdgCgYB2zGW+mx
	WpYK8LmGZBU/j9buVryxAFKn3BkiLuQzpobvKwXrFQ0okJbMl+I1KCRjROPaBWUrQLSSwiVOSZW
	D4viIYR/SmLJt3M5l00rLnuWM+L1IBcIGuDx76AiXmlm10CfXxEcc6l5bZ/Z6OD2iAJELBh0UR3
	/Tf9Tmz/FEr0Dw16jlasDHu8wE1k6q7VXFl5usvzlX+H8A6zJwD7uqChGVId/0HLhSo4y//e/Fh
	icOg88AKCO1/+sZSet8M=
X-Google-Smtp-Source: AGHT+IFCFvrJkQJ2IfqBesvQCDnwzQ38hcKLvvQa2k3j1qjfkn1OoZS8+omac9wOLG3EYVms7R9fJQ==
X-Received: by 2002:a05:6402:1ed3:b0:62c:af05:5814 with SMTP id 4fb4d7f45d1cf-62fc091334bmr5044654a12.1.1758473010878;
        Sun, 21 Sep 2025 09:43:30 -0700 (PDT)
Received: from techleef ([102.104.117.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63203b3b075sm2558020a12.31.2025.09.21.09.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 09:43:30 -0700 (PDT)
From: Talel BELHAJ SALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJ SALEM <bhstalel@gmail.com>
Subject: [docs][PATCH 1/2] ref-manual/classes.rst: add details about actions done by base.bbclass
Date: Sun, 21 Sep 2025 17:43:05 +0100
Message-ID: <20250921164306.53501-2-bhstalel@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921164306.53501-1-bhstalel@gmail.com>
References: <20250921164306.53501-1-bhstalel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 21 Sep 2025 16:43:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7569

Signed-off-by: Talel BELHAJ SALEM <bhstalel@gmail.com>
---
 documentation/ref-manual/classes.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 662121ed9..791c6b2ef 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -183,6 +183,14 @@ The class also contains some commonly used functions such as
 :term:`EXTRA_OEMAKE` variable as well as the
 arguments passed directly to ``oe_runmake``.
 
+The following actions, among others, are handled by this class:
+
+- Define default dependencies and add them to :term:`DEPENDS` if :term:`INHIBIT_DEFAULT_DEPS`
+  is not defined
+- Handle :term:`PACKAGECONFIG` variable
+- Handle the provided license via :term:`LICENSE` and :term:`LIC_FILES_CHKSUM` variables
+- Prepare the native recipe that correspond to the scheme set in :term:`SRC_URI`
+
 .. _ref-classes-bash-completion:
 
 ``bash-completion``
-- 
2.51.0


