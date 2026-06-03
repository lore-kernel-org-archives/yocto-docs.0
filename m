Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8831ACD6E60
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 15:29:40 +0000 (UTC)
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22916.1780500577306684105
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 08:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=yX757uit;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=BdXAJlR4;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 646871D00097;
	Wed,  3 Jun 2026 11:29:36 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 03 Jun 2026 11:29:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1780500576;
	 x=1780586976; bh=s+TouCEEneysuQhJHL/U9vyuZiAARsQty09vr1F+XY8=; b=
	yX757uit8S/bmFidsxAminRsm8TIIsRlcu4VOVtEvh6i0aARA+3TGdpEhOCIO6Bi
	DI4g00dMZPMVCQhSWY1gVkN0BygVTlHRyXBXofRaqDJjXhVskM2LApVQH0nC70FM
	0KerQewJPCVLqOT2qbbg2iww5keCkaBAjh7B8E/wgMLiq2B8tdXkAmNsFrEERps2
	7SX2JfT3HgZqpefy1JSgpVbnK998ENd1zSRDz/W6nySf5jLVGCOLdEKuzJ6+XdKn
	p0Fi8uIlky5EQfYEUo5uPYpn0lPaKGrEXlcMsTRLU8jjAuxMSTng4CPI0lWTFD7D
	+xQ+wt3hW2TjGXtmNyv9Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780500576; x=
	1780586976; bh=s+TouCEEneysuQhJHL/U9vyuZiAARsQty09vr1F+XY8=; b=B
	dXAJlR4OuES0y5eNLS4RZFCS3xepNYlMY5RGHVPtD05xi6rmXVzAGKMuzBJbJC+d
	wPaffaR7xlS9QWYdpeEoU7fAWIUJ5PEaN/Yk7fSTQH0KaKqdQAm00KqjCedlKrcH
	rWibeESlpNO9tjcFbwXguljAdfCVnbs7Bi57K91QHZ+nNfBq6tj2LqoXGKkRBWLj
	lt37cLK+6uGZmGuHii14FkNmCRkNRJBjfJdFmn0eUpKwlWQn1Lz4trHGRpkaUbK/
	eDS3+ckVVJB7gm6L+Md7U9Gkdcakb7YdlrTRnP+3JvV/I0e4NlkCIkpT37Y5TH60
	CB2/f5vqznZYxbjsVdfGg==
X-ME-Sender: <xms:X0ggamByqU2YE29OLp_yWfxxtGmR2_aVYpxyhC0IIAvtILRV_Ohz7Q>
    <xme:X0ggamiS-9bcT73__evAoFxzy-HaQn3726cD4jj0IKTCDamtSIvLLO1RA9Rj7_BGu
    6MvlA5KJWYs0KnaohB5DvjYAkJafxjnEjcbno8IcP-Q5NCHYmmtDPQ>
X-ME-Received: <xmr:X0gganO8z-o0yZvyOwf1c0lXFybeWY3Zz-J6gsOf9tpB75NTk_9GlxGG6KmeGUiIFTttAuuDrXyC3csT5uvWFCY7DvhGEg4>
X-ME-Proxy-Cause: dmFkZTFejbdmsnFrmC5Qo+Oro37suTfnuZMClBq/5SiV61IbKprAnLynKAdKXdKTKuH6ra
    fcBJFunLbkVo2P/N83z8ngdda93mFU5bjN+hWw72mJtqyA69rG+a9OF/5Cp3u9ed/EhBMn
    iH7yoUDkyFplwdjkQnJs6dZfMu09YIdxWTxWEWdHvM2MXpHnbwHwIhuQ7BXh+NHpDi6rQG
    MqZHrHeuG28QtwrLiIdeKnhgkcqN9IrylUemD60srH94IsdUsbxqOuLMsAFnfc1uqkBtwy
    BI9lEaq4a9WkzsEaHWo/9nktmQqNwINx5tC5U2MdjhE3wjft7gdWKcZeMMz4wShkuyMNLz
    PFCLCQ5xZutlbZ9eCm8ug/q+Ry2wzSx7xPHPLfoz3qTIiylqwdLWR0XhGGxzzvd+n5gX67
    6bgyeaapgWphQnGVNl0PNgtFZXES1Kh7uwGSMEtHSGrEvRTLwdyBCmbGoAGVBpnqgICOUx
    ZMgLOjlQdzrbzFbgWnhYqHIfw32rdf0XyRfmOIch0iSL/3dbKMDn0aXKata/BcJtYY0lHa
    tpvDRDZN9aRnmeixE8Sav9Wt0ixbLkr4GCJRCFjnFje4S67i2hjYOC0Ln/SkjQx/h01ggj
    f5EprX3wxi5kGEO+T/TD91uZeNb2VcxrDtyWTaZtXlOfFxSEd9dDB2qiUipA
