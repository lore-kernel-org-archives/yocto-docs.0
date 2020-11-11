Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.8768.1605110892293845216
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 08:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tX4Hbf1f;
 spf=pass (domain: konsulko.com, ip: 209.85.128.65, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f65.google.com with SMTP id c9so2721102wml.5
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 08:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j9UPCLHwzIXWlDYOY0AjDIIUbqx5cSyTefBz0wGKlGg=;
        b=tX4Hbf1fF5LDvayJspIH9Rj9xH/9hdJJBBCtXKlFAO2NIH/NN6mZjKGsX3xdLqchI3
         GsH+FtmOUt5EvU+dwtum1R7h5ckATznTvbIKB8dx5JDXXrMyn5h54VeUCY7KnYqYixDv
         Fk8/gAWHNgRMVtHUjdKU8MoyeSPQFupTU1VnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j9UPCLHwzIXWlDYOY0AjDIIUbqx5cSyTefBz0wGKlGg=;
        b=SrraqOG0PQOngsWsFF7XPDm63DvudH55mOSiu6MNHWFMtamGavuzRrUdTYPPVnL2wh
         5R1HurrIeh5zeWR53Yged/8FXFeBx6bCr1OIanpuAudljK6bkRfaR3pli0B1sPoQLARn
         qTQrSnEMIUXVAcg7ybNW/ntLFTQa91cEml3cEq8NYvzPXtJsMT6qMt/D/TABZO3Et85N
         bFWJQEpSTqFT6I9TTpyAwr0vC886nnjcAHsQR97nP7jywzORvQBZbeKhr94SDpsP/Tou
         +hLdBlp5G14YrMUuYWrMQnE3tLXzSsuJ3tNOjRJIX8/uyP3fCpI3L9pOPB3rfhlnq+5Z
         Fxag==
X-Gm-Message-State: AOAM530RsFn2Ie0pXzMA4WPM+CfX/QprRFsxf8R0Co888eXjsgA70mys
	MnMSuVmuSpIpUSJ0aBmonIcZuYlUKwHhhQ==
X-Google-Smtp-Source: ABdhPJwHrkOgUN4YPX2FbVC/XGbDU+wnHGCgEUFP+s5SipX/GQljwnzid5mCGHinl6T4Z+ND4r3Xgg==
X-Received: by 2002:a1c:2643:: with SMTP id m64mr5051465wmm.28.1605110890340;
        Wed, 11 Nov 2020 08:08:10 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
        by smtp.gmail.com with ESMTPSA id u195sm3174617wmu.18.2020.11.11.08.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 08:08:09 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 5/8] dev-manual-common-tasks: Describe how to handle patch feedback
Date: Wed, 11 Nov 2020 16:07:57 +0000
Message-Id: <20201111160800.5669-5-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201111160800.5669-1-pbarker@konsulko.com>
References: <20201111160800.5669-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The contribution guidelines would benefit from a brief section on how to
address feedback from patch reviewers and how to re-submit amended
patches. The information here is based on my personal experience and on
the existing notes on the "How to submit a patch to OpenEmbedded" page
on the OE wiki.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 .../dev-manual/dev-manual-common-tasks.rst    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index b34602e16..0a3ab8241 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -10983,6 +10983,28 @@ reduce the burden of patch review on maintainers.
    Asking about the status of a patch or change is reasonable if the change
    has been idle for a while with no feedback.
 
+Responding to Patch Review
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+You may get feedback on your submitted patches from other community members
+or from the automated patchtest service. If issues are identified in your
+patch then it is usually necessary to address these before the patch will be
+accepted into the project. In this case you should amend the patch according
+to the feedback and submit an updated version to the relevant mailing list,
+copying in the reviewers who provided feedback to the previous version of the
+patch.
+
+The patch should be amended using ``git commit --amend`` or perhaps ``git
+rebase`` for more expert git users. You should also modify the ``[PATCH]``
+tag in the email subject line when sending the revised patch to mark the new
+iteration as ``[PATCH v2]``, ``[PATCH v3]``, etc as appropriate. This can be
+done by passing the ``-v`` argument to ``git format-patch`` with a version
+number.
+
+Lastly please ensure that you also test your revised changes. In particular
+please don't just edit the patch file written out by ``git format-patch`` and
+resend it.
+
 Working With Licenses
 =====================
 
-- 
2.20.1

