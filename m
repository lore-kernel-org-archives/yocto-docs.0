Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CEACD8C88
	for <webhook@archiver.kernel.org>; Sun,  7 Jun 2026 11:44:17 +0000 (UTC)
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32186.1780832645525802698
 for <docs@lists.yoctoproject.org>;
 Sun, 07 Jun 2026 04:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=Y2Wx1Vzw;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=gKEkU1eX;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 885841D00087;
	Sun,  7 Jun 2026 07:44:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 07 Jun 2026 07:44:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1780832644; x=1780919044; bh=hJ
	wUNwU68mLD8qIFjHPOVQYX7dApohsFtRkjK3jf/WM=; b=Y2Wx1VzwuU7qOLeVR/
	cZNOMhV2EZrfgvLt+VHNPc17sIKALF5X3RioRR9RNJwBr0dTfdpKLYQrcpwBc2CI
	SCfL4ILe0Okxyx7QOtwhVZcvIA0DwJOGyRxrEQgEjrMLfPKMg2pjtwK8XIkloWdP
	hdSU9kazRQdmsY2qVIp1zMZY5toCxQjbY4Eyh3E05Dwb41+KfX2wt8YFzg6UN5yG
	oSWTN7wZbjW5rXEEDg1U6t2wCGAzi+Nb9U38LArKi0W6WEwAxGO6jwRqVHsYeZK8
	/qGkpHRjjZChPHiQrh/lOoammkEDjbO+Q6nWbVbhXc3KVP8oKrHMsXn1qwSRaz1i
	d1eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1780832644; x=1780919044; bh=hJwUNwU68mLD8qIFjHPOVQYX7dAp
	ohsFtRkjK3jf/WM=; b=gKEkU1eXxMuN4yvNaDeatUK8X4u2+IdXpGChAZPn4t1r
	+p3KvRLZk38ETHvnEdH/t16byHXSs+bSDv0YCg2mcEpVScit1DV/1n5WVhegnw6U
	at/WaT+5BuPmNRBzeTnCQWTxaT8ZoAnbcKVmUpcigGKlXuZyH5Ga1cXAmYFjY1JC
	phNLYRY7w1GjLRTcWN++87hxo9uAGfTHytwwsupzJDNhnFveKq73p+eVL38pmona
	uWgVHRk9/9OkbZBlTSRRkU3JMENzDi0PjA7WQKFUCj1Oknehg3CkGsAyqUv04D3j
	MOKhyT5RR+fZ7wLFa4195cj870unTnJqfY5wgBRZyg==
X-ME-Sender: <xms:g1klaoEumE0Us_hB771a3pGEPJ1iLko1Mp8jFTEfvDRUZK7grwMaYQ>
    <xme:g1klanVSE1kzMvzyN3xEayCybnSlCfv1KoNDsVCzqQyOrUR6r7yfaqdAOncBqW_bn
    Runoc-MDmfux0iSkkuWBkUgL9ZyUKIsmbo-YdAk-l5q5GsI0PVdFEIX>
X-ME-Received: <xmr:g1klavwvdPcZlZSQUn7gZh4PEPv8wzLQcXVohs7hvyWCZe1HreOpxEXbg2i5rKdLQ7--zkt9pNMSXiQq39tRXgROgxzwWFk>
X-ME-Proxy-Cause: dmFkZTGviaGuaLlkmMJZ+CRblsI36SQyVWSH2UbVhO3nA5zYL3Hf5QdzKzR/hBI6CsXXW7
    lZQ4FJzwL4hL/cwbTGPTRZ6kmFFAJmYTKcgfp74EEVwqFGcEz8/ceu6rCJ659C/Uf1roXo
    BhiB3dzrFmfmckyLBe4AdswgesxISVW268/3yRqfsaNkUmpqUp/eUSc4lI4bl7PvfC82UX
    alfFCYljsAIobY/1ufWr0bBFMhiZYwkLW416vv5NKnjHGn0ZmZX3weI0u3yhC5XNjDC9Xp
    ORVlQbVOdMksGKyiSvWznnNMsymGQ4bdw2c5TILTCnwsGx8fyzSE+99RgrNG/KQ3vqMajK
    hEnPFzvagAMwkOYMD0U2o646KxjIU7he/3/JhWk/G4bUEAb6ou4rv2yaLNVLTPf8PbepWg
    VQmS4KX1ltoM7ft+LCWZzeTbqhBD5UR8LqQarsSUCZoC4krR3Ad1nyTYLEd+fUNVl4+Z/s
    Z05T+kYiDpN5mlYr3Rhgr1AGjNr3wHNscZCB69LVxAd3aFQQqoDAd3xNtEjArH7RVM0Ugv
    M0SUsWUpTP1FF5o3U+LG1BsZkbvGOw+y4nk0JyTW98Jth9zcYs8hnrG13WDosGqXnXII27
    kpavt1+/XiBLcgyroy3TWEaNo6vOhIQ9kkMAP4GdUtuvD7fOKRkq4hw6wjDA
