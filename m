Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F5DCCF9F3
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:44:34 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.31565.1761569073024722021
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Oct 2025 05:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=T3lg17Cx;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7E379C0B887;
	Mon, 27 Oct 2025 12:44:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9C6B8606AB;
	Mon, 27 Oct 2025 12:44:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAF28102F2500;
	Mon, 27 Oct 2025 13:44:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761569070; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fPdTczuHfwYxZt3mSUDrugYhQbgzDkjqI8KI9ZQYrwU=;
	b=T3lg17Cx3c2ehQH0u9r37CDe+ffiHAb2ThEGIJCs589JrH6bIcCfVuCzGjqs90sK3VNa3W
	y7/7fK5PdD02+ogkZ6pKHf9W2SKAEm+fgC1QA9ATyKhUQnAzfX+92m2G/jL2Xd272vdXsP
	hfNCz4lFfetlDtquUwhItuQmTOlEn4FsPjxXZ2Eat0a38kAnLwGo6doo6GcKvqH0AWcPs/
	LCEvofkTevPnLvCwQc/XfB1/prqLJtSBwD0bETJxKExCo8bQR4kuGdiOoZ6Bt7seMVYCVF
	ykQLg3JEKWsz9WxMFvY7IfkGu5EkLe1QRO4jJ7m4Df2NYn5y0d2MRLmmVAgxxg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 27 Oct 2025 13:43:40 +0100
Subject: [PATCH v3 08/16] ref-manual/variables.rst: document the
 REQUIRED_COMBINED_FEATURES variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-release-note-5-3-second-hunk-v3-8-07d36e2380b8@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=1m+MF/snQ99f7ywHV+svMIErXIniv0rQgozKLQnALYI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo/2kFrvJOmp09TlwLhjbXE4yYoobN5gJy/DMem
 47o1an8h4eJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaP9pBQAKCRDRgEFAKaOo
 NsN1EACxQtQZlFXbmlhmrerJcQt5PEqeyzt8I3xYAr6fXR9ZVsYXy1pxXL6gYeRDPGoLevUhCnw
 LOWkNzwDVr/9SZUgT+K+iNeNRyt58MyuVXzBic0Xki82HEMqE50/PlSKdtueXq6lpKPQRVQp/2h
 yh9xTdv3Suy7APpkVuUJIb2t9emOI7SGqKrNsRgbJFQcFi2fA7dr/VB4w4y64neqTIOA/uZvYKb
 JAs5vdXSxLWTWS8r8yGTxmp/lxQA6cS2uQHraU/Ax0RBiCWEuoO+ApYES+hDE8uEvlVqgf6RHpc
 jfrMiTPziaZHT5zLdggP8kFNNxoNaa2OKrt6BQiJUeUcFCMIc/Mt3dkgZTuPonSQdHU5QpIfart
 LeI8sZ3+VAzvdMATJIL2I1aNwMmG+8nrkH3U8FWYgVn0IbjYORdItG+EJUfhxInyJB3Krgl826E
 HbMZtRWNrJLYEnrD1I3H+cvn77sgBmwJSlxjF+cHuCFsaYJNEhYJLgNL4OuQmimvadGT0gsaFcv
 o1n0gCArlVphIcDe26o4cxKWmvEQ8+/KXF/tS87LlOqzZo5AigjOdFSvAaDh4G008FRs7COsjsH
 xOZ5Ch8YIZxfpxj5LKLOeF9nI3xewmv9Z3EWMChXhr1pP/XhEHpCLeSKPsBuM/VYgD+ISGzbkdx
 WUP+rNT/OUD3dFg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Oct 2025 12:44:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7857

Added in OE-Core commit: 5f4875b950ce ("distro_features_check: expand
with MACHINE_FEATURES and COMBINED_FEATURES, rename").

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 40232ba0e..33da2286b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7940,6 +7940,16 @@ system and gives an overview of their function and contents.
    :term:`REPODIR`
       See :term:`bitbake:REPODIR` in the BitBake manual.
 
+   :term:`REQUIRED_COMBINED_FEATURES`
+      When inheriting the :ref:`ref-classes-features_check` class, this variable
+      identifies combined features (the intersection of :term:`MACHINE_FEATURES`
+      and :term:`DISTRO_FEATURES`) that must exist in the current configuration
+      in order for the :term:`OpenEmbedded Build System` to build the recipe. In
+      other words, if the :term:`REQUIRED_COMBINED_FEATURES` variable lists a
+      feature that does not appear in :term:`COMBINED_FEATURES` within the
+      current configuration, then the recipe will be skipped, and if the build
+      system attempts to build the recipe then an error will be triggered.
+
    :term:`REQUIRED_DISTRO_FEATURES`
       When inheriting the :ref:`ref-classes-features_check`
       class, this variable identifies distribution features that must exist

-- 
2.51.0


