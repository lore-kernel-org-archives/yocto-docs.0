Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A14CD6E57
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 10:10:22 +0000 (UTC)
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7961.1780567812975933559
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 03:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=MnlVo1cj;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=kkVgXydw;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EFC9414000F1;
	Thu,  4 Jun 2026 06:10:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 04 Jun 2026 06:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1780567811; x=1780654211; bh=qx
	x1nM1SPIqd7CqEZ82K9/9AJRMKhd6GQilidA9LAlk=; b=MnlVo1cjomFKHzaQSX
	lHEVypd/Ih9DfkFKTkUSBc7/pXKM8HA3joXHIqga0nkeqorBde+J3W08ChdpVJQ/
	kuCfNx297kwNQ6E0kevbvMyYspWFZINkh/Gj6KnKfC6gQBdZUQSRTASrU+Qa9pCT
	S0zwiA2BC5MpRfPDEcmnXyUM9c4uKNSnl8Aj7PS88xFJ9RWPod/tHkoHk/ZxKb60
	/dH4MoSk+wkx8n7GQrrDZQVSZREiLTCWk0PfeqNkXgnyufe/DnjGF5ccSzmZUjtJ
	bNi2d4epXtbZo2FwD2O8A5WW7MC+Ju2AWE5CqBN27DjdF/9ny07vyxDWmL0xu24f
	dUvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1780567811; x=1780654211; bh=qxx1nM1SPIqd7CqEZ82K9/9AJRMK
	hd6GQilidA9LAlk=; b=kkVgXydwMtgLpVxWAih94dhj4/30G5/OoXlzQ//dJvDc
	EfKeDhBzEAZv9KaqHKw41TmD8aoPvyV8YTeisH/qnHnJpvCBUgCro1PzEF85I0rN
	6QqM7GFhJX9v+Xdsj14UrMR3wXYTIr0FU9uo9C9Jmm+H5x7VBV3xCYIsF8Qccj1x
	YTXrTtMmQosZFi9+0TUiCcWWou2arG2PQqNXHghlp2Dc1ocKiTK/k/G1INgMjtYG
	zcpgsqI97rXIAhV6OgGXJMOH6uUOTorKNZStOqu9IiXEbAmihRShBL9RSyPJlfPM
	lOfHXjlYMpZ6hSTNPfoBfHj0ZAeoACSa2Lt31ShMRA==
X-ME-Sender: <xms:A08hapU5JR_fyEIXWoa4GNR467QBjW-TT7wjxl1qsKe9jj0Byw869Q>
    <xme:A08havkBhdiUqS_zyQv6cMqHBLwzj5jpv__i4pag8NjV6w5fv0PLTbEnSnla9-o4K
    OltoBebc9Fmlif3Tca0xHvYh5YF2jix1Cm3iGzY_1YOs_J1kOugb4A>
X-ME-Received: <xmr:A08hajCDPKRnaXfvQHC3W9vy2Urq7700qJqz13-Byf2A6WccEYZH3g-aVH5QcS2R6la5tdHTZx93icwvEV0JkVqo9BAVr9U>
X-ME-Proxy-Cause: dmFkZTFifL/KuPPgkn1YhkVuPz4Aa1CcEya2HK2lWCPP7WOGH0BlVenGR65jLnt2+LNoXb
    8RB4lKG7coRrKRqvQZRGTmRWhUqMzwo3RJeRV60cfNvfNtGQQCKEd+Gw3V/jKUyu9u+lUW
    cF3omFHekmn8KkHBU6S3K1C5qQUiL/R7qaxOq/MOdfYZsquiMV4gcXhNyUoFMBhiuFpK3/
    dHdZ2it2EPdBSmJ8tszIc7HrMsXJ5eOucpDqH5kULL2A2gjts3XgT6STUP0YuUgFc44S2w
    mlcAxqzBjZOYqI3rHp11MAnt8vU9nj4r5BzbmoLvTf2D5VtIucOJ+ZL8/BS4+tS07q1Tm6
    sgIkqvB51wjno8ZSbjXYodhDZm9cMNNfZeOQsTwuuf3UIwVgHxoBY+sWewqq2U9YXbFUH2
    B5puBvvkPSSWTtS0hnK5JbsIxPkub3QbREN6aqsbhT8NKQpRX1Hrr9qI15OvDt96j+GN4A
    6Y211pdoK1aPy16jz3KtzraVc6wp1QW+XbzL/kbxBeDqhaRFbrFwiG+elZ1SpDoBODWuzu
    J9aaqvOK3oz+cHuVNtk9Fn/XJ876liDRmsB5Mz+Bpj0PnzkH7S4PuYD4ak6P1z9SBtl0u1
    lYoDnxmT26jekLHVQ7VlKuLu20GTd2dvt7cfSFFEsSJRRwT5KDESVWeFcZag
