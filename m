Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A89CC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 07:55:41 +0000 (UTC)
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15874.1782806140181843737
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 00:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=mF5PizhF;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=I3fnl9MV;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 2E925EC01A4;
	Tue, 30 Jun 2026 03:55:39 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Tue, 30 Jun 2026 03:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1782806139; x=1782892539; bh=/c
	VqRhDQQPgz8yTmNQ583tYjRyoqVkDmiSHSd7spEzs=; b=mF5PizhFOdY/dO8NnZ
	uU5HVKl17/7S7F9N9Ix3uOA5UUMhV41HhFfMQIsbldsTPHogYfUM27RHlKmyFDZr
	KpmoHG2bZXKGwHaWM0HBvZRuQckG2zglsseXgfJ9D7beuEYDv7mWbWc8Pz/+1gkP
	7UpJ1eT1hW7Kee9hHg1soxvJ2mfOjSImhaNZrwY5MgMZPI7SRD1XViHhQYogH9TF
	HzJVjmfwy4DyTbTRS3jGqLvwDutSJf6hPF/8YgQoURAZaDRL0rvROvYSpCjvXkiY
	EKuufFopqpTKQqkZcB+Fpl6AcyMRN1u1P9z4rmlyYfckGXcdS3VjGpvRm9tuGgM1
	RQHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1782806139; x=1782892539; bh=/cVqRhDQQPgz8yTmNQ583tYjRyoq
	VkDmiSHSd7spEzs=; b=I3fnl9MVXCkm9ZIlfvaBmIso5MeCq8iAVHCNybR1bb2Q
	cp61yGdRcPdE78cgcV5wZ62cwDOfKvdWsgBtIhD3j3YykEBzo90RCwuCYLL2Qi9/
	RKpjgzfwkQwwkUiObFutYzVlgBaJd3ZD+4+3KqPWelvEWMhY/idIcfEK3rPjGdQh
	aW78tmuL4HPppMKCNhYw5wWLZEF0ltQzb6C9zoKeUOE6o6/2iDCGspBkFvtmSbt/
	7sL27Rptn31qSvfvy+00up3JxXsKuYAxqWu/B4bs2QLkbXkidzoaU4FMeH3dnbUy
	qvfIY+MXZgDK+5COEYNHitZqca/tVSXkpGtGXzbRtw==
X-ME-Sender: <xms:enZDao5n_reeWbz59LUN84Ky7qWFUjpPryuxmAhAHDrCwLx7Uau8xw>
    <xme:enZDav5K11srZRCR3fEV0-vD5k0h5ozdDE3W2vInlqFGFn8ELQl75qHcEW7ojgwNR
    mYK4C9dY7LvYBvzzFqUaNl3mnljwbKn1keeYMdJAUHSTHrj34cWSgo>
X-ME-Received: <xmr:enZDalEYfCL0Cs-L1iTMHTWAdOJhmRAQYiktBRDGuJe7vq5tyrRIn75YOdh02YhWhZ9prDPWL338UKyHtwzKmCV_XagZi68>
X-ME-Proxy-Cause: dmFkZTGAtad9gZFmexQD3um2DMOv/oTBYRPONfs/FDUiogQIsK37geQW6SIeUPZpmaroUG
    aQax15iEdaGQDM1+n9rX5qL2Do/C//OFY43Wtn/xBdiibUNJsgDzXgTNR61VHNOo3mhTPC
    ZAJK1H4hjxJk5LDKk7BWHR/Iy1pPMSMlwSqsCU1CyL2312C71OVUdCJWc4SYgi+ageXiYt
    iswmIFS5MrE9XUETBtxa2cUAl2Vv5b/fNRucJ0nqQE42RqnSdx/lkfmKWILoDZ0adl5+Hl
    R9drUUp+2wLa05vhYXsoQOYElE9waVHBspSZhHdxlGn/Kq5kNeOl7ifT1z5HX0vqiOOrXl
    ChgNAqwjGr4g0GfP2XzWJEwDJ1vFeD77ViTMaLpz9XVe2DECs0IgSrfDpPDpx6jCS/J0kV
    BB5g3O9i7fV1DhAG9PZxllkKDl9bbMuoEYU9JyafLPecRDgUVcbHRUsy2yDHBgayhoGcnj
    zTSkkzFgAa1uirfp3K4kytH6RTpMptvs9yEPHmeFRz/b2cpfi4cTWKgQ9A7qvvMAPFHa75
    EySu2gFypD3maO28/hBIfWM5366aGeP71hWtFsTEOlDqlnJQDi12mgN17yvB3Lrfzs12Dw
    lu6FlCsjgq9VGZA3yFEmEWdD5V2NcbTjvCelvWEygI9E01hoE9ay+whIflgg