X-ME-Proxy: <xmx:X0ggav7XoDm--rvfbAryUs0D7KBcJil-TrdPVPEfoqCKifa9f8p_Cg>
    <xmx:X0ggat2oeFcd-QHfgpyyVvc3l3ZcDoc-euvGx5lPhlVFHhTc5_Dq5w>
    <xmx:X0ggaoZfapX7P97H5KfG287t89VCS9sIA-YkvhBfsGA81RL3oJcf4Q>
    <xmx:X0ggatDCOU-qNkjjmZgp0pF-eYr1z5CNigMoex_hxJJqsxAPrZlAHg>
    <xmx:YEggaqmjrVgmh7RhgNXHJhPzhptnMAjLuDlRn1biY8ab_s5Ag6ksDtUw>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jun 2026 11:29:35 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 03 Jun 2026 16:29:22 +0100
Subject: [PATCH 1/2] security-team: Update membership list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-sec-team-v1-1-ffb2e8965875@pbarker.dev>
References: <20260603-sec-team-v1-0-ffb2e8965875@pbarker.dev>
In-Reply-To: <20260603-sec-team-v1-0-ffb2e8965875@pbarker.dev>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=7pR4/mSzYjhdqMgPg3KtsbUo7lpqKPy5EanbvKvjl68=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQpeMSWeLC7K4lt/GDo4vzVtEu5emev0K1fS71nrNt63
 UwxUe5aRykLgxgXg6yYIsvmnq/3n/Y68maE3FKAmcPKBDKEgYtTACbCVsPI0HGU9+bHHccl/l2p
 cvCq99LbUaG6eN/UTpm/s6rMnBZvLGf4p3SbXeDVbtl/P+oqHReUKDcunbLpSbCM9aHfnZ4Lpn+
 bxwIA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 15:29:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9564

Steve Sakoman has retired from the project. The TSC announced the need
for a new security team member and nominated me to join the team [1],
which was then confirmed after the nomination/comments period closed
[2].

[1]: https://lists.openembedded.org/g/openembedded-architecture/message/2352
[2]: https://lists.openembedded.org/g/openembedded-architecture/message/2375

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 documentation/security-reference/security-team.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/security-reference/security-team.rst b/documentation/security-reference/security-team.rst
index 776dea5689dd..f8fee56b73df 100644
--- a/documentation/security-reference/security-team.rst
+++ b/documentation/security-reference/security-team.rst
@@ -107,4 +107,4 @@ information in the subject line.
 
 -  Marta Rybczynska: <marta DOT rybczynska [at] ygreky [dot] com> `Public key <https://keys.openpgp.org/search?q=marta.rybczynska@syslinbit.com>`__
 
--  Steve Sakoman: <steve [at] sakoman [dot] com> `Public key <https://keys.openpgp.org/search?q=steve%40sakoman.com>`__
+-  Paul Barker <paul [at] pbarker [dot] dev> `Public key <https://keys.openpgp.org/search?q=paul@pbarker.dev>`__

-- 
2.43.0