X-ME-Proxy: <xmx:g1klalMfv6umszg0SHlPDmvz9lNFKuklL0TUL72uLYimfWng682tmw>
    <xmx:g1klag5mz5roU0j5zervP55_s1XgKqYKaAA3yE87qM0scRpFsQydPg>
    <xmx:g1klamPzfhbBWuvHcIe6EgGWy4AGh17vbkSGyQuhXR8_rL9YPz3dLA>
    <xmx:g1klaulFkbetcF8iDDUyxhtlQ68Yz9_z3u60NG0jx9i6X52EifF-uw>
    <xmx:hFklalrNh96C3dutsc8TM4WCWMpwQvgCIvqZXNH15LRYxVrZw9tdl5t7>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 7 Jun 2026 07:44:01 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Sun, 07 Jun 2026 12:43:55 +0100
Subject: [PATCH v2] recipe-style-guide: Clarify when License-Update tag is
 needed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260607-license-update-v2-1-877d92a588e0@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAHpZJWoC/3WNQQ6CMBREr0L+2prS0EZdeQ/DotCpfDVAWmg0h
 LtbcG1m9ZKZNwtFBEakS7FQQOLIQ59BHQpqO9vfIdhlJiWVkUZW4sUt+ggxj85OECW8lpU/eWU
 15dEY4Pm9C2/1j+PcPNBOm2VrdBynIXz2x1Ruvb/yVIoc46zTODfSquvY2PBEODokqtd1/QIgt
 Qq8wAAAAA==
X-Change-ID: 20260604-license-update-1ef504f8f2a5
To: docs@lists.yoctoproject.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1805; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=KXpvcUafnuLRqPFbwJZgu39Gs8VY3/mlqNYb7AHEIbQ=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSpRjaeUT+x+k6tamrziQxrkcruY+99Vc49XWfb/WL1B
 c7jdppBHaUsDGJcDLJiiiybe77ef9rryJsRcksBZg4rE8gQBi5OAZjI5xCG/wWTxX5tkHO+ISY9
 g8Fn0lfRspDbBXtXTPPXEs0P/pBbyM7IsPvhjWU3Svvmpvz8cNDpNrf1mn+f9LfVTBR9c8vF+HT
 ibyYA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 07 Jun 2026 11:44:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9624

As discussed in a patch review call, we don't need License-Update tags
in commits where the upstream license has not changed, and we are
instead changing the LICENSE variable to fix incorrect data.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
Changes in v2:
- Link to an example commit as requested by Antonin.
---
 documentation/contributor-guide/recipe-style-guide.rst | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 79bf7c79b67b..487b5e2404b2 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -268,14 +268,18 @@ License Updates
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
+license data in our metadata (for an example see OE-Core commit
+:oecore_rev:`6c8b76d240d2457578a58787121bc5873d724ee2`).
+
 Tips and Guidelines for Writing Recipes
 ---------------------------------------
 

---
base-commit: d7376cca64a0784e59d4fd60b9baefb4da2ce289
change-id: 20260604-license-update-1ef504f8f2a5

Best regards,
--  
Paul Barker


