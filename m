Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCB7D59F5A
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 17:36:58 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.51844.1730914608192207136
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 09:36:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GFNCGJgN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B36E60006;
	Wed,  6 Nov 2024 17:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730914606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uuvhvmxWe9HmAMF7j3ZA1aJGr9JeV5LiQZrPPaqnCsE=;
	b=GFNCGJgNoBSYVP3/ITWgISv2xBgqS+k+KckqJpX+hO7OW8SR65NbyCICo6pnIUcFzqP+hv
	q9Y6rkUhwLVyjnkl+BgRJoVjNb8OZ5TbsolA0XRsTto0xHb3KlT/lyOeA5oRdDasa0xGRY
	WJBMSZ6vQEAqqzHDRCLn/qgYyWqguNLTB4K7Mt6c7De89AaTSrnRCSe1IQSWgCZC94fAB0
	FTvRegu+7vIvUPBIo1HGKt3rcSykWQUSJlEXdZtE9sXzrwn5AAexbtgzbODwQVnVPEbOyR
	Dqx8tv+XA1kr7FanReJQUke6KvA0mjBiZnUDVX/AKbm0iVgzGZ771tUxkS6aeg==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org,
	Julien Stephan <jstephan@baylibre.com>
Cc: thomas.petazzoni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v5 0/3] Add bblock documentation
Date: Wed,  6 Nov 2024 18:32:51 +0100
Message-ID: <173091428259.147774.323049793610292925.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241106-add-bblock-documentation-v5-0-625806c6a3ce@baylibre.com>
References: <20241106-add-bblock-documentation-v5-0-625806c6a3ce@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 17:36:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5710

From: Antonin Godard <antonin.godard@bootlin.com>


On Wed, 06 Nov 2024 14:54:44 +0100, Julien Stephan wrote:
> The main purpose of this series is to add documentation for bblock.
> 
> bblock uses internally the 3 following variables: SIGGEN_LOCKEDSIGS,
> SIGGEN_LOCKEDSIGS_TASKSIG_CHECK and SIGGEN_LOCKEDSIGS_TYPE which are not
> documentated, so adding them to the glossary.
> 
> I also added "sstate" into the Yocto vocabulary to avoir error when running
> Vale.
> 
> [...]

Applied, thanks!

[1/5] documentation: Makefile: add SPHINXLINTDOCS to specify subset to sphinx-lint
      commit: 3dfe7b5c746af31de74f67cf88214e5d52bdb65d
[2/5] README: add instruction to run Vale on a subset
      commit: 262237f72534c983e178231cb6839ed69709c443
[3/5] styles: vocabularies: Yocto: add sstate
      commit: 1c50726296e876747ea3f862729e953f025ce619
[4/5] ref-manual: variables: add SIGGEN_LOCKEDSIGS* variables
      commit: 32e3995bed2836f549866ec3b8ad254bdda37dbf
[5/5] dev-manual: add bblock documentation
      commit: a082aa39840587d3af6c3f4a2c2747564ca37414

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

