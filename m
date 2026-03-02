Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1111E9B349
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 09:54:23 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157074.1772445261806855654
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 01:54:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=pyJOrM+I;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 44C224E424D9;
	Mon,  2 Mar 2026 09:54:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1C7D05FE89;
	Mon,  2 Mar 2026 09:54:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 536FF10369549;
	Mon,  2 Mar 2026 10:54:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772445259; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Xuqol0ZQiAqLweUXuy6FpsF1s3nVUSnXayCKbtNrbPw=;
	b=pyJOrM+IXR9BdRJhZsLTo1pyeboTKsotptxO54XI7M5q2C3rexswjPUnKC4MUZ51h1IWrZ
	yXyt0f0j3X/8llK4ibk3zTQesAn7hgQuFHBWGfuNqEEVjkHQByDouh3G3c12HagiVLo3BT
	kitHeRdSKlUfTWYx/7b/y0RLmMhwib/Yp+44WPld9vb6S/zlKbWZ7ndIE4UlGgCK3Y0g+S
	7269NxA8EbJ8UNR/64KyNFfbG6VgwzulZtMOKTqoDyBy0MkJYEGNyF5QioTNwtYvfli/DZ
	LHSnH9HD0fgewo1lvlFz1nz2G/cRIH4G+1kuBFToqP8iSOl/4fFg6tl4PAi3yA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v5 0/4] venv migration for docs, migrate Debian/Ubuntu to it, fix epub and latexpdf targets not finding glob images
Date: Mon,  2 Mar 2026 10:53:38 +0100
Message-ID: <177244519666.106718.2188056105776907641.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224-fix-make-multi-target-v5-0-7ebf281618b4@cherry.de>
References: <20260224-fix-make-multi-target-v5-0-7ebf281618b4@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 09:54:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9032

Applied, thanks!

[1/4] Makefile: use python3 -m sphinx instead of sphinx-build
      commit: 8354f3b5b91828db8ef9b7f6bdc120a95df893af
[2/4] use a venv for installing packages with pip
      commit: 16599c4f65d451c47104e7604b68a0658d25ac48
[3/4] consistently use pip packages for all distros
      commit: 4fbae014790373ec2c662325e54cf7f07f507dbc
[4/4] convert SVGs to PDF and PNG using sphinxcontrib.rsvgconverter plugi=
n
      commit: ba351b35480d9c06c870a6f34d8bdbc1856b9511