X-ME-Proxy: <xmx:A08handEuwOeqi2EYYixbYDRgnvaCYs2uJSW7rpdV9_1lJk2AcnXMA>
    <xmx:A08hamKOuQ_yI_neSKh4LPYfEQk2RlEvRiwU63gHxVGIlISgOdHn8A>
    <xmx:A08haieX3UNb6e-2TIdnsQDsP59DDWuYaR40cMSJT2gypD9LEUS3sA>
    <xmx:A08hal0YrwBlCn1bX7rlSbdekYLuVOP_Ola1Q-235irz1w8l8Owoog>
    <xmx:A08haq6vcLHXB7MYTJDW9PfVoLn7azBZi1idIpomnfEl1OWfXamtSWga>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jun 2026 06:10:11 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Thu, 04 Jun 2026 11:09:43 +0100
Subject: [PATCH] recipe-style-guide: Clarify when License-Update tag is
 needed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-license-update-v1-1-16dad5e9b0a2@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAOZOIWoC/yXMQQqDMBBG4avIrBuIQYN4ldJFjH90SomSUREkd
 29al9/ivYsEiSHUVxclHCy8xIL6UZGfXZygeCwmo43VVjfqwx5RoPZ1dBtUjdDqJnTBuJZKtCY
 EPv/D5+u27MMbfvtdKOcvPowPI3IAAAA=
X-Change-ID: 20260604-license-update-1ef504f8f2a5
To: docs@lists.yoctoproject.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=+Y2s9y6Eh3DCx2B0FAKTONZWQrDaQ+z5lY1IG3UiOOQ=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQp+jNPP6u9+5F3a0j+oxdlJbOvl2/5FHvt3cuPLC4TD
 i4pmb7AraOUhUGMi0FWTJFlc8/X+097HXkzQm4pwMxhZQIZwsDFKQATWeHJ8E/J1H7ilG2/XXTN
 l7lrN25Ozyks5zu3c2XCIZ6UssVeSnMY/ge358tuL2x1VxWfkF/fconjTEuPy3NzPgYVD279iIB
 1rAA=
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Jun 2026 10:10:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9578

As discussed in a patch review call, we don't need License-Update tags
in commits where the upstream license has not changed, and we are
instead changing the LICENSE variable to fix incorrect data.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 documentation/contributor-guide/recipe-style-guide.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 79bf7c79b67b..d05a535784d9 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -268,14 +268,17 @@ License Updates
 ~~~~~~~~~~~~~~~
 
 When you change the :term:`LICENSE` or :term:`LIC_FILES_CHKSUM` in the recipe
-you need to briefly explain the reason for the change via a ``License-Update:``
-tag.  Often it's quite trivial, such as::
+due to an upstream license change, you need to briefly explain the reason for
+the change via a ``License-Update:`` tag. Often it's quite trivial, such as::
 
     License-Update: copyright years refreshed
 
 Less often, the actual licensing terms themselves will have changed.  If so, do
 try to link to upstream making/justifying that decision.
 
+The ``License-Update:`` tag is not needed for commits which fix incorrect
+license data in our metadata.
+
 Tips and Guidelines for Writing Recipes
 ---------------------------------------
 

---
base-commit: d7376cca64a0784e59d4fd60b9baefb4da2ce289
change-id: 20260604-license-update-1ef504f8f2a5

Best regards,
--  
Paul Barker


