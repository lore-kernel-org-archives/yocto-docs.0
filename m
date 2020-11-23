Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web09.39572.1606154549039322652
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 10:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JaL0QcDd;
 spf=pass (domain: konsulko.com, ip: 209.85.221.66, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f66.google.com with SMTP id 64so6087375wra.11
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 10:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mxQ+kL7V+Bxp0PLa8HN3ThsCndq4lXpayAjokVYWfFY=;
        b=JaL0QcDdSpUy5MFWt7tgDYxJKUkJp2RFxtWkBc9rq7am3ppwVC4+k/lAb7PC4Kf0/8
         A2J+9QmotgqMrrlvylR3LM8aLVfeJ8lIMESmjkMIT3KzRpMpTMrSG0KzHW60AuvNuRWH
         FXSFTH+OwQ/D1N4lrSMPFBcq/mRawtmwQuviU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mxQ+kL7V+Bxp0PLa8HN3ThsCndq4lXpayAjokVYWfFY=;
        b=WznL2NX4zFwZ9RQTuP9obND0eVIR6Uuat7BrdJaS4VmtjlPbS5iWVZd1YCAokQqr6Z
         4dYm3ZEWwDo/BefWTNOxc08ciAJ1nALybz/EDV1Z9jyuTNkFVonvJVczJOS732pnmg+F
         Bx0W63oDxxPkh5PFMoWWGp6wosU5Q/3hjionvQwMt/xsMOhzW3BdBgECKwuv8punPEEE
         9SCvqydT3LZa2fSEj6rzrEAImG1OAZ+H62qd8Fh4ArgawPMWpwwZhesjKL3E/rs3eabo
         s6y2bhLDlEmSU31yASRcWhvKXOedOYgoIZjyaJjIcN3gOK94DowpQPJKnSYh0d5YAjgs
         McBg==
X-Gm-Message-State: AOAM532+mmyeyr5k1o4SByVp2wsBqK62InYxG2XNJvHOr87+02ouIh4S
	BREwy76641V7EYFrYJyXLZHI2+3keK2AxQ==
X-Google-Smtp-Source: ABdhPJwqYYh0iRJoOg7xB2fOyI+K+xveuwYd3We11NgNIyahxYFlIO1Va2Puz8AkiCrNsYxuxeH+7g==
X-Received: by 2002:a5d:6411:: with SMTP id z17mr939571wru.112.1606154547355;
        Mon, 23 Nov 2020 10:02:27 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id v8sm117315wmg.28.2020.11.23.10.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 10:02:26 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v3 5/7] dev-manual-common-tasks: Describe how to handle patch feedback
Date: Mon, 23 Nov 2020 18:02:17 +0000
Message-Id: <20201123180219.1966-6-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123180219.1966-1-pbarker@konsulko.com>
References: <20201123180219.1966-1-pbarker@konsulko.com>
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
index 1c6d88a93..4b76217ad 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -10982,6 +10982,28 @@ reduce the burden of patch review on maintainers.
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

