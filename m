Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA437F8D742
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 13:52:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14649.1776347530534537039
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 06:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=aNQIL28o;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 57CE7C5C3C9
	for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5861A60495;
	Thu, 16 Apr 2026 13:52:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB3B21046088C;
	Thu, 16 Apr 2026 15:52:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776347527; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M/ssVDCvn+CPgfps/pfQaAucpFc4L6wkVZRtmqdmNu8=;
	b=aNQIL28o9T3WQ52iw0pkWhTLldTjtdffMVge9y1Xbp6vxl4q/MRA70hLl2a0DUlIH9IcNx
	l+pyhRFNCicgn0Xys1HxbowY3OQRlXygzlCe4pcrUw4wAxoYJfvQIiRbDVKfgOly9Pv8de
	GagDHFZNtwneUGDdf9c20MUDF3falt9nWIsNHJjE9BuDNaXj0MubIKu8NyaLrxeLKa98kX
	XBryj63Zr6mcrfL9NWX8saS4XFwFNxx5/30miexWmdnDlyPIQvlRlkuxuHfTsKRuhSBNoq
	UDCrrBy+u9ZE/33BYil15pCFJ+t2G2BBX0LNJPuBCtaHCZjIrq/GTImfDrTZWw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Adam Blank <adam.blank.g@gmail.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2 0/6] (no cover subject)
Date: Thu, 16 Apr 2026 15:51:03 +0200
Message-ID: <177634729836.75801.16319872374288571364.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410-staging_and_packaging_vars-v2-0-211bce1349b1@gmail.com>
References: <20260410-staging_and_packaging_vars-v2-0-211bce1349b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9263

Applied, thanks!

[1/6] ref-manual/variables.rst: update STAGING_DIR's description
      commit: 0ff189fcb82f5e845951c939197835d0a1daf87b
[2/6] ref-manual/variables.rst: update COMPONENTS_DIR's description
      commit: cad256411e2bc380e27e2fc4ea3140476596c823
[3/6] ref-manual/variables.rst: update PKGDATA_DIR's description
      commit: a1432f24c94a26b372164704cf18b3c6a73b34f5
[4/6] ref-manual/variables.rst: update RECIPE_SYSROOT* descriptions
      commit: eeb22235d5310ed440692914851df0b7aac056a4
[5/6] ref-manual/variables.rst: update STAGING_DIR* descriptions
      commit: 15bbfeee88eee706e06b63116c9bf0cbfb2fd91c
[6/6] ref-manual/variables.rst: correct a reference to STAGING_DIR*
      commit: 2da8e6334e3d3362c9177f78a1216156417903fc