X-ME-Proxy: <xmx:enZDaoRpNf0rc8TtybDkEneicr54FQzeQcNubv3l2aNf8vaeh-k8RA>
    <xmx:enZDausCAXSxbbzcbYNGXwH8mXSLWpPww0l9ayS_BMDqCJ1BX9Z-sg>
    <xmx:enZDanxLSWUlJmVcO6tcPxvAP2VAJFM6dWMqxg0TaLgbJwdSvcdu4A>
    <xmx:enZDao4-6_PV0Ed6dEeg6plgFI9Ns087pVDgr28kqbGCzwjNsGOdIA>
    <xmx:e3ZDarccYsuwKB0iVZSVavTUiGn_gt4PP_oow2AhCaxbfg5tCjIw_UTC>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Jun 2026 03:55:38 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Tue, 30 Jun 2026 08:55:34 +0100
Subject: [PATCH v3] recipe-style-guide: Clarify when License-Update tag is
 needed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-license-update-v3-1-b91ef480c929@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAHV2Q2oC/3XOTQ6CMBAF4KuQWVtTKj+FlfcwLgqdyqgB0kKjI
 dzdFjcaY2b1kjffzAIOLaGDOlnAoidHQx/CYZdA26n+gox0yCC4KHjBM3anFnuHbB61mpClaHK
 eGWmEyiEsjRYNPTbwdH5nNzdXbKeoxEZHbhrsc7vo09j7i/uUhSm00jlWDVfiODbK3tDuNXqIv
 BefQPkDiADIstRVeE9K5N/Auq4vZVyODQEBAAA=
X-Change-ID: 20260604-license-update-1ef504f8f2a5
To: docs@lists.yoctoproject.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=rzbLLh6m/+L2DVRYqyEGajB6N5NP5/6/xnc5ISbgPZg=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQ5l1WxprIwxe7leFX34lX2/PNOzm8uHfxxq4orpNT5P
 PMhjklsHaUsDGJcDLJiiiybe77ef9rryJsRcksBZg4rE8gQBi5OAZjI/AsM/8z8T56xur1s6ssN
 Fg010rn/v/Dm2s8Tqdklcq/7yiQttf2MDC17GKNck310FvRzclwPnL7nuk6wuv7MxHPyhZ5xRlt
 LGAA=
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 30 Jun 2026 07:55:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9981

As discussed in a patch review call, we don't need License-Update tags
in commits where the upstream license has not changed, and we are
instead changing the LICENSE variable to fix incorrect data.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
Changes in v3:
- Improve wording as suggested by Alex.
- Link to v2: https://patch.msgid.link/20260607-license-update-v2-1-877d92a588e0@pbarker.dev

Changes in v2:
- Link to an example commit as requested by Antonin.
---
 documentation/contributor-guide/recipe-style-guide.rst | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index e5b77393f082..f81ffb2abc55 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -268,14 +268,19 @@ License Updates
 ~~~~~~~~~~~~~~~
 
 When you change the :term:`LICENSE` or :term:`LIC_FILES_CHKSUM` in the recipe
-you need to briefly explain the reason for the change via a ``License-Update:``
-tag.  Often it's quite trivial, such as::
+due to upstream making modifications to the license files, you need to briefly
+explain the reason for the change via a ``License-Update:`` tag. Often it's
+quite trivial, such as::
 
     License-Update: copyright years refreshed
 
 Less often, the actual licensing terms themselves will have changed.  If so, do
 try to link to upstream making/justifying that decision.
 
+The ``License-Update:`` tag is not needed for commits which fix incorrect
+license data in our metadata (for an example see OE-Core commit
+:oecore_rev:`6c8b76d240d2457578a58787121bc5873d724ee2`).
+
 Tips and Guidelines for Writing Recipes
 ---------------------------------------
 

---
base-commit: 4562ba19f36e54099bcae82cec8a70deb1c23aa7
change-id: 20260604-license-update-1ef504f8f2a5

Best regards,
--  
Paul Barker


