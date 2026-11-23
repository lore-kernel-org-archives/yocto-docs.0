Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50514.1795423735779900188
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2026 00:48:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fZJVFQNx;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5C60E4E416FA
	for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2026 08:48:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A7CF5FAEB;
	Mon, 23 Nov 2026 08:48:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4AC5311E68029;
	Mon, 23 Nov 2026 09:48:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795423732; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jy8xQPph/NtHOW0UnRpf+KTJJTPpg9wcJNlO/ToKbTk=;
	b=fZJVFQNxjpTLTi3E7HcwVbNV1gdYK92Owa5mR+VpJCFXhkecZFl3tHQMxQNHCLILcBJss5
	b+V+wz/qlixs+a5YI2tGrB0TzmpMMr/dGBfOw0iWnDWxfKOPs7Hx7iykvapru/yfWa9MWr
	QKhRyEzzTtUw/ZftqvcMDRCO6g6C4zexJHqJlHfbKXFxU3V2GLYGJMIGTjyh6uGWGTrPyG
	hfzUDCg5IVGyGhRiQAKZ8z8fajawLPP7mrB5ddg9CpWEYsAqiy7zD+NmO15rx+AcPnKfqi
	RvfIadGE377Wl3IUNv3JrfKq9IaLkrOSQLo8Jt10HRYvsLOf0MVweHYEIrK0HQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 09:48:51 +0100
Message-Id: <DN2GLFQMAK3A.ZD9E1I8PU6JV@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 3/8] conf.py: enable the sphinx-tags extension
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
References: <20261028-tags-v1-0-d5ad01019eae@bootlin.com>
 <20261028-tags-v1-3-d5ad01019eae@bootlin.com>
 <b2f3e59f-32c9-4039-aad4-e9218e8d669a@cherry.de>
In-Reply-To: <b2f3e59f-32c9-4039-aad4-e9218e8d669a@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2026 08:48:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10823

Hi,

On Fri Nov 20, 2026 at 6:31 PM CET, Quentin Schulz via docs wrote:
[...]
> suggestion: set tags_output_dir to $(BUILDDIR) (maybe /_tags also?)
>
> This should allow us to avoid having to update our Makefile and=20
> .gitignore? It's also where we put build artifacts so it makes much more=
=20
> sense IMO.

Makes sense, I'll try moving the directory there

Antonin
