Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6BAC88E6E
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 16:08:48 +0000 (UTC)
Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1384.1789402124286011561
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 09:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FdJfEWta;
 spf=pass (domain: gmail.com, ip: 74.125.231.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6beed321ad9so1425410eaf.3
        for <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789402123; x=1790006923; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phYBkVMTQBh9yLYT/87ogJsohkG7NYR7yRccMbxX5ew=;
        b=FdJfEWtaSghmZ523Oe6gbooKxGELuHzPXntSnYnANmbCuzVgBRKmTW4uY0wiKJOkhH
         /aInOun/yCOOnxF9QKfSj6VvbxEfohob1nInRf9f06q1PkUctqq3urIm4qRNkNnW4f+G
         tbOy5xo7S3mFHOrHMSYt40tIDLGMoEQIzHNlmvJIfZ2ziTDlipXNsStzFIKoMCfsqn79
         PxT+X8brWoWl6rOq0l+ytUZuH7XnbBhkXX6od3M65Gr4kE9aj7obPtUvHn/TvxZQcOlO
         c0zSX0FV4OMzq9jpO6dj2/9H0iBuzENhT3W5j+wOfI12C5mdhzVLVs3sf6LDCI6Rdhf5
         u8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789402123; x=1790006923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=phYBkVMTQBh9yLYT/87ogJsohkG7NYR7yRccMbxX5ew=;
        b=OwJmwcEWDbQCVEHILykeOS9KdF9NzMiR341JEzw9t/VwzHM6NH+rTM0H9Z0pyUV6ZI
         1WhYQlxqfnJ7uvgJvk5mzOwMimErBxRfvBYnz7PvvciGBV1Prdz7FMplMi3iwLpKd2k6
         iZDwFjcZGxe81rg/4HCBWJHtAvVjKqfmNEKtY2/QfH0UGEfLPFkWAvNtvOFQjnQq1JYs
         ZCSGjtVaeZ+BGHOKfPFk0oMhKXbac3rHPZbnVcnaXT1sUDRv5tm0w5iKHCI+zbS0jF1j
         1Clgy3jjSoI2BEtDp9bfhjCkqSlVhl+AN9xJhow0ac8sjJuiY5JCFaLijB0qNoXkiNPc
         aYgw==
X-Gm-Message-State: AFuF++kXERgzlPRuAMHf4zDDBeYiHgr5FgQqIfbAI2GpvwySbBMZ9Wy+
	SJwHrQJ4eRCwnjW0p/ZYKO+OLdnFMVNidsY+UrzvcIYPHESUgcj9NZQYCMQVyg==
X-Gm-Gg: AYBFou1G6Q9PSVChKGQkcDqoOza/+m9I5fH3u/c+iRWjPAOff1XN6sW2UW2w5MErDbN
	7hPnQAJGt/vh9AYDdU3PCsxr/1dSh8zJCAhlJ5eQoVim+JNzxxRUWKzCGgPDkREaFj0sx8hFuvU
	qoJOfGmV2pJ3xrPp4lJrtT8Lq698njYV5mMBAF7o9b30O3jfO4hvdgbaekf9GJJAjnDci7odhYE
	Md5cEQyHps2Ea6wTxH4f0Do8Srve+LX/0aL8O+VwnEnwsgzUo9BidwUBIqoBlHv3wh2Uon1VblV
	iuviEGlygGGptL3vgmayq4mILdI3IGavsPVgdzxo+dlVVJrpaXKNX4M6bqpQCoPVt5lUeJbUovI
	xCQND27FQzWKVUQAOyiRQAom1kiTaBMiK2+SeuF6hCAM+pUCaEXmvUn1mAjCqHCNAWCVMmS8i9I
	OByb6Pvax7dhyh42Qzie7IOGmCwbvmj49xrubd9CrJ7rkixHn493DFeSUG1UQ4mrZXKD7mT+3v0
	wxvoqY=
X-Received: by 2002:a05:6820:3083:b0:6b7:46fa:16a9 with SMTP id 006d021491bc7-6c542832ae1mr1824495eaf.62.1789402123329;
        Mon, 14 Sep 2026 09:08:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b01:ba50::9413])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c0990cc05fsm11012356eaf.3.2026.09.14.09.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:08:43 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [docs][PATCH 2/2] ref-manual/variables.rst: Document SPDX_AUTHORS
Date: Mon, 14 Sep 2026 10:08:36 -0600
Message-ID: <20260914160836.1673868-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914160836.1673868-1-JPEWhacker@gmail.com>
References: <20260914160836.1673868-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 16:08:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10498

Document the SPDX_AUTHORS variable. There was some confusion about how
this variable works compared to the other single-agent variables, so
adding explicit documentation that indicates how it diverges is useful.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 documentation/ref-manual/variables.rst | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e1d3cd70f..4ec4ce988 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9499,6 +9499,29 @@ system and gives an overview of their function and contents.
       ``SPDX_IMPORTS``, :term:`SPDX_INVOKED_BY`,
       and :term:`SPDX_ON_BEHALF_OF`.
 
+   :term:`SPDX_AUTHORS`
+      This variable is used to list the authors of the created SPDX data.
+      It works slightly differently than the other agent variables (like
+      :term:`SPDX_IMAGE_SUPPLIER`) in that the base variable provides a list of
+      suffixes which are used to construct the variable prefixes for the
+      created authors. For example::
+
+        SPDX_AUTHORS = "myorg myself"
+        SPDX_AUTHORS_myorg_name = "My Organization"
+        SPDX_AUTHORS_myorg_type = "organization"
+        SPDX_AUTHORS_myself_name = "My Name"
+        SPDX_AUTHORS_myself_type = "Person"
+
+
+      Note that references to other objects can be made using the ``_ref``
+      suffix, for example::
+
+        SPDX_AUTHORS_myself_ref = "SPDX_IMAGE_SUPPLIER"
+
+      And other variables can reference authors by using the correct prefix::
+
+        SPDX_IMAGE_SUPPLIER_ref = "SPDX_AUTHORS_myorg"
+
    :term:`SPDX_CONCLUDED_LICENSE`
       The :term:`SPDX_CONCLUDED_LICENSE` variable allows overriding the
       ``hasConcludedLicense`` object to individual SBOM packages. This can be
-- 
2.55.0


