Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAACE77190
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 12:17:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.150620.1734697027441262253
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 04:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Tfhilqo/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA7D54000E;
	Fri, 20 Dec 2024 12:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734697026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3INhU/8EjL4ukmHE/ItzaONQVbcodTIMXHcRb/c0lCw=;
	b=Tfhilqo/WFb6KiZ+bkYOPy5D52yl0dda6TCpi1iJj02++g95h0wQy9azfFmbR+dIuDwB/Q
	mCXTGXpFkLAjljHrgPFKEXmm1BHWBRUhFgKrTXFhsZByw8NOtLEYpu1WAOYqORvTCaOhYY
	l4UmsE72xy3HP34dzUNYPUm/n4NYZVp/h+Tc6jMyHifjnmoAi2KOibqm68HQ5N1Ip8f/r+
	sF+jKgvK2Ywr59jZa2al3cLYWnBd+4Fz1t5RYknvoY4P5b5LAZuyXzue9dtseNv49Rq2Wr
	dUuVpYBZHGl7dR50J4/N9p5HKkBjojQM00FYpatb39Txeob5+3d4ubNYc0nkxA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Dec 2024 13:16:36 +0100
Subject: [yocto-docs PATCH v2 09/14] Drop support for
 BB_DANGLINGAPPENDS_WARNONLY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-release-note-5-2-updates-v2-9-df29527f3fc5@bootlin.com>
References: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
In-Reply-To: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3967;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=DtH1adumMW9O5KN1w5y6dFtM4TesqJ0xKdYYv8yuS9k=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnZWA/FJiY6iQnZF/rBtsEmBlIfrUlAtb+i4gwB
 3e+sR4LEySJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2VgPwAKCRDRgEFAKaOo
 NkaHEAC8CoIi3XNekpYS1wsr6Nyie4pzGqxMgzgzVWC+3uaBLIwlq0Instwsois3VXtOS2+SJq4
 APM6thfH4l6QVayvzmKEPUZEonS+Etz3WJwPgOfq112OpPw6H/n58yh87CHvRlo6s4QAcUN8YSi
 6/P1WauCOFdK4hR2jUsW3zORFEwAyeOJsCscp0ODz/nfQirF/pMr49AOrcr/9tz9oo5E1CCb+3r
 b4qvUBrVOMyXWIV2N7l2q5UgTuGOofNA8rUwomnBWKnYzLT314uIWQ0upyxyiRW1qEXIDX/+Q91
 448a1Jwd0ycQV/Opwi+HWrFC7QMYEZkwGw4Pm7GjKXdm68wGtVo/c0ZQnfpq8bG6LmmD0Li2j0U
 jaTuUA6JeFU70uFOMhI66I6oNcNzV+BH7wSAyHZcI8LjXRnroYei/k6BcTL+1hhBflfmiw+IbuO
 nQR37JP2QzYg1ni/0+Uca3faRMgUk9xk1c5zpN/vFQcXSY1S2aTQms2ahI5ecNQX5oPgZ0vbS8a
 uJQa1fuL++zMV3OlCUzf7m6wt+zNrvhcuOGRSRwfRRRAh3AZr4z859DuhTOP918AiXasskdO1nP
 JkfZwPzoycM8kzmsCSHHI/qwS7ugKMS/fdAwtpUC/H6ieUxIuXfCDvGNMcbB9eTkn/sLocWQ4GP
 EExjP8BBohTdGCQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 12:17:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6007

Support for this variable was dropped in BitBake, see commit
fca9c9e3cb6f8e9f99bf51dc5e8a8d83f4c84c69 ("cooker: Drop support for
BB_DANGLINGAPPENDS_WARNONLY").

Drop this variable here as well and rewrite the "Appending Other Layers
Metadata With Your Layer" section to advise to rename the recipe and
check if the bbappend is still relevant - otherwise to use BBWARN.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/layers.rst    | 22 +++++++++++++++++-----
 documentation/ref-manual/variables.rst | 18 ------------------
 2 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 89c84669337c9ecdc90110fdf34b7949459a1b9f..c649e2bd60fd1d7114e6444d94b3c91e1f719f13 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -470,11 +470,23 @@ corresponding recipe file. For example, the append file
 means the original recipe and append filenames are version
 number-specific. If the corresponding recipe is renamed to update to a
 newer version, you must also rename and possibly update the
-corresponding ``.bbappend`` as well. During the build process, BitBake
-displays an error on starting if it detects a ``.bbappend`` file that
-does not have a corresponding recipe with a matching name. See the
-:term:`BB_DANGLINGAPPENDS_WARNONLY`
-variable for information on how to handle this error.
+corresponding ``.bbappend`` as well.
+
+During the build process, BitBake displays an error on startup if it detects a
+``.bbappend`` file that does not have a corresponding recipe with a matching
+name. To handle these errors, the best practice is to rename the ``.bbappend``
+to match the original recipe version. This also gives you the opportunity to see
+if the ``.bbappend`` is still relevant for the new version of the recipe.
+
+Another method it to use the character ``%`` in the ``.bbappend`` filename. For
+example, to append information to every ``6.*`` minor versions of the recipe
+``someapp``, the ``someapp_6.%.bbappend`` file can be created. This way, an
+error will only be triggered if the ``someapp`` recipe has a major version
+update.
+
+Finally, another method to deal with these errors is to use the variable
+:term:`BBMASK`, especially in cases where modifying the ``.bbappend`` is not
+possible.
 
 Overlaying a File Using Your Layer
 ----------------------------------
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5d24e8086588a0f8ff69db2dc060f68056d4cee5..5c2920603fbf12657ab8f84dda027b8f26a75ce2 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -361,24 +361,6 @@ system and gives an overview of their function and contents.
    :term:`BB_CURRENTTASK`
       See :term:`bitbake:BB_CURRENTTASK` in the BitBake manual.
 
-   :term:`BB_DANGLINGAPPENDS_WARNONLY`
-      Defines how BitBake handles situations where an append file
-      (``.bbappend``) has no corresponding recipe file (``.bb``). This
-      condition often occurs when layers get out of sync (e.g. ``oe-core``
-      bumps a recipe version and the old recipe no longer exists and the
-      other layer has not been updated to the new version of the recipe
-      yet).
-
-      The default fatal behavior is safest because it is the sane reaction
-      given something is out of sync. It is important to realize when your
-      changes are no longer being applied.
-
-      You can change the default behavior by setting this variable to "1",
-      "yes", or "true" in your ``local.conf`` file, which is located in the
-      :term:`Build Directory`: Here is an example::
-
-         BB_DANGLINGAPPENDS_WARNONLY = "1"
-
    :term:`BB_DEFAULT_TASK`
       See :term:`bitbake:BB_DEFAULT_TASK` in the BitBake manual.
 

-- 
2.47.1


